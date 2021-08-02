<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdCursosPersona"
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
  <FORM METHOD="post" ACTION= "Altas_CARdCursosPersona.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  CursosPersona   </FONT>
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
        if request("CARdCursosPersona")  <> "" then  Ob_RS("CARdCursosPersona")=request("CARdCursosPersona") end if
        if request("Id_CARcTipoCapacitacion")  <> "" then  Ob_RS("Id_CARcTipoCapacitacion")=request("Id_CARcTipoCapacitacion") end if
        if request("NombreCurso")  <> "" then  Ob_RS("NombreCurso")=request("NombreCurso") end if
        if request("FechaInicio")  <> "" then  Ob_RS("FechaInicio")=request("FechaInicio") end if
        if request("FechaTermino")  <> "" then  Ob_RS("FechaTermino")=request("FechaTermino") end if
        if request("Id_CARcTipoInstitucion")  <> "" then  Ob_RS("Id_CARcTipoInstitucion")=request("Id_CARcTipoInstitucion") end if
        if request("AreaInstituto")  <> "" then  Ob_RS("AreaInstituto")=request("AreaInstituto") end if
        if request("Id_CARcTipoDocumento")  <> "" then  Ob_RS("Id_CARcTipoDocumento")=request("Id_CARcTipoDocumento") end if
        if request("Calificacion")  <> "" then  Ob_RS("Calificacion")=request("Calificacion") end if
        if request("Creditos")  <> "" then  Ob_RS("Creditos")=request("Creditos") end if
        if request("HorasCursadas")  <> "" then  Ob_RS("HorasCursadas")=request("HorasCursadas") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("FechaCaptura")  <> "" then  Ob_RS("FechaCaptura")=request("FechaCaptura") end if
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdCursosPersona' SIZE=10 ROWS=5 COLS=35><%=CARdCursosPersona%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Tipo de Capacitación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOCAPACITACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoCapacitacion' SIZE=1 >
          <% IF Id_CARcTipoCapacitacion = "" OR Id_CARcTipoCapacitacion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoCapacitacion")= CINT(Id_CARcTipoCapacitacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoCapacitacion")%>'> <%= Ob_RS2("CARcTipoCapacitacion")%>
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
        <B>Nombre del curso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='NombreCurso' SIZE=10 ROWS=5 COLS=35><%=NombreCurso%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormAltas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de término</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormAltas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Tipo de Institución</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOINSTITUCION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoInstitucion' SIZE=1 >
          <% IF Id_CARcTipoInstitucion = "" OR Id_CARcTipoInstitucion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoInstitucion")= CINT(Id_CARcTipoInstitucion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoInstitucion")%>'> <%= Ob_RS2("CARcTipoInstitucion")%>
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
        <B>Nombre de la Institución</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AreaInstituto' SIZE=50 MAXLENGTH=50 VALUE=<%= AreaInstituto%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Documento obtenido</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPODOCUMENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoDocumento' SIZE=1 >
          <% IF Id_CARcTipoDocumento = "" OR Id_CARcTipoDocumento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoDocumento")= CINT(Id_CARcTipoDocumento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoDocumento")%>'> <%= Ob_RS2("CARcTipoDocumento")%>
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
        <B>Calificación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' SIZE=4 MAXLENGTH=4 VALUE=<%= Calificacion%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Creditos</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Creditos' SIZE=4 MAXLENGTH=4 VALUE=<%= Creditos%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Horas Cursadas</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='HorasCursadas' SIZE=4 MAXLENGTH=4 VALUE=<%= HorasCursadas%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Datos de la persona</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARDDATOSPERSONALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARdDatosPersonales' SIZE=1 >
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
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
        <B>Fecha de Captura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaCaptura' SIZE=10 MAXLENGTH=10 VALUE=<%= FechaCaptura%>>
      </TD > 
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

  if (FormAltas.Id_CARdDatosPersonales.value  == "")
  {
       alert("EL CAMPO: Id_Datos de la persona, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdCursosPersona.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Cursos persona.");
       return false;
  }
  
  if (FormAltas.Id_CARcTipoCapacitacion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Capacitación.");
       return false;
  }
  
  if (FormAltas.Id_CARcTipoInstitucion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Institución.");
       return false;
  }
  
  if (FormAltas.Id_CARcTipoDocumento.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Documento obtenido.");
       return false;
  }
  
  if (FormAltas.Creditos.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Creditos, Solo Acepta Numeros");
       return false;
  }
  
  if (FormAltas.HorasCursadas.value.search("[^0-9]")  == 0 ) 
  {
       alert("EL CAMPO: Horas Cursadas, Solo Acepta Numeros");
       return false;
  }
  
  if (FormAltas.Id_CARdDatosPersonales.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Datos de la persona.");
       return false;
  }
  


}
</script> 

