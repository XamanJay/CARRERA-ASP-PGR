<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->

<html>
<head>

<title>Pagina nueva 1</title>
</head>

<script language="javascript">
function detalle( url ) {

}</script>

<body BGPRPERTIES="FIXED" background="softgri2.gif">
<form>

<% varbuscar= Request.Querystring("lnkInd")

NACIMIENTO=request.Querystring("lnkNACIMIENTO")

'response.write (NACIMIENTO)
%>


<p style="margin-top: 0; margin-bottom: 0">
<img border="0" src="Republica%20Mexicana1.gif" style="position: absolute; left: 156; top:17; float:right" align="right"></p>
<p style="margin-top: 0; margin-bottom: 0">

<p style="margin-top: 0; margin-bottom: 0">
<img border="0" src="IMAG_NAC/<%=NACIMIENTO%>.gif" style="position: absolute; left: 156; top:17; float:right" align="right"></p>
</p>
<%
Set OB_conn_pre = Server.CreateObject("ADODB.Connection")
Set OB_rs_pre = Server.CreateObject("ADODB.Recordset")
Set OB_rscount_pre = Server.CreateObject("ADODB.Recordset")


Ob_Conn_pre.Provider="sqloledb"
'Ob_Conn_pre.Open="SERVER="+ session("IP_DATOS") +";Database=SIIFP;UID=carrera;PWD=carrepgr"


   IP_Servidor = session("IP_Servidor")
     Ob_Conn_pre.Open="Server="&IP_Servidor&";Database=SIIFP;UID="&session("UserID")&";PWD="&session("Password")


SQL1 = " SELECT     COUNT(Id_CARcAgencias) AS CANT   FROM CARdHistoriaLaboralPGR  WHERE (Id_CARdDatosPersonales = '"&varbuscar&"')"

OB_RScount_pre.Open Sql1, OB_Conn_pre %>


<%  TotEdo = Ob_RScount_pre ("CANT")
RESPONSE.WRITE (i)%>

<%
SQL = "Select *  FROM CARdHistoriaLaboralPGR  WHERE (Id_CARdDatosPersonales= '"&varbuscar&"') ORDER BY FechaAdscripcionActual"

OB_RS_pre.Open Sql, OB_Conn_pre
%>

       <%Num_Campos = OB_rs_pre.Fields.Count %>

		<%IF NOT OB_Rs_pre.EOF THEN 
	
		Dim estado(),i %>
<p>&nbsp;</p>

<center><CENTER>
<br><br><br>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>



<TR>	
	
	<% j=0
	FOR i=0 TO TotEdo - 1
	Redim Preserve estado(i)
	%>
          
		<%	Estado (i) = Ob_RS_pre("Id_CARcAgencias") 
		Ob_RS_pre.MoveNext
		%>
	
      <% NEXT     
		 
j=0
DO UNTIL j = i
				Edo = Estado (j)
				imag=Edo&"."&gif
				Imag= "imagenes/"& Edo
			


%>



<p style="margin-top: 0; margin-bottom: 0">
<img border="0" src="AGENCIAS/<%=Edo %>.gif" style="position: absolute; left: 156; top:17; float:right" align="right"></p>
</p>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%
J= J+1
LOOP
	ELSE
      RESPONSE.WRITE "<CENTER><H3>SIN AGENCIA</H3></CENTER>"		
	END IF 

	Ob_Rs_pre.Close
	Ob_Conn_pre.Close
	%>
					  					
<b>

<p style="margin-top: 0; margin-bottom: 0">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



</p>

<center>
<p>&nbsp;</p></center>


<body>

</b>
</form>
<p>&nbsp;</p>

</font>

</body>

</html>
<%Set rs_pre = Nothing
Set conn_pre = Nothing
%>
 <!-- #INCLUDE File="errores.inc" -->