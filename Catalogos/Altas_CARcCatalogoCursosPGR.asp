<!-- #Include File = "../Session/ActiveSession.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
v_Tabla = "CARcCatalogoCursosPGR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 
'========== Combos
%>

<%'========= No tiene combos========= %>


<% '========== Inicia HTML %>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_CARcCatalogoCursosPGR.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  CatalogoCursosPGR   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARcCatalogoCursosPGR")  <> "" then  Ob_RS("CARcCatalogoCursosPGR")=UCASE(request("CARcCatalogoCursosPGR")) end if
        if request("Denominacion")  <> "" then  Ob_RS("Denominacion")=UCASE(request("Denominacion")) end if
        if request("Area_Instituto")  <> "" then  Ob_RS("Area_Instituto")=UCASE(request("Area_Instituto")) end if
        if request("Id_CAPdCurso")  <> "" then  Ob_RS("Id_CAPdCurso")=request("Id_CAPdCurso") end if
        if request("Generacion")  <> "" then  Ob_RS("Generacion")=UCASE(request("Generacion")) end if
        if request("Folio")  <> "" then  Ob_RS("Folio")=request("Folio") end if
        if request("AreaEspecializacion")  <> "" then  Ob_RS("AreaEspecializacion")=UCASE(request("AreaEspecializacion")) end if
        if request("Id_CAPcTipo_curso")  <> "" then  Ob_RS("Id_CAPcTipo_curso")=request("Id_CAPcTipo_curso") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Comentario</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style='text-transform: uppercase' NAME='CARcCatalogoCursosPGR' SIZE=10 ROWS=5 COLS=35><%=CARcCatalogoCursosPGR%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Denominación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style='text-transform: uppercase' NAME='Denominacion' SIZE=10 ROWS=5 COLS=35><%=Denominacion%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Área o instituto</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Area_Instituto' SIZE=50 MAXLENGTH=50 VALUE=<%= Area_Instituto%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Curso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPDCURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPdCurso' SIZE=1 >
          <% IF Id_CAPdCurso = "" OR Id_CAPdCurso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CAPdCurso")= CINT(Id_CAPdCurso) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Generación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='Generacion' SIZE=10 MAXLENGTH=10 VALUE=<%= Generacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Folio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Folio' SIZE=5 MAXLENGTH=5 VALUE=<%= Folio%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Área de especialización</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' style='text-transform: uppercase' NAME='AreaEspecializacion' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaEspecializacion%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Tipo de curso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CAPCTIPO_CURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CAPcTipo_curso' SIZE=1 >
          <% IF Id_CAPcTipo_curso = "" OR Id_CAPcTipo_curso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CAPcTipo_curso")= CINT(Id_CAPcTipo_curso) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

  <INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
<% Ob_Rs.CLOSE %>


  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormAltas.Denominacion.value  == "")
  {
       alert("EL CAMPO: Denominación, no puede estar vacio");
       return false;
  }
  


}
</script> 

