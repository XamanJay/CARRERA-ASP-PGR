<%
Dim fLimpiar,sCadenaL
FUNTION fLimpiar(sCadenaL)
	sCadenaL = Trim(sCadena)
	sCadenaL = Replace(sCadena,"'","''")
	sCadenaL = Replace(sCadena,""","""")	
	fLimpiar = sCadenaL
END FUNCTION
%>