<!-- Include File = "Seguridad/Perfil.inc" -->



  <%
   Id_CARcUSR =  REQUEST.QUERYSTRING("Id_CARcUSR")
   HABILITAR = Request.QueryString("HABILITAR")
   'response.Write(Id_CARcUSR) &"<--->" 
  ' response.write(HABILITAR)
  ' response.end 
	
	SET INSTANCIA_CONEXXXION      = SERVER.CREATEOBJECT("ADODB.CONNECTION")
    SET INSTANCIA_RECORD_1        = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    INSTANCIA_CONEXXXION.PROVIDER = "sqloledb"
    INSTANCIA_CONEXXXION.OPEN     = "SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

	
	
	IF HABILITAR = 1 THEN
   
SIKUEL ="UPDATE CARcUSR SET CARcUSR = LTRIM (RTRIM (CARcUSR_deshabilitado)), CARcUSR_deshabilitado = NULL, ACTIVO = 1 " & _
     " WHERE Id_CARcUSR = " & Id_CARcUSR
	 INSTANCIA_RECORD_1.OPEN SIKUEL, INSTANCIA_CONEXXXION
	  Response.Write("<body background='../softgri1.jpg'><BR><BR><HR><strong><center>EL USUARIO HA SIDO HABILITADO</center></strong><HR></body>")
	  
	ELSE
	
SIKUEL ="UPDATE CARcUSR SET CARcUSR_deshabilitado = CARcUSR, CARcUSR = NULL, ACTIVO = 0 WHERE Id_CARcUSR = " & Id_CARcUSR
INSTANCIA_RECORD_1.OPEN SIKUEL, INSTANCIA_CONEXXXION
	  	  Response.Write("<body background='../softgri1.jpg'><BR><BR><HR><strong><center>EL USUARIO HA SIDO DESHABILITADO</center></strong><HR></body>")
	
	END IF  
	  
	'  --PARA DESHABILITAR
'UPDATE CARcUSR SET CARcUSR_deshabilitado = CARcUSR, CARcUSR = NULL, ACTIVO = 0  
'WHERE Id_CARcUSR = 102
'
'--PARA HABILITAR 
'UPDATE CARcUSR SET CARcUSR = LTRIM (RTRIM (CARcUSR_deshabilitado)), CARcUSR_deshabilitado = NULL, ACTIVO = 1  
'WHERE Id_CARcUSR = 102
	  
	  
	   %>
          
          


 
