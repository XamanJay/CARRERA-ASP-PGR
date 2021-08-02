 <!-- #Include File = "md5.asp" -->
<html><head><title>Cambiar  password</title></head>
<body bgproperties="fixed" background = "../softgri1.jpg">
<form action="Valida_cambia_password.asp" method="post" name="in1_passsw">
<link href="CarreraPGR.css" rel="stylesheet" type="text/css">
 <%     Set Ob_Conn_cap = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_cap = Server.CreateObject ("ADODB.RecordSet")
	  SET Conectar = Server.CreateObject("ADODB.RecordSet")
      Ob_Conn_cap.Provider="sqloledb"


 Ob_Conn_cap.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''		  
		  USUARIO = request.form("txtUsuario")
		   PASSWORD	= MD5(TRIM(REQUEST.FORM("txtContrasena")))
		   
		  Verifica_Nom = "SELECT * FROM CARcUSR WHERE CARcUSR =  '" & USUARIO & "' AND PW = '" &PASSWORD& "' " & _ 
		                 " AND Carrera = 1 "
		  ''response.write Verifica_Nom
		  ''response.end 
   
   Conectar.Open Verifica_Nom, Ob_Conn_cap, 3, 1 
		TotdeRegistros = Conectar.RECORDCOUNT
		
		If TotdeRegistros = 0 THEN  
		response.Clear%>
		
		<script Language="JavaScript"> 
		alert("El  'Usuario' no existe, verifique su captura por favor.");
       /*return false;*/
        history.back()
		</script>
		
		<%	Response.end 
		END IF 
		
		Conectar.Close%>
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
	<%	  
		  
	  var_query = "SELECT * FROM CARcUSR " & _
	              "WHERE CARcUSR = '"& request.form("txtUsuario")& "' AND PW = '" & MD5(TRIM(request.form("txtContrasena"))) &"'"
				  
				  '& "' and PW = '" & request.form("txtContrasena") &"'"
	  Ob_RS_cap.Open var_query, Ob_conn_cap
%>
<input type="hidden" name="Id_CARcUSR" value=<%= Ob_RS_cap("Id_CARcUSR")%>>

<input type="hidden" name="CARcUSR" value=<%= Ob_RS_cap("CARcUSR")%>>

<br><br>
<center>
<table border="1" >
<tr >
 <td><Center>
            <strong><font color="#3CA0BD" size="4">CAMBIO DE CONTRASE&Ntilde;A  
			</font></strong> 
          </Center></td>
    </tr>
</table>
</center>

<br>
<center>
<table border="1" >
<tr >
 <td><Center>
            <strong><font color="#3CA0BD" size="3">Bienvenido(a) : <%= Ob_RS_cap("Nombre") %> 
            &nbsp;&nbsp; 
            </font></strong> 
          </Center></td>
    </tr>
</table>
</center>
<br><center>

<br><br>
<table border="1">
<tr >
        <th width="180" ><div align="center">Nueva contrase&ntilde;a</div></th>
        <th width="204"><div align="center">Confirmar nueva contraseña</div></th>
</tr>
<tr>
<td><center><input type="password" name="txtContrasena1" maxlength="40" size="30"></center> </td>
<td><center><input type="password" name="txtContrasena2" maxlength="40" size="30"></center> </td>
</table><br><br></center>

<center>
<table border="1">
<INPUT TYPE="Hidden" NAME=" " Value=>
<tr>
<td><center><input type="reset" name="btnlimpiar" value="L i m p i a r"></center></td>
<td><center><input type="button" name="btnEnviar" value="E n v i a r" onClick="valida()"></center></td>
</tr>
</table></center>
<% Ob_RS_cap.close
	 Ob_conn_cap.close%>
</form>
   <SCRIPT>
function valida()
{
 //-----------------------------------
  if (document.in1_passsw.txtContrasena1.value == '')
       {
	   alert ("El campo: nueva contraseña, no puede enviarse vacio, verifique por favor")
	   return;
	   }
 //------------------------------------
 if (document.in1_passsw.txtContrasena2.value == '')
      {
	  alert("El campo: confirmar contraseña, no puede enviarse vacio, verifique por favor")
	  return;
	  }
//-----------------------------------
 //------------------------------------
 if (document.in1_passsw.txtContrasena1.value != document.in1_passsw.txtContrasena2.value)
      {
	  alert("El campo de Nueva contraseña y el Campo de confirmar contraseña deben ser identicos, verifique por favor")
	  return;
	  }
//-----------------------------------
   document.in1_passsw.submit();
   }
</SCRIPT>

</body>
</html>
