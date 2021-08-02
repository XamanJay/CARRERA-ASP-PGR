<html>

<head>
<meta https-equiv="Content-Language" content="es">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta https-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Desvanecimiento</title>
</head>
<body TOPMARGIN="0" LEFTMARGIN="0" bgproperties="fixed" BACKGROUND="" >


<%


   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
 '  SET Ob_RS2   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Ob_Conn.PROVIDER="sqloledb"
Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
'RESPONSE.WRITE REQUEST.FORM
	
	'*** Query  ***
xx = 0
Sql2 = ""	
for each x in Request.Form("TipoPuesto")
     If xx= 0 THEN
	    Sql2 = Sql2 +" WHERE Id_TipoPuesto =  " + x
	 else 
	    Sql2 = Sql2+ "  OR Id_TipoPuesto =  " + x
	 end if 
'     response.write Request.Form("TipoPuesto")
'	 response.write "<BR>"
      xx = xx + 1
next 

if xx = 0 then 
Ob_Conn.BeginTrans
   for each x in Request.Form("chkPuesto")
	    Set Ob_RS2 = Server.CreateObject("ADODB.RecordSet")
		
    	sql = "SELECT * from  CAPdCursosPerfil where Id_CARcCatalogoCursosPGR = "+request("lnkIdCarros")+" AND Id_SFPcPuestos=" + cstr(x)
'	response.write sql
'	response.end
	   Ob_RS2.Open sql, Ob_Conn, 3, 1
	    NumRegs = Ob_RS2.RECORDCOUNT
    	Ob_RS2.close
	 	if  NumRegs = 0 Then
	 			Sql = "insert into CAPdCursosPerfil "
				Sql = Sql + " (Id_CARcCatalogoCursosPGR, Id_SFPcPuestos) values ("+ request("lnkIdCarros") +","+cstr(x)+")"
	            Ob_RS2.Open Sql, Ob_Conn
		       Set Ob_RS2 = Nothing
		End If
'response.write sql
	Agregar = true
   next 
   Ob_Conn.CommitTrans
End if    

If request("Entre") AND Agregar then 
'  response.write sql
  response.write "<h2>Los registros fueron agregados correctamente </h2>"
  response.end
else   
	Sql = "select * From SFPcPuestos "+Sql2
end if 

'	Sql = Sql + "AC.SPGRdActaCircunstanciada, Indi.Id_SPGRd_AC_Indiciados, "
'response.write sql
'response.end
%>
<%
	Ob_RS.Open Sql, Ob_Conn
	
	
	If Not Ob_RS.Eof Then
%>
		<form method="POST" name="frmDesvPer" action="ListaCursoPersona.asp">
	
				<input type="hidden" name="IdAC" value="<%=IdAC%>">
				<input type="hidden" name="Entre" value="<%=True%>">
				<input type="hidden" name="lnkIdCarros" value="<%=request("lnkIdCarros")%>">
				
			  <table border="1" cellspacing="1" width="74%" id="AutoNumber1">
			    <tr>		   	 
			      <td width="20%" bgcolor="#EFEFEF"><font face="Tahoma" size="2">FILTRAR</font>&nbsp;</td>
			      <td width="13%" bgcolor="#EFEFEF">
	           	 	<p align="center"><font face="Tahoma" size="1"><input type="checkbox" name="TipoPuesto" value="1">
          AMPF'S </td>
			      <td width="13%" bgcolor="#EFEFEF">
	           	 	<p align="center"><font face="Tahoma" size="1"><input type="checkbox" name="TipoPuesto" value="2">AFIS	
	              </td>
			      <td width="13%" bgcolor="#EFEFEF">
	           	 	<p align="center"><font face="Tahoma" size="1"><input type="checkbox" name="TipoPuesto" value="3">PERITOS	
	              </td>
			      <td width="19%" bgcolor="#EFEFEF">
	           	 	<p align="center"><font face="Tahoma" size="1"><input type="checkbox" name="TipoPuesto" value="4">ADMINISTRATIVOS	
	              </td>
			    </tr>
			  </table>




	  				  	
	  		<center><p style="margin-top: 0; margin-bottom: 0"><b>
			<font color="#136F9F" size="5"><BR>Catalogo de Puestos</font></b> </p>
			<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p></center>
	  		<center>
	  		
			  <table border="1" cellspacing="1" width="74%" id="AutoNumber1">
			    <tr>
			      <td width="31%" bordercolor="#136F9F" bgcolor="#136F9F" align="center">
	              <b><font color="#FFFFFF" face="Tahoma" size="2">Puesto</font></b></td>
			      <td width="13%" bordercolor="#136F9F" bgcolor="#136F9F" align="center">
	              <b><font color="#FFFFFF" face="Tahoma" size="2">Seleccionar</font></b></td>
			    </tr>
			    <%Do Until Ob_RS.Eof%>
			    <tr>		   	 
			      <td width="31%" bgcolor="#EFEFEF"><font face="Tahoma" size="2"><%=Ob_RS("SFPcPuestos")%></font>&nbsp;</td>
			      <td width="13%" bgcolor="#EFEFEF">
			     
	             	 	<p align="center"><input type="checkbox" name="chkPuesto"  <% if xx <> 0 then response.write "checked" end if %> value="<%=Ob_RS("Id_SFPcPuestos")%>">	
	             	 		             	 	
	                   

	              </td>
			    </tr>
			    <%Ob_RS.MoveNext
			    Loop%>
			  </table>
			</center>
			
        <p align="center">
        <%'if fBtn then%>
		<input type="button" value="Enviar" <%=sBtnHab%> name="B1" OnClick="validacion2()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Restablecer" name="B2">
		<%'end if%>
        </p>
		<p align="center">
	  	<a href="javascript:history.back();">Regresar</a> </p>
	</form>			
	<%Else
		Response.write("<center>No existen cursos</center>")%>
<p align="center">
		<a href="javascript:history.back();">Regresar</a>
	<%End If%>
	<script>
		function validacion2()
		{
			//*** Bucle de revisión de checkbox seleccionados ***
			var nChkTot = document.frmDesvPer.chkPuesto.length //Total de objetos checkbox
			var flag = 0
			
			if (isNaN(document.frmDesvPer.chkPuesto.value)) 	//Validamos si solo es un Objecto Checkbox (Utilizamos un bucle)
				{
				for(i=0;i<nChkTot;i++)
					{
					//alert(document.frmDesvPer.chkPuesto[i].value)
					//alert(document.frmDesvPer.chkPuesto[i].checked)
					if (document.frmDesvPer.chkPuesto[i].checked == true)
						{flag = 1
						i = nChkTot} //*** se rompe el bucle
					}
				}
			else												//Solo es un objeto checkbox (No se utiliza bucle)
				{
				if (document.frmDesvPer.chkPuesto.checked == true)
					flag = 1				
				}
			//***
			
			//*** Condición de selección ***
			if (flag == 1)
				{//alert('listo')
				document.frmDesvPer.submit();}
			else
				{alert('Debe seleccionar al menos  un puesto')
				return false;}
				frmDesvPer.B1.disabled = true	
				document.frmDesvPer.submit();				
			
		}		
	    </script>
	
<%
Set Ob_RS = Nothing
Set Ob_Conn = Nothing
%> </p>
</body>

</html>