<% On Error Resume Next %>
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdAsignaPlaza"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)
    idPersona = request("Id_CARdDatosPersonales")

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
  <FORM METHOD="post" ACTION= "Altas_CARdAsignaPlaza.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  AsignaPlaza   </FONT>
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
        if request("CARdAsignaPlaza")  <> "" then  Ob_RS("CARdAsignaPlaza")=request("CARdAsignaPlaza") end if
        if request("FechaAsignacion")  <> "" then  Ob_RS("FechaAsignacion")=request("FechaAsignacion") end if
        if request("Id_CARcPLAZA")  <> "" then  Ob_RS("Id_CARcPLAZA")=request("Id_CARcPLAZA") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Id_CARcTIPOASIGNACION")  <> "" then  Ob_RS("Id_CARcTIPOASIGNACION")=request("Id_CARcTIPOASIGNACION") end if
		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		
        Ob_RS.update
        response.clear
		
	      %>
		 		<!-- #INCLUDE File="errror.inc" -->
				<%
		response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
      end if
	 	     %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Fecha de Asignacion</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAsignacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaAsignacion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAsignacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Numero de Plaza</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcPLAZA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPLAZA' SIZE=1 >
          <% IF Id_CARcPLAZA = "" OR Id_CARcPLAZA = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPLAZA")= CINT(Id_CARcPLAZA) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPLAZA")%>'> <%= Ob_RS2("CARcPLAZA")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPLAZA")%>'> <%= Ob_RS2("CARcPLAZA")%>
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
         <B>Tipo de Asignaci?n</B>
      </TD>
      <TD> 
        <%Sql ="SELECT * FROM CARcTIPOASIGNACION" %>
        <% Ob_RS2.OPEN Sql, Ob_Conn %>
        <select name='Id_CARcTIPOASIGNACION' size=1 >
          <% IF Id_CARcTIPOASIGNACION = "" OR Id_CARcTIPOASIGNACION = "0" THEN %>
          <option value='0'> Seleccione registro </option>
          <% END IF  %>
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcTIPOASIGNACION")= CINT(Id_CARcTIPOASIGNACION) THEN %>
          <option selected value='<%=Ob_RS2("Id_CARcTIPOASIGNACION")%>'> <%= Ob_RS2("CARcTIPOASIGNACION")%> 
          </option>
          <% ELSE  %>
          <option value='<%=Ob_RS2("Id_CARcTIPOASIGNACION")%>'> <%= Ob_RS2("CARcTIPOASIGNACION")%> 
          </option>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
        </select> 
        <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD height="29">
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARdAsignaPlaza' SIZE=50 MAXLENGTH=50 VALUE=<%= CARdAsignaPlaza%>>
      </TD > 
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de par?metros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >


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

  if (FormAltas.FechaAsignacion.value  == "")
  {
       alert("EL CAMPO: Fecha de Asignacion, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARcPlaza.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Numero de Plaza.");
       return false;
  }
  
  
  if (FormAltas.Id_CARcTipoAsignacion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Tipo de Asignaci?n.");
       return false;
  }
  

}
</script> 

