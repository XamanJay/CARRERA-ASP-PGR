insert into CARcTipoEmpresa 
 (Id_CARcTipoEmpresa,CARcTipoEmpresa)
values (0,'SELECCIONAR')
insert into CARcTipoEmpresa
 (Id_CARcTipoEmpresa,CARcTipoEmpresa)
values (1,'PRIVADA')
insert into CARcTipoEmpresa
 (Id_CARcTipoEmpresa,CARcTipoEmpresa)
values (2,'FEDERAL')
insert into CARcTipoEmpresa
 (Id_CARcTipoEmpresa,CARcTipoEmpresa)
values (3,'ESTATAL')
insert into CARcTipoEmpresa
 (Id_CARcTipoEmpresa,CARcTipoEmpresa)
values (4,'SEGURIDAD')

--- CARCNOmbramientos
insert into CARcNombramiento
 (id_CARcNombramiento,CARcNombramiento)
values (0,'SELECCIONAR')
insert into CARcNombramiento
 (CARcNombramiento)
values (1,'ASPIRANTE')
insert into CARcNombramiento
 (CARcNombramiento)
values (2,'CANDIDATO')
insert into CARcNombramiento
 (CARcNombramiento)
values (3,'SERVICIO CARRERA')
insert into CARcNombramiento
 (CARcNombramiento)
values (4,'DESIGNACIÓN ESPECIAL')
insert into CARcNombramiento
 (CARcNombramiento)
values (5,'DELEGADO')
insert into CARcNombramiento
 (CARcNombramiento)
values (6,'SUBDELEGADO')

-- CARcEstatusLaboral
insert into CARcEstatusLaboral
 (CARcEstatusLaboral)
values ('FORMACION INICIAL')


--- CARDNOmbramientos

UPDATE CARDNombramientos
set Id_CARcNombramiento = 0
where Id_CARcNombramiento is null


--- Adscripciones
UPDATE CARdAdscripciones
set idAdscripcion = Id_CARcSubprocuradurias
