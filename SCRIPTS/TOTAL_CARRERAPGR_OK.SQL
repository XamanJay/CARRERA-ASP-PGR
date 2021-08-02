BEGIN TRANSACTION

update A
SET Nuevo = 1
FROM TEMP_ICAP A
left join CARdDatosPersonales B
on A.RFC = B.RFC
 COLLATE Modern_Spanish_CI_AS
where B.RFC is   null

delete TEMP_ICAP 
where rfc = '' or rfc = null

--- inserta en datos personales los registros de icap que no estan en CARdDatosPersonales
---

insert into  CARdDatosPersonales
(RFC,ApellidoPaterno,ApellidoMaterno,Nombre,
Id_CARcSubprocuradurias,Id_CARcDG_o_Delegaciones,
Id_CARcDir_o_subsede,Id_CARcEntidadFederativa,
Id_CarcEdoCivil,Id_CARcGenero)

select  distinct A.RFC, a.Apaterno, a.Amaterno,a.Nombre_s,
a.Id_CARcSubprocuradurias,a.Id_CARcDG_o_Delegaciones,0,0,0,0
--SELECT a.rfc, B.rfc 
FROM TEMP_ICAP A
left join CARdDatosPersonales B
on A.RFC = B.RFC
 COLLATE Modern_Spanish_CI_AS
where B.RFC is null and not(A.RFC = '')


--- llena los datos de cardSituación laboral del personal 
--- personas que no existen en CARdDatosPersonales
--- que nunca entraron a la PGR o que ya se dieron de baja

insert into CARdSituacionLaboral
 (Id_CARcEstatusLaboral,Id_CARcActual,
b.Id_CARdDatosPersonales,a.Id_CARcSubprocuradurias,
a.Id_CARcDG_o_Delegaciones,Id_CARcDir_o_subsede,
Id_CARcDesignacionEspecial, Id_CARcCargoEstructura,
Id_CARcMotivoEstatus,Id_CARcValidado)
select 8,2,b.Id_CARdDatosPersonales,
a.Id_CARcSubprocuradurias,a.Id_CARcDG_o_Delegaciones,0,
0,0,0,0 
FROM TEMP_ICAP A
left join CARdDatosPersonales B
on A.RFC = B.RFC
COLLATE Modern_Spanish_CI_AS
where A.nuevo = 1


-- este se corre al ultimo y agrega todos los registros
-- del la formación inicial
insert into CARdFormacionInicial
(Id_CARcInstituto,Curso,Generacion,CARdFormacionInicial,
Id_CARdDatosPersonales,Id_CARcSubprocuradurias,
Id_CARcDG_o_Delegaciones,Id_CARcDir_o_subsede,Id_CARcResultado,Id_CARcValidado)
select 2,ltrim(rtrim(A.CURSO)),ltrim(rtrim(A.GENERACION)),ltrim(rtrim(A.OBSERVACIONES)),
b.Id_CARdDatosPersonales,A.Id_CARcSubprocuradurias,
a.Id_CARcDG_o_Delegaciones,0,0,0
FROM TEMP_ICAP A
left join CARdDatosPersonales B
on A.RFC = B.RFC
COLLATE Modern_Spanish_CI_AS

-- CardNombramientos
select distinct TEMP_ICAP.rfc,TEMP_ICAP.nombre_s,TEMP_ICAP.apaterno,TEMP_ICAP.amaterno,TEMP_ICAP.Id_CARcSubprocuradurias,
TEMP_ICAP.Id_CARcDG_o_Delegaciones,CARdDatosPersonales.Id_CARdDatosPersonales,TEMP_ICAP.Id_CARcTipoNombamiento
into #nombramientos from TEMP_ICAP 
left join CARdDatosPersonales on TEMP_ICAP.rfc=CARdDatosPersonales.RFC

SELECT DISTINCT count(*) as tot,RFC,NOMBRE_S,APATERNO,AMATERNO
INTO #repetidos FROM #nombramientos
GROUP BY RFC,NOMBRE_S,APATERNO,AMATERNO 
having count(*)>1

-- SIN PROBLEMAS
select  DISTINCT rfc,nombre_s,apaterno,amaterno,Id_CARcTipoNombamieNTO,1 AS ACTUAL
from #nombramientos 
WHERE RFC NOT IN (SELECT RFC FROM #repetidos)
ORDER BY RFC

INSERT INTO CARdNombramientos (Id_CARcTipoNombramiento, 
	Id_CARcCategoria, 
	Id_CARcEspecialidad, 
	Id_CARcNivel, 
	Id_CARcTipo_ingreso, 
	Id_CARcSINO, 
	Id_CARcValidado, 
	Id_CARcNombramiento, 
	Id_CARdDatosPersonales, 
	Id_CARcSubprocuradurias, 
	Id_CARcDG_o_Delegaciones, 
	Id_CARcDir_o_subsede)
select Id_CARcTipoNombamiento AS Id_CARcTipoNombramiento,
       0 AS Id_CARcCategoria,
       0 AS Id_CARcEspecialidad, 
       0 AS Id_CARcNivel, 
       0 AS Id_CARcTipo_ingreso, 
       2 AS Id_CARcSINO, 
       0 AS Id_CARcValidado, 
       1 AS Id_CARcNombramiento, 
       Id_CARdDatosPersonales,
       Id_CARcSubprocuradurias, 
       Id_CARcDG_o_Delegaciones, 
       0 AS Id_CARcDir_o_subsede 
from #nombramientos 
WHERE RFC NOT IN (SELECT RFC FROM #repetidos)
ORDER BY RFC
---- Carga la llave de datos personales en tabla tempotal icap
 update temp_icap set temp_icap.id_carddatospersonales=carddatospersonales.id_carddatospersonales
  from carddatospersonales,temp_icap
  where temp_icap.rfc=carddatospersonales.rfc

---  Pone como no actual (bandera en 2) al personal que ya fue contratado, por ende que existe en la base de datos con un nombramiento

SET DATEFORMAT dmy
update CARdNombramientos set Id_CARcSINO=2 where Id_CARcNombramiento=1 
and id_carddatospersonales in (Select id_cardDatospersonales from temp_icap where nuevo=1)


 IF @@ERROR <> 0
    BEGIN
      ROLLBACK TRANSACTION
    END
  ELSE
   BEGIN
    COMMIT TRANSACTION
 END

drop table #nombramientos
DROP TABLE #repetidos

