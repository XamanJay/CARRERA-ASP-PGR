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
 (CARcNombramiento)
values ('SELECCIONAR')
insert into CARcNombramiento
 (CARcNombramiento)
values ('ASPIRANTE')
insert into CARcNombramiento
 (CARcNombramiento)
values ('CANDIDATO')
insert into CARcNombramiento
 (CARcNombramiento)
values ('SERVICIO CARRERA')
insert into CARcNombramiento
 (CARcNombramiento)
values ('DESIGNACIÓN ESPECIAL')
insert into CARcNombramiento
 (CARcNombramiento)
values ('DELEGADO')
insert into CARcNombramiento
 (CARcNombramiento)
values ('SUBDELEGADO')

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
