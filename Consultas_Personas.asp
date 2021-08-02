<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->
<!--link href="Estilo.css" rel="stylesheet" type="text/css"-->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdDatosPersonales"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b = Session("Elementos")(Session("Contador"))
		
	end if
   RFC = ucase(REQUEST("rfc")) 
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   IF RFC <> "" THEN 
      IF LEN(RFC) < 10 OR LEN(RFC) > 13 OR NOT RFCValido(RFC) THEN
	    response.write ("<BR><BR><CENTER><h3>RFC, No valido : "+RFC+"</h3></CENTER>")
		Response.end
	  END IF 
      consulta = "SELECT * FROM CARdDatosPersonales WHERE  RFC='" +RFC+"'"
      Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
      total_campos = Ob_RS.FIELDS.COUNT
	  IF OB_RS.EOF THEN %>
         <HTML>
         <link href="Estilo.css" rel="stylesheet" type="text/css">
          <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
         <FORM METHOD="post" ACTION= "Altas_CARdDatosPersonales.asp" NAME= "FormConsultas">
          <BR><BR>
		  <center>
          <H4>No existe registro de la persona, favor de agregar sus Datos</H4>
          <H3>RFC : <font color="#0000FF"> <%=RFC%></font></H3></center>
          <BR><BR>
        <INPUT TYPE="Hidden" NAME="RFC" Value = "<%= ucase(RFC)%>" >
         <INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
          <p ALIGN="center"> &nbsp;
         <INPUT TYPE="submit" VALUE="Agregar Persona" NAME="B1"> &nbsp;&nbsp;&nbsp; 
         <INPUT TYPE="reset" VALUE="Nueva Búsqueda" NAME="B2" onClick="location.href='Consultas_Personas.asp'"> &nbsp;&nbsp;&nbsp; 
          </FORM>
          </BODY>
         </HTML>
  <%
	    response.end   
'	    response.Redirect("https://"+session("IP_SERVER")+"/CarreraPGR/Altas_CARdDatosPersonales.asp?RFC="+RFC) 
	  ELSE %>
        <HTML>
            <link href="Estilo.css" rel="stylesheet" type="text/css">

           <HEAD>
           <TITLE>
            Pantalla Consultas
           </TITLE>
          </HEAD>

          <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
          <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
          <FORM METHOD="post" ACTION= "Altas_CARdDatosPersonales.asp" NAME= "FormConsultas">
          <CENTER>
		  <br>
		  <H3><FONT color="#003366">Esta Persona ya se encuentra registrada.</FONT></H3>
		  <br>
		  <br>

          <TABLE border="1">
	         <tr bgcolor="#336699">
			     <TH><FONT color="#FFFFFF"> Acción</FONT></TH >
			     <TH><FONT color="#FFFFFF"> RFC</FONT></TH >
			     <TH><FONT color="#FFFFFF"> Nombre</FONT></TH >
			     <TH><FONT color="#FFFFFF"> Fecha de Nacimiento</FONT></TH >
			     <TH><FONT color="#FFFFFF">CURP</FONT></TH >
	        </tr>
			<% DO UNTIL OB_RS.EOF%>
	        <tr>
		         <TD><a href="Carr_DosMarcos03.asp?Id_CardDatosPersonales=<%=Ob_RS("ID_CARdDatosPersonales")%>&tabla=CARDDATOSPERSONALES"><font size="2">Detalle</font></a><br></td>
			     <TD> <%= Ob_RS("RFC") %> &nbsp;</TD >
			     <TD> <%= Ob_RS("ApellidoPaterno")+" "+Ob_RS("ApellidoMaterno")+" "+Ob_RS("Nombre") %> &nbsp;</TD >
			     <TD> <%= Ob_RS("FechaNacimiento") %> &nbsp;</TD >
			     <TD> <%= Ob_RS("CURP") %> &nbsp;</TD >
          </tr> 
			<%    OB_RS.MOVENEXT
			  LOOP%>
         </TABLE>
        <!-- <INPUT TYPE="submit" VALUE="Agregar Persona" NAME="B1"> &nbsp;&nbsp;&nbsp; -->
         <INPUT TYPE="reset" VALUE="Nueva Búsqueda" NAME="B2" onClick="location.href='Consultas_Personas.asp'"> &nbsp;&nbsp;&nbsp; 
         <INPUT TYPE="Hidden" NAME="RFC" Value = "<%= ucase(RFC)%>" >
         <INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
         </BODY>
         </HTML>
<%	  RESPONSE.END
      END IF
    END IF

   ruta_img_calendario		= "Calendario.gif"
%>



<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Consultas_pERSONAS.asp" NAME= "FormConsultas">
        <input type="hidden" name="Agregar" value="S">

<BR><BR> 
  <CENTER>
    <H2> <FONT COLOR= #3366CC>Capture un RFC</FONT> </H2>
  </CENTER>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->
<Center>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>RFC</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='RFC' SIZE=15 style="text-transform: uppercase" MAXLENGTH=15 VALUE=<%= RFC%>>
      </TD > 
     </TR>
</TABLE>
</Center>
<BR><BR>
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!-- #INCLUDE File="errores.inc" -->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormAltas.RFC.value  == "")
  {
       alert("EL CAMPO: RFC, no puede estar vacio");
       return false;
  }
   
}
</script> 
<%
FUNCTION RFCValido(RFC)
   xLetras=MID(RFC,1,4)
   xNumeros=MID(RFC,5,6)
 Error=0
 For Z=1 to 4
    If InStr("ABCDEFGHIJKLMNOÑPQRSTUVWXYZ",MID(xLetras,Z,1))=0 Then
	   Z=9
	   Error=1
	End IF
 Next
 IF ERROR = O THEN
    For Z=1 to 6
       If InStr("1234567890",MID(xNumeros,Z,1))=0 Then
     	   Z=9
   	       Error=1
	   End IF
    Next
 end if 
 IF ERROR = O THEN
    If CINT(MID(RFC,7,2)) > 12 Then
	    Error=1
    End IF
    If CINT(MID(RFC,9,2)) > 31 Then
	    Error=1
    End IF
 end if 
 IF Error = 1 THEN
    RFCValido = False
 ELSE
    RFCValido = TRUE
 END IF
END FUNCTION
%>

<!--- ================================================================================================================ --->


