<%Response.Expires = 0
Response.Buffer = True%>
<html><head><title>Paginación</title></head>
<!-- #INCLUDE File="ADOVBS.inc"-->
<%
Set Ob_Conn = Server.CreateObject("ADODB.Connection")
Set Ob_RS= Server.CreateObject("ADODB.RecordSet")
v_ODBC  = "SIIFP"
 Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
vestfolio="Activo"
TextEstatusInt="Pasa a Modulo de Gestión"

SQL = "SELECT CAPdConvocatoria FROM CAPdConvocatoria"
Session("SQL")=SQL
Ob_RS.Open SQL, Ob_Conn, 1, 1

If not Ob_RS.EOF Then%>
<body background="softgri1.jpg">
<%  '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=PAGINACIÓN-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    If isNull(request("NumPerPage")) or request("NumPerPage") = "" or request("NumPerPage") = "0" then 
		NumPerPage = 10
	else 
		NumPerPage = request("NumPerPage")
	end if

    If Request.QueryString("page") = "" then
		CurrentPage = 1		'primera pagina
		NumPerPageOf = 1
    Else
		CurrentPage = CInt(Request.QueryString("page"))
		NumPerPageOf = ((CurrentPage * NumPerPage) - NumPerPage) + 1
    End If
	   
    Number = Ob_RS.RecordCount
    
    If Not Ob_RS.EOF Then
    	Ob_RS.MoveFirst
    	Ob_RS.PageSize = Int(NumPerPage)
		TotalPages = Ob_RS.PageCount

		NumPerPageTo = (NumPerPageOf + NumPerPage) - 1

		if NumPerPageOf = 1 then
			if Int(Number) < Int(NumPerPage) then
				NumPerPageTo = Number
			else
				NumPerPageTo = NumPerPage
			end if
		elseif NumPerPageTo > number then
			NumPerPageTo = Number
		else
			NumPerPageTo = NumPerPageTo
		end if
		
		Ob_RS.AbsolutePage = CurrentPage
    End If

%>
<table WIDTH="100%" style="border-collapse: collapse; border-left-width: 1; border-right-width: 1; border-top: 1px solid #000000; border-bottom-width: 1" bordercolor="#111111" cellpadding="0" cellspacing="0">
<tr>
  <td>
<font face="Arial Narrow" style="font-size:11pt" ><b>Mostrando Página <%=CurrentPage%> de <%=TotalPages%>
:&nbsp;&nbsp;Elementos&nbsp; <%=NumPerPageOf%> - <%=NumPerPageTo%> &nbsp;&nbsp;de&nbsp;&nbsp;<%= Number %>&nbsp;&nbsp; 
Registros......<br>

</b>

</font>

  </td>
  <td align=right>
<font face="Arial Narrow" size=2 ><b> <!--<INPUT size=2 type=text id=NumPerPage name=NumPerPage value=<%'=NumPerPage %> readonly>-->
</b></font>
</td>
  </tr>
</table>
<br>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
  
  <tr bgcolor="#336699">
    <td width="2%" align="center"><font color="#FFFFFF"><b>Acción</b></font></td>
    <td width="5%" align="center"><font color="#FFFFFF"><b>Campo1</b></font></td>
    <td width="7%" align="center"><font color="#FFFFFF"><b>Campo2</b></font></td>
    <td width="17%" align="center"><font color="#FFFFFF"><b>Campo4</b></font></td>
     <td width="21%" align="center"><font color="#FFFFFF"><b>Campo4</b></font></td>
    <td width="17%" align="center"><font color="#FFFFFF"><b>Campo5</b></font></td>
    <td width="14%" align="center"><font color="#FFFFFF"><b>Campo6</b></font></td>
    <td width="21%" align="center"><font color="#FFFFFF"><b>Campo7</b></font></td>
  </tr>
  <%DO WHILE NOT Ob_RS.EOF and Count < Ob_RS.PageSize
         count = count + 1 
         if strbgcolor = "#FFFFFF" then
			strbgcolor = "#00CCCC"
		else
			strbgcolor = "#FFFFFF"
		end if
   %>
  <tr bgcolor="<%=strbgcolor%>">
    <td width="8%" height="71">&nbsp;
    <table>
   
    <tr><td><A HREF="DetalleDocs.asp"><u>Detalle</u></A>&nbsp;</td></tr>
    <tr><td><A HREF="Historial.asp"><u>Historial</u></A>&nbsp;</td></tr>

    </table>
    </td>
	<td width="5%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></font></td>
    <td width="11%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
    <td width="24%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
    <td width="31%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
    <td width="23%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
    <td width="16%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
    <td width="31%">&nbsp;<%=Ob_RS("CAPdConvocatoria")%></td>
  </tr>
 <% Ob_RS.MoveNext
  LOOP      'Creando el numero de paginas
    'Despliega PREV pagina 
    %>
	<p align=center>
	<%
    If Not CurrentPage = 1 Then %>
		<font face="Arial Narrow"><b>Páginas:</b> </font>
		<a class=previous href="<%=strUrl%>?NumPerPage=<%=NumPerPage%>&page=<%=CurrentPage - 1 %>&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>">Anterior</a>&nbsp;&nbsp;
     <%
		if CurrentPage > 5 and TotalPages > 10 then %>
		<a class=EnActivePage href="<%=strUrl%>?NumPerPage=<%=NumPerPage%>&page=1&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>">1</a>&nbsp;...&nbsp;
		<%
		end if

		if TotalPages > 10 then
			if CurrentPage > 5 then
				if TotalPages > (CurrentPage + 5) then
					ini = (CurrentPage - 4)
					fim = (CurrentPage + 5)
				else
					ini = (TotalPages - 9)
					fim = TotalPages
				end if 
			else
				ini = 1
				fim = 10
			end if
		else
			ini=1
			fim = TotalPages
		end if
    
		For a = ini to fim
			If a = Cint(request("page")) then %>
			
			<font class=ActivePage><%=a%></font>&nbsp;&nbsp;
			<%
			Else %>
			<a class=EnActivePage href="<%=strUrl%>?NumPerPage=<%=NumPerPage%>&amp;page=<%=a%>&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>"><%=a%></a>&nbsp;&nbsp;
			<%
			End if
		Next
    
    Else
   		if TotalPages = 1 then 
   				Response.write ""
		Else %>
   			<font  face="Arial Narrow"><b>Páginas :</b> </font>
   			<font class=ActivePage><b>1</b></font>&nbsp;&nbsp;
    	<%
    	End if

    	if TotalPages > 10 then
    		fim = 10
    	else
    		fim = TotalPages
    	end if

    	For a = 2 to fim
		If a = Cint(request("page")) then %>
		<font class=ActivePage><%= a %></font>&nbsp;&nbsp;
		<%
		Else %>
		<a class=EnActivePage href="<%=strUrl%>?NumPerPage=<%=NumPerPage%>&page=<%=a%>&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>"><%=a%></a>&nbsp;&nbsp;
		<%
		End if
		Next
    End If
    
    if CurrentPage < TotalPages - 5 and TotalPages > 10 then %>
	    <font class=previous>...&nbsp;</font>
	    <a class=EnActivePage href="<%=strUrl%>?NumPerPage=<%=NumPerPage%>&page=<%=TotalPages%>&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>&amp"><%=TotalPages%></a>&nbsp;&nbsp;
    <%
    end if
    
    'Display NEXT page link, if appropriate
    If Not CurrentPage = TotalPages Then %>
    	<a class=previous href="<%=strUrl %>?NumPerPage=<%= NumPerPage%>&page=<%=CurrentPage + 1%>&C1=<%=btntipdoc%>&C2=<%=btnnumdoc%>&C3=<%=btnstatus%>&C4=<%=btnfirma%>&C5=<%=btnfchrecep%>&TipDoc=<%=vtipdoc%>&numdoc=<%=vnumdoc%>&status=<%=vstatus%>&Signado=<%=vfirma%>&FchSistema=<%=CFchSys%>&fchrecep1=<%=CFchIni%>&fchrecep2=<%=CFchFin%>&amp">Siguiente</a>
    <%
    Else
    	Response.Write ("")
    End If
%>
	</p>
</table>
<%Else %>
<%
Response.Redirect "paginaparamostraquenohaydatos.asp"
End If%>
</body></html>
