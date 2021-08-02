<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcCatalogoCursosPGR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARcCatalogoCursosPGR WHERE Id_CARcCatalogoCursosPGR ="+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 

'========== Combos
%>

<%
'======= Inicializa variables de ambiente ===========
   CARcCatalogoCursosPGR= OB_RS("CARcCatalogoCursosPGR")
   Denominacion= OB_RS("Denominacion")
   Area_Instituto= OB_RS("Area_Instituto")
   Id_CAPdCurso= OB_RS("Id_CAPdCurso")
   Generacion= OB_RS("Generacion")
   Folio= OB_RS("Folio")
   AreaEspecializacion= OB_RS("AreaEspecializacion")
   Id_CAPcTipo_curso= OB_RS("Id_CAPcTipo_curso")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARcCatalogoCursosPGR.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver CARcCatalogoCursosPGR  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  CARcCatalogoCursosPGR  </FONT></h2>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
<%END IF %> 
   </H2>

  </CENTER>

 <!--- insertar resulstado de  LOOP ----------------------------------------------------------------------------------------------- --->

    <% 
     vModi = request("Modi") 
     if vModi = "S" then  
        Ob_RS.Close 
        consulta = "SELECT * FROM CARcCatalogoCursosPGR WHERE Id_CARcCatalogoCursosPGR ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARcCatalogoCursosPGR")  <> "" then  Ob_RS("CARcCatalogoCursosPGR")=request("CARcCatalogoCursosPGR") end if
        if request("Denominacion")  <> "" then  Ob_RS("Denominacion")=request("Denominacion") end if
        if request("Area_Instituto")  <> "" then  Ob_RS("Area_Instituto")=request("Area_Instituto") end if
        if request("Id_CAPdCurso")  <> "" then  Ob_RS("Id_CAPdCurso")=request("Id_CAPdCurso") end if
        if request("Generacion")  <> "" then  Ob_RS("Generacion")=request("Generacion") end if
        if request("Folio")  <> "" then  Ob_RS("Folio")=request("Folio") end if
        if request("AreaEspecializacion")  <> "" then  Ob_RS("AreaEspecializacion")=request("AreaEspecializacion") end if
        if request("Id_CAPcTipo_curso")  <> "" then  Ob_RS("Id_CAPcTipo_curso")=request("Id_CAPcTipo_curso") end if
        Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Comentario:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARcCatalogoCursosPGR' SIZE=10 ROWS=5 COLS=35><%=CARcCatalogoCursosPGR%></TEXTAREA>
  	<BR><BR>
      </TD > 
     <TR>
      <TD>
        <B>Denominación:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Denominacion' SIZE=10 ROWS=5 COLS=35><%=Denominacion%></TEXTAREA>
  	<BR><BR>
      </TD > 
     <TR>
      <TD>
        <B>Área o instituto:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Area_Instituto' SIZE=50 MAXLENGTH=50 VALUE=<%= Area_Instituto%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CAPDCURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Curso</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CAPdCurso' SIZE=1 >
          <% IF Id_CAPdCurso = "" OR Id_CAPdCurso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CAPdCurso")= CINT(Id_CAPdCurso) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPdCurso")%>'> <%= Ob_RS2("CAPdCurso")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Generación:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Generacion' SIZE=10 MAXLENGTH=10 VALUE=<%= Generacion%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD>
        <B>Folio:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Folio' SIZE=5 MAXLENGTH=5 VALUE=<%= Folio%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD>
        <B>Área de especialización:<BR>  </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AreaEspecializacion' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaEspecializacion%>>
		 <BR> <BR>
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CAPCTIPO_CURSO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Tipo de curso</B>:<BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CAPcTipo_curso' SIZE=1 >
          <% IF Id_CAPcTipo_curso = "" OR Id_CAPcTipo_curso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CAPcTipo_curso")= CINT(Id_CAPcTipo_curso) THEN %>                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CAPcTipo_curso")%>'> <%= Ob_RS2("CAPcTipo_curso")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcCatalogoCursosPGR >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >

  <INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>
<% Ob_Rs.CLOSE %>


 
<% IF TOper = "MOD" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1" ID=button1 NAME=button1>
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
<% ELSE %>
   <BR>
  <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% END IF %> 

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

  if (FormEdita.Denominacion.value  == "")
  {
       alert("EL CAMPO: Denominación, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARcCatalogoCursosPGR.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Catálogo de cursos PGR.");
       return false;
  }
  
  if (FormEdita.Id_CAPdCurso.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Curso.");
       return false;
  }
  
  if (FormEdita.Id_CAPcTipo_curso.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de curso.");
       return false;
  }
  


}
</script> 
