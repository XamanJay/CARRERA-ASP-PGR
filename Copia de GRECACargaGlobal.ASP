<%@LCID = 1034%>
<HTML>
 <BODY>
<!-- #Include File = "MD5/md5.asp" -->
<!-- #Include File = "Seguridad/ConfigSec.inc" -->
 <%
'v_ODBC  = "SIIFP"

Set Ob_Conn = Server.CreateObject("ADODB.Connection")
Set Ob_RS = Server.CreateObject("ADODB.RecordSet")

'response.write Request.Form("UserID") 
'response.write "<BR>"
'response.write p()
'response.end




                     
'IF UCASE(Request.Form("UserID"))= "PRUEBA" THEN '' OR UCASE(Request.Form("UserID"))= "NUEVO" THEN
IF UCASE(Request.Form("UserID"))= "PRUEBA"  THEN
   SESSION("ODBC") = "SIIFP"
   SESSION("V_ODBC") = "SIIFP"
ELSEIF  UCASE(Request.Form("UserID"))= "PROCURADOR" THEN 
    SESSION("ODBC") = "SIIFP"
   SESSION("V_ODBC") = "SIIFP"
   'SESSION("ODBC") = "SIIFP_DATOSOK"
   'SESSION("V_ODBC") = "SIIFP_DATOSOK"
ELSE  
  ' SESSION("ODBC") = "SIIFP"
   'SESSION("V_ODBC") = "SIIFP"
   
 SESSION("ODBC") = "SIIFP"
   SESSION("V_ODBC") = "SIIFP"
   ODBC = SESSION("ODBC")
   V_ODBC  = SESSION("V_ODBC")
END IF 
'response.write "SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ u() +";PWD="+ p()
'response.end
Ob_Conn.PROVIDER="sqloledb"
Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ u() +";PWD="+ p()

Sql = "Select * from CARcUSR where CARcUSR = '"& Request.Form("UserID") &"' and PW = '"& MD5(Request.Form("Password")) &"'"

'RESPONSE.WRITE SQL
'RESPONSE.WRITE "<BR><HR>"
'RESPONSE.WRITE V_ODBC
'response.end
Ob_RS.Open Sql, Ob_Conn

If Ob_RS.Eof Then
	Session("FlagConn") = 0
	%>
	<script> 
		alert('Usuario o Password  Incorrecto');
		history.back();
	</script>
	<%
Else
	Session("FlagConn") = 1
	
	
	Session("UserLogin") = Ob_RS("CARcUSR")
	Session("IdLogin") = Ob_RS("Id_CARcUSR")
	
	Session("Subprocuraduria") = Ob_RS("Id_CARcSubprocuradurias")
	Session("Delegacion") = Ob_RS("Id_CARcDG_o_Delegaciones")
	Session("Subsede") = Ob_RS("Id_CARcDir_o_subsede")
	
	Session("TipoUSR") = Ob_RS("Id_CARcTipoUSR")
	
		
	'''Response.Write session("Subprocuraduria")
	'''Response.Write session("Delegacion")
	'''Response.Write session("Subsede")
	'''jjresponse.end 
	
	Session("UserID") = u()
	Session("Password") = p()
'	response.write MD5("UserCarreraSql")
'	response.end
	
OB_RS.CLOSE
SQL1 ="SELECT     dbo.CARcUSR.CARcUSR, dbo.CARcPerfilGrupo.CARcPerfilGrupo, dbo.CARcPerfilGrupo.CARcDescripcion"
SQL1 = SQL1 + " FROM         dbo.CARdUsrPerfilGrupo INNER JOIN"
SQL1 = SQL1 + " dbo.CARcPerfilGrupo ON dbo.CARdUsrPerfilGrupo.Id_CARcPerfilGrupo = dbo.CARcPerfilGrupo.Id_CARcPerfilGrupo INNER JOIN"
SQL1 = SQL1 + " dbo.CARcUSR ON dbo.CARdUsrPerfilGrupo.Id_CARcUsr = dbo.CARcUSR.Id_CARcUSR"
SQL1 = SQL1 + " WHERE CARcUSR = '" + session("UserLogin")+"'"
'RESPONSE.WRITE sql1
Ob_RS.Open SQL1, Ob_Conn

SESSION("PERFIL") = OB_RS("CARcPerfilGrupo")
'response.write SESSION("PERFIL")
'response.end
OB_RS.CLOSE
	
%>


 
<!--- Definición de catálogos personalizados -----------------   ---> 
 <%
'  DIM Id_CAPcRespuestasPermitidas(3)
'  Id_CAPcRespuestasPermitidas(0) = "4-Excelente"
'  Id_CAPcRespuestasPermitidas(1) = "3-Bueno"
'  Id_CAPcRespuestasPermitidas(2) = "2-Regular"
'  Id_CAPcRespuestasPermitidas(3) = "1-Deficiente"
'  Session("Id_CAPcRespuestasPermitidas") = Id_CAPcRespuestasPermitidas'''

 
' DIM ' ' CT_EstadodelBien(3)
'  ' ' CT_EstadodelBien(0) = "SIN INFO"
'  ' ' CT_EstadodelBien(1) = "BUENO"
'  ' ' CT_EstadodelBien(2) = "MALO"
'  ' ' CT_EstadodelBien(3) = "REGULAR"
'  Session("' ' CT_EstadodelBien") = ' ' CT_EstadodelBien
   
'  DIM ' ' CT_Asociacion(3)
'  ' ' CT_Asociacion(0) = "SIN INFO"
'  ' ' CT_Asociacion(1) = "RELIGIOSA"
'  ' ' CT_Asociacion(2) = "POLITICA"
'  ' ' CT_Asociacion(3) = "DEPORTIVA"
'  Session("' ' CT_Asociacion") = ' ' CT_Asociacion

'  DIM ' ' CT_ModoAdquisicion(3)
'  ' ' CT_ModoAdquisicion(0) = "SIN INFO"
'  ' ' CT_ModoAdquisicion(1) = "CONTADO"
'  ' ' CT_ModoAdquisicion(2) = "CREDITO"
'  ' ' CT_ModoAdquisicion(3) = "HERENCIA"
'    Session("' ' CT_ModoAdquisicion") = ' ' CT_ModoAdquisicion

'  DIM ' ' CT_TipoBien(3)
'  ' ' CT_TipoBien(0) = "SIN INFO"
'  ' ' CT_TipoBien(1) = "CASA"
'  ' ' CT_TipoBien(2) = "DEPARTAMENTO"
'  ' ' CT_TipoBien(3) = "TERRENO"
'  Session("' ' CT_TipoBien") = ' ' CT_TipoBien
'
'  DIM ' ' CT_BancoEmpresa(3)
'  ' ' CT_BancoEmpresa(0) = "SIN INFO"
'  ' ' CT_BancoEmpresa(1) = "BBV BANCOMER"
'  ' ' CT_BancoEmpresa(2) = "HSBC"
'  ' ' CT_BancoEmpresa(3) = "BANAMEX"
'  Session("' ' CT_BancoEmpresa") = ' ' CT_BancoEmpresa
'
'  DIM ' ' CT_TipoCuenta(3)
'  ' ' CT_TipoCuenta(0) = "SIN INFO"
'  ' ' CT_TipoCuenta(1) = "CREDITO"
'  ' ' CT_TipoCuenta(2) = "CHEQUES"
'  ' ' CT_TipoCuenta(3) = "AHORRO"
'  Session("' ' CT_TipoCuenta") = ' ' CT_TipoCuenta
  
 '   DIM ' ' CT_Estado(32)
 ' ' ' CT_Estado(0) = "SIN INFO"
 ' ' ' CT_Estado(1) = "AGUASCALIENTES"
 ' ' ' CT_Estado(2) = "BAJA CALIFORNIA NORTE"
 ' ' ' CT_Estado(3) = "BAJA CALIFORNIA SUR"
 ' ' ' CT_Estado(4) = "CAMPECHE"
'------------------------------------------------------
'  ' ' CT_Estado(7) = "CHIAPAS"
'  ' ' CT_Estado(8) = "CHIHUAHUA"
'  ' ' CT_Estado(5) = "COAHUILA"
'  ' ' CT_Estado(6) = "COLIMA"
'------------------------------------------------------
'  ' ' CT_Estado(9) = "D.F."
'  ' ' CT_Estado(10) = "DURANGO"
'------------------------------------------------------  
 ' ' ' CT_Estado(15) = "ESTADO DE MÉXICO"
 ' ' ' CT_Estado(11) = "GUANAJUATO"
 ' ' ' CT_Estado(12) = "GUERRERO"
 ' ' ' CT_Estado(13) = "HIDALGO"
 ' ' ' CT_Estado(14) = "JALISCO"
'------------------------------------------------------ 
 ' ' ' CT_Estado(16) = "MICHOACAN"
 ' ' ' CT_Estado(17) = "MORELOS"
 ' ' ' CT_Estado(18) = "NAYARIT"
 ' ' ' CT_Estado(19) = "NUEVO LEON"
 ' ' ' CT_Estado(20) = "OAXACA"
 ' ' ' CT_Estado(21) = "PUEBLA"
 ' ' ' CT_Estado(22) = "QUERETARO"
 ' ' ' CT_Estado(23) = "QUINTANA ROO"
 ' ' ' CT_Estado(24) = "SAN LUIS POTOSI"
 ' ' ' CT_Estado(25) = "SINALOA"
 ' ' ' CT_Estado(26) = "SONORA"
 ' ' ' CT_Estado(27) = "TABASCO"
 ' ' ' CT_Estado(28) = "TAMAULIPAS"
 ' ' ' CT_Estado(29) = "TLAXCALA"
 ' ' ' CT_Estado(30) = "VERACRUZ"
 ' ' ' CT_Estado(31) = "YUCATAN"
 ' ' ' CT_Estado(32) = "ZACATECAS"
 ' Session("' ' CT_Estado") = ' ' CT_Estado
 ' 
'  DIM ' ' CT_Genero(2)
'  ' ' CT_Genero(0) = "Sin Info"
'  ' ' CT_Genero(1) = "Masculino"
'  ' ' CT_Genero(2) = "Femenino"
'  Session("' ' CT_Genero") = ' ' CT_Genero
'  
'  DIM ' ' CT_GradoMaximoEstudios(6)
'  ' ' CT_GradoMaximoEstudios(0) = "Primaria"
'  ' ' CT_GradoMaximoEstudios(1) = "Primaria"
'  ' ' CT_GradoMaximoEstudios(2) = "Secundaria"
'  ' ' CT_GradoMaximoEstudios(3) = "Bachillerato"
'  ' ' CT_GradoMaximoEstudios(4) = "Licenciatura"
'  ' ' CT_GradoMaximoEstudios(5) = "Maestria"
'  ' ' CT_GradoMaximoEstudios(6) = "Doctorado"
'  Session("' ' CT_GradoMaximoEstudios") = ' ' CT_GradoMaximoEstudios

'  DIM ' ' CT_SituacionLaboral(4)
'  ' ' CT_SituacionLaboral(0) = "SIN INFO"
'  ' ' CT_SituacionLaboral(1) = "ACTIVO"
'  ' ' CT_SituacionLaboral(2) = "SUSPENDIDO"
'  ' ' CT_SituacionLaboral(3) = "LICENCIA"
'  ' ' CT_SituacionLaboral(4) = "BAJA"
'  Session("' ' CT_SituacionLaboral") = ' ' CT_SituacionLaboral
'  
'  DIM ' ' CT_PortacionArma(2)
'  ' ' CT_PortacionArma(0) = "Sin Info"
'  ' ' CT_PortacionArma(1) = "Si"
'  ' ' CT_PortacionArma(2) = "No"
'  Session("' ' CT_PortacionArma") = ' ' CT_PortacionArma

'  DIM ' ' CT_DocumentoObtenido(2)
'  ' ' CT_DocumentoObtenido(0) = "Sin Info"
'  ' ' CT_DocumentoObtenido(1) = "Ninguno"
'  ' ' CT_DocumentoObtenido(2) = "Certificado o Titulo"
'  Session("' ' CT_DocumentoObtenido") = ' ' CT_DocumentoObtenido'

'   DIM ' ' CT_Nivel(6)
'  ' ' CT_Nivel(0) = "Sin info"
'  ' ' CT_Nivel(1) = "Primaria"
'  ' ' CT_Nivel(2) = "Secundaria"
'  ' ' CT_Nivel(3) = "Bachillerato"
'  ' ' CT_Nivel(4) = "Licenciatura"
'  ' ' CT_Nivel(5) = "Maestria"
'  ' ' CT_Nivel(6) = "Doctorado"
'  Session("' ' CT_Nivel") = ' ' CT_Nivel'


'  DIM ' ' CT_Parentesco(3)
'  ' ' CT_Parentesco(0) = "Padre"
'  ' ' CT_Parentesco(1) = "Madre"
'  ' ' CT_Parentesco(2) = "Hermano"
'  ' ' CT_Parentesco(3) = "Hermana"
'  Session("' ' CT_Parentesco") = ' ' CT_Parentesco
' 
''  DIM ' ' CT_EstadoCivil(2)
'  ' ' CT_EstadoCivil(0) = "Sin Info"
'  ' ' CT_EstadoCivil(1) = "Soltero"
'  ' ' CT_EstadoCivil(2) = "Casado"
'  Session("' ' CT_EstadoCivil") = ' ' CT_EstadoCivil
'  
 ' DIM ' ' CT_REstadoCivil(3)
 ' ' ' CT_REstadoCivil(0) = "Sin Info"
 ' ' ' CT_REstadoCivil(1) = "SOLTERO"
 ' ' ' CT_REstadoCivil(2) = "CASADO"
 ' ' ' CT_REstadoCivil(3) = "INDISTINTO"
 ' Session("' ' CT_REstadoCivil") = ' ' CT_REstadoCivil
  
''  DIM ' ' CT_Gral_SFPcPerfilPsicologico(3)
'  ' ' CT_Gral_SFPcPerfilPsicologico(0) = "NO APLICA"
'  ' ' CT_Gral_SFPcPerfilPsicologico(1) = "BAJO"
'  ' ' CT_Gral_SFPcPerfilPsicologico(2) = "MEDIO"
'  ' ' CT_Gral_SFPcPerfilPsicologico(3) = "ALTO"
'  Session("' ' CT_Gral_SFPcPerfilPsicologico") = ' ' CT_Gral_SFPcPerfilPsicologico
  
'  DIM ' ' CT_Gral_SFPcCompetenciasDLaboral(5)
'  ' ' CT_Gral_SFPcCompetenciasDLaboral(0) = "NO APLICA"
'  ' ' CT_Gral_SFPcCompetenciasDLaboral(1) = "BASICO"
'  ' ' CT_Gral_SFPcCompetenciasDLaboral(2) = "MODERADO"
'  ' ' CT_Gral_SFPcCompetenciasDLaboral(3) = "ALTO"
'  ' ' CT_Gral_SFPcCompetenciasDLaboral(4) = "ESENCIAL"
'  Session("' ' CT_Gral_SFPcCompetenciasDLaboral") = ' ' CT_Gral_SFPcCompetenciasDLaboral

  
'  DIM ' ' CT_Boca(3)
'  ' ' CT_Boca(0) = "Sin Info"
'  ' ' CT_Boca(1) = "CHICA"
'  ' ' CT_Boca(2) = "MEDIANA"
'  ' ' CT_Boca(3) = "GRANDE"
'  Session("' ' CT_Boca") = ' ' CT_Boca

'DIM ' ' CT_Cara(3)
'  ' ' CT_Cara(0) = "Sin info"
'  ' ' CT_Cara(1) = "OVAL"
'  ' ' CT_Cara(2) = "REDONDA"
'  ' ' CT_Cara(3) = "CUADRADA"
'  Session("' ' CT_Cara") = ' ' CT_Cara

'DIM ' ' CT_Cejas(3)
  ' ' CT_Cejas(0) = "Sin Info"
  ' ' CT_Cejas(1) = "ESCASAS"
  ' ' CT_Cejas(2) = "MEDIANAS"
  ' ' CT_Cejas(3) = "ABUNDANTES"
'  Session("' ' CT_Cejas") = ' ' CT_Cejas

'DIM ' ' CT_ColorCabello(3)
  ' ' CT_ColorCabello(0) = "Sin Info"
  ' ' CT_ColorCabello(1) = "OSCURO"
  ' ' CT_ColorCabello(2) = "CASTAÑO"
  ' ' CT_ColorCabello (3) = "RUBIO"
 ' Session("' ' CT_ColorCabello") = ' ' CT_ColorCabello

'DIM ' ' CT_ColorTez(3)
  ' ' CT_ColorTez(0) = "Sin Info"
  ' ' CT_ColorTez(1) = "MORENO"
  ' ' CT_ColorTez(2) = "MOREO CLARO"
  ' ' CT_ColorTez(3) = "GUERO"
 ' Session("' ' CT_ColorTez") = ' ' CT_ColorTez

'DIM ' ' CT_Complexion(3)
  ' ' CT_Complexion(0) = "Sin Info"
  ' ' CT_Complexion(1) = "ROBUSO"
  ' ' CT_Complexion(2) = "DELGADO"
  ' ' CT_Complexion(3) = "FLACO"
'  Session("' ' CT_Complexion") = ' ' CT_Complexion

'DIM ' ' CT_Frente(3)
  ' ' CT_Frente(0) = "Sin Info"
  ' ' CT_Frente(1) = "AMPLIA"
  ' ' CT_Frente(2) = "ESCASA"
  ' ' CT_Frente(3) = "NORMAL"
'  Session("' ' CT_Frente") = ' ' CT_Frente

'DIM ' ' CT_Labios(3)
  ' ' CT_Labios(0) = "Sin Info"
  ' ' CT_Labios(1) = "GRUESOS"
  ' ' CT_Labios(2) = "REGULARES"
  ' ' CT_Labios(3) = "DELGADOS"
'  Session("' ' CT_Labios") = ' ' CT_Labios


'DIM ' ' CT_Menton(3)
  ' ' CT_Menton(0) = "Sin Info"
  ' ' CT_Menton(1) = "OVAL"
  ' ' CT_Menton(2) = "REDONDO"
  ' ' CT_Menton(3) = "PARTIDO"
'  Session("' ' CT_Menton") = ' ' CT_Menton

'DIM ' ' CT_Nariz(3)
  ' ' CT_Nariz(0) = "Sin Info"
  ' ' CT_Nariz(1) = "CHATA"
  ' ' CT_Nariz(2) = "AGUILEÑA"
  ' ' CT_Nariz(3) = "GRANDE"
'  Session("' ' CT_Nariz") = ' ' CT_Nariz

'DIM ' ' CT_Ojos(3)
  ' ' CT_Ojos(0) = "Sin Info"
  ' ' CT_Ojos(1) = "CLAROS"
  ' ' CT_Ojos(2) = "OSCUROS"
  ' ' CT_Ojos(3) = "VERDES"
 ' Session("' ' CT_Ojos") = ' ' CT_Ojos

'DIM ' ' CT_Orejas(3)
  ' ' CT_Orejas(0) = "Sin Info"
  ' ' CT_Orejas(1) = "PEQUEÑAS"
  ' ' CT_Orejas(2) = "REGULARES"
  ' ' CT_Orejas(3) = "GRANDES"
 ' Session("' ' CT_Orejas") = ' ' CT_Orejas

'DIM ' ' CT_Baja(3)
  ' ' CT_Baja(1) = "Sin Info"
  ' ' CT_Baja(1) = "Renuncia"
  ' ' CT_Baja(2) = "Proceso"
  ' ' CT_Baja(3) = "otro"
'  Session("' ' CT_Baja") = ' ' CT_Baja

'DIM ' ' CT_Estatus(3)
  ' ' CT_Estatus(0) = "Sin Info"
  ' ' CT_Estatus(1) = "Terminado"
  ' ' CT_Estatus(2) = "Trunco"
  ' ' CT_Estatus(3) = "Cursando"
'  Session("' ' CT_Estatus") = ' ' CT_Estatus

'DIM ' ' CT_Instituto(3)
  ' ' CT_Instituto(0) = "SIN INFO"
  ' ' CT_Instituto(1) = "ICAP"
  ' ' CT_Instituto(2) = "INACIPE"
'  Session("' ' CT_Instituto") = ' ' CT_Instituto

'DIM ' ' CT_TipoVehiculo(2)
  ' ' CT_TipoVehiculo(0) = "SIN INFO"
  ' ' CT_TipoVehiculo(1) = "AUTOMOVIL"
  ' ' CT_TipoVehiculo(2) = "MOTOCICLETA"
'  Session("' ' CT_TipoVehiculo") = ' ' CT_TipoVehiculo

'DIM ' ' CT_Vehiculo(2)
  ' ' CT_Vehiculo(0) = "bochito"
  ' ' CT_Vehiculo(1) = "sentra"
  ' ' CT_Vehiculo(2) = "maxima"
'  Session("' ' CT_Vehiculo") = ' ' CT_Vehiculo


 ' DIM ' ' CT_Sexo(3)
  ' ' CT_Sexo(0) = "Sin Info"
  ' ' CT_Sexo(1) = "MASCULINO"
  ' ' CT_Sexo(2) = "FEMENINO"
  ' ' CT_Sexo(3) = "INDISTINTO"
'  Session("' ' CT_Sexo") = ' ' CT_Sexo

'DIM ' ' CT_AptitudesFisicas(2)
  ' ' CT_AptitudesFisicas(0) = "SIN INFO"
  ' ' CT_AptitudesFisicas(1) = "APROBADO"
  ' ' CT_AptitudesFisicas(2) = "NO APROBADO"
'  Session("' ' CT_AptitudesFisicas") = ' ' CT_AptitudesFisicas

'DIM ' ' CT_EvaluacionClinica(2)
  ' ' CT_EvaluacionClinica(0) = "SIN INFO"
  ' ' CT_EvaluacionClinica(1) = "APROBADO"
  ' ' CT_EvaluacionClinica(2) = "NO APROBADO"
'  Session("' ' CT_EvaluacionClinica") = ' ' CT_EvaluacionClinica


'DIM ' ' CT_ExamenToxicologico(2)
  ' ' CT_ExamenToxicologico(0) = "SIN INFO"
  ' ' CT_ExamenToxicologico(1) = "APROBADO"
  ' ' CT_ExamenToxicologico(2) = "NO APROBADO"
'  Session("' ' CT_ExamenToxicologico") = ' ' CT_ExamenToxicologico

'DIM ' ' CT_ReqAptitudesFisicas(2)
  ' ' CT_ReqAptitudesFisicas(0) = "SIN INFO"
  ' ' CT_ReqAptitudesFisicas(1) = "REQUERIDO"
  ' ' CT_ReqAptitudesFisicas(2) = "NO APLICA"
'  Session("' ' CT_ReqAptitudesFisicas") = ' ' CT_ReqAptitudesFisicas

'DIM ' ' CT_ReqEvaluacionClinica(2)
  ' ' CT_ReqEvaluacionClinica(0) = "SIN INFO"
  ' ' CT_ReqEvaluacionClinica(1) = "REQUERIDO"
  ' ' CT_ReqEvaluacionClinica(2) = "NO APLICA"
'  Session("' ' CT_ReqEvaluacionClinica") = ' ' CT_ReqEvaluacionClinica


'DIM ' ' CT_ReqExamenToxicologico(2)
  ' ' CT_ReqExamenToxicologico(0) = "SIN INFO"
  ' ' CT_ReqExamenToxicologico(1) = "REQUERIDO"
  ' ' CT_ReqExamenToxicologico(2) = "NO APLICA"
'  Session("' ' CT_ReqExamenToxicologico") = ' ' CT_ReqExamenToxicologico
  
'DIM CompetenciasDesempenoLaboral(4)
'  CompetenciasDesempenoLaboral(0) = "SIN INFO"
'  CompetenciasDesempenoLaboral(1) = "BASICO"
'  CompetenciasDesempenoLaboral(2) = "MODERADO"
'  CompetenciasDesempenoLaboral(3) = "ALTO"
'  CompetenciasDesempenoLaboral(4) = "ESENCIAL"
'  Session("CompetenciasDesempenoLaboral") = CompetenciasDesempenoLaboral

DIM PerfilPsicologico(4)
  PerfilPsicologico(0) = "SIN INFO"
  PerfilPsicologico(1) = "NO APLICA"
  PerfilPsicologico(2) = "BAJO"
  PerfilPsicologico(3) = "MEDIO"
  PerfilPsicologico(4) = "ALTO"
  Session("PerfilPsicologico") = PerfilPsicologico

    


DIM CAPcCuestContCurso(4)
    CAPcCuestContCurso(0) = "Ninguno"
    CAPcCuestContCurso(1) = "Deficiente"
    CAPcCuestContCurso(2) = "Regular"
    CAPcCuestContCurso(3) = "Bueno"
    CAPcCuestContCurso(4) = "Excelente"
    Session("CAPcCuestContCurso") = CAPcCuestContCurso
    
DIM CAPcCuestInstServ(4)
    CAPcCuestInstServ(0) = "Ninguno"
    CAPcCuestInstServ(1) = "Deficiente"
    CAPcCuestInstServ(2) = "Regular"
    CAPcCuestInstServ(3) = "Bueno"
    CAPcCuestInstServ(4) = "Excelente"
    Session("CAPcCuestInstServ") = CAPcCuestInstServ
	
DIM CAPcCuestInstructor(4)
    CAPcCuestInstructor(0) = "Ninguno"
    CAPcCuestInstructor(1) = "Deficiente"
    CAPcCuestInstructor(2) = "Regular"
    CAPcCuestInstructor(3) = "Bueno"
    CAPcCuestInstructor(4) = "Excelente"
    Session("CAPcCuestInstructor") = CAPcCuestInstructor    

'---------------------------------------------------------------------------------------------------------------------------------

DIM CAPdCuestPostCap_Bloq1(1)
    CAPdCuestPostCap_Bloq1(0) = "Si"
    CAPdCuestPostCap_Bloq1(1) = "No"
    Session("CAPdCuestPostCap_Bloq1") = CAPdCuestPostCap_Bloq1 	
	
DIM CAPdCuestPostCap_Bloq2(5)
    CAPdCuestPostCap_Bloq2(0) = "0"
    CAPdCuestPostCap_Bloq2(1) = "1"
    CAPdCuestPostCap_Bloq2(2) = "2"
    CAPdCuestPostCap_Bloq2(3) = "3"
    CAPdCuestPostCap_Bloq2(4) = "4"
    CAPdCuestPostCap_Bloq2(5) = "5"
    Session("CAPdCuestPostCap_Bloq2") = CAPdCuestPostCap_Bloq2 		
	
DIM CAPdCuestPostCap_Bloq3(10)
    CAPdCuestPostCap_Bloq3(0) = "-5"
    CAPdCuestPostCap_Bloq3(1) = "-4"
    CAPdCuestPostCap_Bloq3(2) = "-3"
    CAPdCuestPostCap_Bloq3(3) = "-2"
    CAPdCuestPostCap_Bloq3(4) = "-1"
    CAPdCuestPostCap_Bloq3(5) = "0"
    CAPdCuestPostCap_Bloq3(6) = "1"
    CAPdCuestPostCap_Bloq3(7) = "2"
    CAPdCuestPostCap_Bloq3(8) = "3"
    CAPdCuestPostCap_Bloq3(9) = "4"
    CAPdCuestPostCap_Bloq3(10) = "5"
    Session("CAPdCuestPostCap_Bloq3") = CAPdCuestPostCap_Bloq3 	

End If


If Session("FlagConn") = 1 Then    

 Response.Redirect("https://"+ session("IP_SERVER") +"/CarreraPGR/CARR_index.asp")
 
End If

Ob_RS.Close
Set Ob_RS = Nothing
Set Ob_Conn = Nothing
 %>


 </BODY></HTML>
