<%	
if Not IsNull(Session("UserSub")) and  Session("UserSub")>0 then
	sql = sql + " and "
	sql = sql + Tabla + "."
	sql = sql + "Id_SPGRcSubprocuradurias = " + cstr(Session("UserSub"))
	sql = sql + " "
end if	
if Not IsNull(Session("UserDel")) and Session("UserDel")>0  then
	sql = sql + " and "
	sql = sql + Tabla + "."
	sql = sql + " "
	sql = sql + "Id_SPGRcDelegaciones = " + cstr(Session("UserDel"))
end If
if Not IsNull(Session("UserAgen")) and Session("UserAgen")>0  then
	sql = sql + " and "
	sql = sql + Tabla + "."
	sql = sql + "Id_SPGRcAgencias = " + cstr(Session("UserAgen"))
	sql = sql + " "
end if
if Not IsNull(Session("UserMesa")) and Session("UserMesa")>0   then
	sql = sql + " and "
	sql = sql + Tabla + "."
	sql = sql + "Id_SPGRcMesas = " + cstr(Session("UserMesa"))
	sql = sql + " "
End If



%>
<font color="#FFFFFF">QryUs</font>

