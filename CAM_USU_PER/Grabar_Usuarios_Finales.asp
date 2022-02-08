 <!-- #Include File = "md5.asp" -->

<%
   SET Conectar = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
    Conectar.PROVIDER="sqloledb"
  Conectar.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

  SUBPROCURA = TRIM(REQUEST.FORM("Id_CARcSubprocuradurias"))
  DELEGA     = TRIM(REQUEST.FORM("Id_CARcDG_o_Delegaciones")) 
  SUBSEDE    = TRIM(REQUEST.FORM("Id_CARcDir_o_subsede"))
  USUARIO		= TRIM(REQUEST.FORM("Usuarioo"))
  PASSWORD	= MD5(TRIM(REQUEST.FORM("Password")))

  Id_CARcPerfilGrupo = TRIM(REQUEST.FORM("Id_CARcPerfilGrupo"))
  
  '''               Id_CARcTipoUSR = TRIM(REQUEST.FORM("Id_CARcTipoUSR"))
  Responsable    = TRIM(REQUEST.FORM("Responsable"))
  Micro  = TRIM(REQUEST.FORM("Micro"))
  Descripcion_Usuario = TRIM(REQUEST.FORM("Descripcion_Usuario"))
  TIPO    =   8   
  
  
  
  
  Verifica_Nom = "SELECT * FROM CARcUSR WHERE CARcUSR =  '" & USUARIO & "' AND Carrera = 1 "
   
   Record.Open Verifica_Nom, Conectar, 3, 1 
		TotdeRegistros = Record.RECORDCOUNT
		
		If TotdeRegistros => 1 THEN  
		response.Clear%>
		
		<script Language="JavaScript"> 
		alert("El nombre de 'Usuario' ya existe, capture uno distinto por favor.");
       /*return false;*/
        history.back()
		</script>
		
		<%	Response.end 
		END IF 
		
		Record.Close%>
   
  <%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
   IF SUBPROCURA = 0 THEN  ' Si no elijo subprocu quiere decir que es un *todopoderoso
       Id_CARcTipoUSR = 4   'por consiguiente si no elijo subprocur todos se van en 0 ceros
	   
   ELSEIF SUBPROCURA <> 0 AND DELEGA = 0 THEN   ' SI solo elijo subprocurador y dejo los demas en blanco
       Id_CARcTipoUSR = 5                        ' quiere decir que es s*ubprocu
	   
   ELSEIF SUBPROCURA <> 0 AND DELEGA <> 0 AND SUBSEDE = 0 THEN   ' Quiere decir que es *delegado 
       Id_CARcTipoUSR = 6
	
   ELSEIF SUBPROCURA <> 0 AND DELEGA <> 0 AND SUBSEDE <> 0 THEN   ' Quiere decir que es * Va a poder consultar todo lo de un Subdelegado o usuario
       Id_CARcTipoUSR = 7
	   
   END IF

   Insert_Usuario = "INSERT INTO CARcUSR (CARcUSR, PW, Id_CARcSubprocuradurias, Id_CARcDG_o_Delegaciones, Id_CARcDir_o_subsede, Id_CARcTipoUSR, Nombre, Micro, Descripcion_Usuario, Carrera, Activo)" & _ 
              " VALUES ('"&USUARIO&"', '"&PASSWORD&"', "&SUBPROCURA&", "&DELEGA&", "&SUBSEDE&", "&Id_CARcTipoUSR&" ,  '"&Responsable& "',  '"& Micro&"',  '"& Descripcion_Usuario &"', 1, 1 )"
								 
    Conectar.Execute(Insert_Usuario)
	SET var = Conectar.Execute("SELECT IDENT_CURRENT('CARcUSR')")
	 Id_CARcUSR = var(0)
	var.close
	SET var = NOTHING
	'' JAISSSIEL Response.Write(Id_CARcUSR&"<----")
	
	Insert_CARdUsrPerfilGrupo = "INSERT INTO CARdUsrPerfilGrupo (Id_CARcUSR, Id_CARcPerfilGrupo) " & _
	                            "VALUES ("&Id_CARcUSR& ", " &Id_CARcPerfilGrupo&" )"
'	response.write Insert_CARdUsrPerfilGrupo
'	response.end 
   Conectar.Execute(Insert_CARdUsrPerfilGrupo)
   
   
   
     Insert_CardUsrModulo = "INSERT INTO CARdUsrModulo  (CARdUsrModulo, Id_CARcUSR, Id_CARcModulo  ) " & _
                              "VALUES ( NULL," & Id_CARcUSR &", 1 )"
    Conectar.Execute(Insert_CardUsrModulo)

%>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>  <TITLE>   Pantalla Altas  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
 

 
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">

<BR><BR>  
  <CENTER>    <H2>      <FONT COLOR= #3366CC>Usuario grabado  correctamente</FONT>    </H2>  
  </CENTER>

<HR>

 </FORM>


  <%SET Ob_RS = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

