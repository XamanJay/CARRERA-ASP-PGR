<HTML>
 <BODY>

 <%
 Session("UserID") = Request.Form("UserID")
 Session("Password") = Request.Form("Password")

 %>


 
<!--- Definición de catálogos personalizados -----------------   ---> 
 <%
 DIM CT_EstadodelBien(3)
  CT_EstadodelBien(1) = "uno"
  CT_EstadodelBien(2) = "dos"
  CT_EstadodelBien(3) = "tres"
  Session("CT_EstadodelBien") = CT_EstadodelBien
   
  DIM CT_Asociacion(3)
  CT_Asociacion(0) = "Si"
  CT_Asociacion(1) = "No"
  Session("CT_Asociacion") = CT_Asociacion

  DIM CT_ModoAdquisicion(3)
  CT_ModoAdquisicion(0) = "Si"
  CT_ModoAdquisicion(1) = "No"
  Session("CT_ModoAdquisicion") = CT_ModoAdquisicion

  DIM CT_TipoBien(3)
  CT_TipoBien(0) = "Si"
  CT_TipoBien(1) = "No"
  Session("CT_TipoBien") = CT_TipoBien

  DIM CT_BancoEmpresa(3)
  CT_BancoEmpresa(0) = "Si"
  CT_BancoEmpresa(1) = "No"
  Session("CT_BancoEmpresa") = CT_BancoEmpresa

  DIM CT_TipoCuenta(3)
  CT_TipoCuenta(0) = "Si"
  CT_TipoCuenta(1) = "No"
  Session("CT_TipoCuenta") = CT_TipoCuenta
  
    DIM CT_Estado(3)
  CT_Estado(0) = "Si"
  CT_Estado(1) = "No"
  Session("CT_Estado") = CT_Estado
  
  DIM CT_Genero(2)
  CT_Genero(0) = "Sin Info"
  CT_Genero(1) = "Masculino"
  CT_Genero(2) = "Femenino"
  Session("CT_Genero") = CT_Genero

  DIM CT_GradoMaximoEstudios(6)
  CT_GradoMaximoEstudios(0) = "Primaria"
  CT_GradoMaximoEstudios(1) = "Secundaria"
  CT_GradoMaximoEstudios(2) = "Bachillerato"
  CT_GradoMaximoEstudios(3) = "Licenciatura"
  CT_GradoMaximoEstudios(4) = "Maestria"
  CT_GradoMaximoEstudios(5) = "Doctorado"
Session("CT_GradoMaximoEstudios") = CT_GradoMaximoEstudios

  DIM CT_SituacionLaboral(2)
  CT_SituacionLaboral(0) = "Sin Info"
  CT_SituacionLaboral(1) = "Masculino"
  CT_SituacionLaboral(2) = "Femenino"
  Session("CT_SituacionLaboral") = CT_SituacionLaboral
  
  DIM CT_PortacionArma(2)
  CT_PortacionArma(0) = "Sin Info"
  CT_PortacionArma(1) = "Si"
  CT_PortacionArma(2) = "No"
  Session("CT_PortacionArma") = CT_PortacionArma

  DIM CT_DocumentoObtenido(2)
  CT_DocumentoObtenido(0) = "Sin Info"
  CT_DocumentoObtenido(1) = "Ninguno"
  CT_DocumentoObtenido(2) = "Certificado o Titulo"
  Session("CT_DocumentoObtenido") = CT_DocumentoObtenido

 DIM CT_Nivel(3)
  CT_Nivel(1) = "Masculino"
  CT_Nivel(2) = "Femenino"
  CT_Nivel(3) = "Indistinto"
  Session("CT_Nivel") = CT_Nivel

  DIM CT_Parentesco(3)
  CT_Parentesco(0) = "Padre"
  CT_Parentesco(1) = "Madre"
  CT_Parentesco(2) = "Hermano"
  CT_Parentesco(3) = "Hermana"
  Session("CT_Parentesco") = CT_Parentesco
 
   DIM CT_EstadoCivil(2)
  CT_EstadoCivil(0) = "Sin Info"
  CT_EstadoCivil(1) = "Soltero"
  CT_EstadoCivil(2) = "Casado"
  Session("CT_EstadoCivil") = CT_EstadoCivil
  
   DIM CT_REstadoCivil(3)
  CT_REstadoCivil(0) = "Sin Info"
  CT_REstadoCivil(1) = "Soltero"
  CT_REstadoCivil(2) = "Casado"
  CT_REstadoCivil(3) = "Indistinto"
   Session("CT_REstadoCivil") = CT_REstadoCivil
  
  DIM CT_Gral_SFPcPerfilPsicologico(3)
  CT_Gral_SFPcPerfilPsicologico(0) = "NO APLICA"
  CT_Gral_SFPcPerfilPsicologico(1) = "BAJO"
  CT_Gral_SFPcPerfilPsicologico(2) = "MEDIO"
  CT_Gral_SFPcPerfilPsicologico(3) = "ALTO"
  Session("CT_Gral_SFPcPerfilPsicologico") = CT_Gral_SFPcPerfilPsicologico
  
  DIM CT_Gral_SFPcCompetenciasDLaboral(5)
  CT_Gral_SFPcCompetenciasDLaboral(0) = "NO APLICA"
  CT_Gral_SFPcCompetenciasDLaboral(1) = "BASICO"
  CT_Gral_SFPcCompetenciasDLaboral(2) = "MODERADO"
  CT_Gral_SFPcCompetenciasDLaboral(3) = "ALTO"
  CT_Gral_SFPcCompetenciasDLaboral(4) = "ESENCIAL"
  Session("CT_Gral_SFPcCompetenciasDLaboral") = CT_Gral_SFPcCompetenciasDLaboral

  
  DIM CT_Boca(3)
  CT_Boca(0) = "Sin Info"
  CT_Boca(1) = "uno"
  CT_Boca(2) = "dos"
  CT_Boca(3) = "tres"
  Session("CT_Boca") = CT_Boca

DIM CT_Cara(3)
  CT_Cara(0) = "Sin info"
  CT_Cara(1) = "uno"
  CT_Cara(2) = "dos"
  CT_Cara(3) = "tres"
  Session("CT_Cara") = CT_Cara

DIM CT_Cejas(3)
  CT_Cejas(0) = "Sin Info"
  CT_Cejas(1) = "uno"
  CT_Cejas(2) = "dos"
  CT_Cejas(3) = "tres"
  Session("CT_Cejas") = CT_Cejas

DIM CT_ColorCabello(3)
  CT_ColorCabello(0) = "Sin Info"
  CT_ColorCabello(1) = "uno"
  CT_ColorCabello(2) = "dos"
  CT_ColorCabello (3) = "tres"
  Session("CT_ColorCabello") = CT_ColorCabello

DIM CT_ColorTez(3)
  CT_ColorTez(0) = "Sin Info"
  CT_ColorTez(1) = "uno"
  CT_ColorTez(2) = "dos"
  CT_ColorTez(3) = "tres"
  Session("CT_ColorTez") = CT_ColorTez

DIM CT_Complexion(3)
  CT_Complexion(0) = "Sin Info"
  CT_Complexion(1) = "uno"
  CT_Complexion(2) = "dos"
  CT_Complexion(3) = "tres"
  Session("CT_Complexion") = CT_Complexion

DIM CT_Frente(3)
  CT_Frente(0) = "Sin Info"
  CT_Frente(1) = "uno"
  CT_Frente(2) = "dos"
  CT_Frente(3) = "tres"
  Session("CT_Frente") = CT_Frente

DIM CT_Labios(3)
  CT_Labios(0) = "Sin Info"
  CT_Labios(1) = "uno"
  CT_Labios(2) = "dos"
  CT_Labios(3) = "tres"
  Session("CT_Labios") = CT_Labios


DIM CT_Menton(3)
  CT_Menton(0) = "Sin Info"
  CT_Menton(1) = "uno"
  CT_Menton(2) = "dos"
  CT_Menton(3) = "tres"
  Session("CT_Menton") = CT_Menton

DIM CT_Nariz(3)
  CT_Nariz(0) = "Sin Info"
  CT_Nariz(1) = "uno"
  CT_Nariz(2) = "dos"
  CT_Nariz(3) = "tres"
  Session("CT_Nariz") = CT_Nariz

DIM CT_Ojos(3)
  CT_Ojos(0) = "Sin Info"
  CT_Ojos(1) = "uno"
  CT_Ojos(2) = "dos"
  CT_Ojos(3) = "tres"
  Session("CT_Ojos") = CT_Ojos

DIM CT_Orejas(3)
  CT_Orejas(0) = "Sin Info"
  CT_Orejas(1) = "uno"
  CT_Orejas(2) = "dos"
  CT_Orejas(3) = "tres"
  Session("CT_Orejas") = CT_Orejas

DIM CT_Baja(3)
  CT_Baja(1) = "Sin Info"
  CT_Baja(1) = "uno"
  CT_Baja(2) = "dos"
  CT_Baja(3) = "tres"
  Session("CT_Baja") = CT_Baja


DIM CT_Estatus(3)
  CT_Estatus(0) = "Sin Info"
  CT_Estatus(1) = "Terminado"
  CT_Estatus(2) = "Trunco"
  CT_Estatus(3) = "Cursando"
  Session("CT_Estatus") = CT_Estatus

DIM CT_Instituto(3)
  CT_Instituto(1) = "uno"
  CT_Instituto(2) = "dos"
  CT_Instituto(3) = "tres"
  Session("CT_Instituto") = CT_Instituto

DIM CT_TipoVehiculo(3)
  CT_TipoVehiculo(1) = "uno"
  CT_TipoVehiculo(2) = "dos"
  CT_TipoVehiculo(3) = "tres"
  Session("CT_TipoVehiculo") = CT_TipoVehiculo

DIM CT_Vehiculo(3)
  CT_Vehiculo(1) = "uno"
  CT_Vehiculo(2) = "dos"
  CT_Vehiculo(3) = "tres"
  Session("CT_Vehiculo") = CT_Vehiculo


  DIM CT_Sexo(3)
  CT_Sexo(0) = "Sin Info"
  CT_Sexo(1) = "Masculino"
  CT_Sexo(2) = "Femenino"
  CT_Sexo(3) = "Indistinto"
  Session("CT_Sexo") = CT_Sexo

DIM CT_AptitudesFisicas(2)
  CT_AptitudesFisicas(0) = "SIN INFO"
  CT_AptitudesFisicas(1) = "APROBADO"
  CT_AptitudesFisicas(2) = "NO APROBADO"
  Session("CT_AptitudesFisicas") = CT_AptitudesFisicas

DIM CT_EvaluacionClinica(2)
  CT_EvaluacionClinica(0) = "SIN INFO"
  CT_EvaluacionClinica(1) = "APROBADO"
  CT_EvaluacionClinica(2) = "NO APROBADO"
  Session("CT_EvaluacionClinica") = CT_EvaluacionClinica


DIM CT_ExamenToxicologico(2)
  CT_ExamenToxicologico(0) = "SIN INFO"
  CT_ExamenToxicologico(1) = "APROBADO"
  CT_ExamenToxicologico(2) = "NO APROBADO"
  Session("CT_ExamenToxicologico") = CT_ExamenToxicologico

DIM CT_ReqAptitudesFisicas(2)
  CT_ReqAptitudesFisicas(0) = "SIN INFO"
  CT_ReqAptitudesFisicas(1) = "REQUERIDO"
  CT_ReqAptitudesFisicas(2) = "NO APLICA"
  Session("CT_ReqAptitudesFisicas") = CT_ReqAptitudesFisicas

DIM CT_ReqEvaluacionClinica(2)
  CT_ReqEvaluacionClinica(0) = "SIN INFO"
  CT_ReqEvaluacionClinica(1) = "REQUERIDO"
  CT_ReqEvaluacionClinica(2) = "NO APLICA"
  Session("CT_ReqEvaluacionClinica") = CT_ReqEvaluacionClinica


DIM CT_ReqExamenToxicologico(2)
  CT_ReqExamenToxicologico(0) = "SIN INFO"
  CT_ReqExamenToxicologico(1) = "REQUERIDO"
  CT_ReqExamenToxicologico(2) = "NO APLICA"
  Session("CT_ReqExamenToxicologico") = CT_ReqExamenToxicologico
  
DIM SFPcCompetenciasDesempenoLaboral(4)
  CompetenciasDesempenoLaboral(0) = "SIN INFO"
  CompetenciasDesempenoLaboral(1) = "BASICO"
  CompetenciasDesempenoLaboral(2) = "MODERADO"
  CompetenciasDesempenoLaboral(3) = "ALTO"
  CompetenciasDesempenoLaboral(4) = "ESENCIAL"
  Session("CompetenciasDesempenoLaboral") = CompetenciasDesempenoLaboral

DIM SFPcPerfilPsicologico(4)
  PerfilPsicologico(0) = "SIN INFO"
  PerfilPsicologico(1) = "NO APLICA"
  PerfilPsicologico(2) = "BAJO"
  PerfilPsicologico(3) = "MEDIO"
  PerfilPsicologico(4) = "ALTO"
  Session("PerfilPsicologico") = PerfilPsicologico


 Response.Redirect("https://"+ session("IP_SERVER") +"/CarreraPGR/CARR_index.asp")

 %>
<!--- ------------------------------------------------------------------------------------------------------------------ ---> 
<CENTER>

 </BODY>
</HTML>