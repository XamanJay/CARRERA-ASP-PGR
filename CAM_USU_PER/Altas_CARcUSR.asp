<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcUSR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_SERVER") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

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
  <FORM METHOD="post" ACTION= "Altas_CARcUSR.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  USR   </FONT>
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
        if request("CARcUSR")  <> "" then  Ob_RS("CARcUSR")=request("CARcUSR") end if
        if request("PW")  <> "" then  Ob_RS("PW")=request("PW") end if
        if request("Id_CARcSubprocuradurias")  <> "" then  Ob_RS("Id_CARcSubprocuradurias")=request("Id_CARcSubprocuradurias") end if
        if request("Id_CARcDG_o_Delegaciones")  <> "" then  Ob_RS("Id_CARcDG_o_Delegaciones")=request("Id_CARcDG_o_Delegaciones") end if
        if request("Id_CARcDir_o_subsede")  <> "" then  Ob_RS("Id_CARcDir_o_subsede")=request("Id_CARcDir_o_subsede") end if
        if request("Id_CARcTipoUSR")  <> "" then  Ob_RS("Id_CARcTipoUSR")=request("Id_CARcTipoUSR") end if
        if request("Nombre")  <> "" then  Ob_RS("Nombre")=request("Nombre") end if
        if request("Micro")  <> "" then  Ob_RS("Micro")=request("Micro") end if
        if request("Id_CARcDatosPersonales")  <> "" then  Ob_RS("Id_CARcDatosPersonales")=request("Id_CARcDatosPersonales") end if
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
        <B>Usuario</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARcUSR' SIZE=50 MAXLENGTH=50 VALUE=<%= CARcUSR%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Password</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='PW' SIZE=50 MAXLENGTH=50 VALUE=<%= PW%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>curaduría</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCSUBPROCURADURIAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1 >
          <% IF Id_CARcSubprocuradurias = "" OR Id_CARcSubprocuradurias = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
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
         <B>/ Delegación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDG_O_DELEGACIONES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1 >
          <% IF Id_CARcDG_o_Delegaciones = "" OR Id_CARcDG_o_Delegaciones = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDG_o_Delegaciones")= CINT(Id_CARcDG_o_Delegaciones) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_RS2("CARcDG_o_Delegaciones")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_RS2("CARcDG_o_Delegaciones")%>
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
         <B> / Subsede</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDIR_O_SUBSEDE" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDir_o_subsede' SIZE=1 >
          <% IF Id_CARcDir_o_subsede = "" OR Id_CARcDir_o_subsede = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDir_o_subsede")= CINT(Id_CARcDir_o_subsede) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDir_o_subsede")%>'> <%= Ob_RS2("CARcDir_o_subsede")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDir_o_subsede")%>'> <%= Ob_RS2("CARcDir_o_subsede")%>
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
         <B>o Usuario</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOUSR" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoUSR' SIZE=1 >
          <% IF Id_CARcTipoUSR = "" OR Id_CARcTipoUSR = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoUSR")= CINT(Id_CARcTipoUSR) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoUSR")%>'> <%= Ob_RS2("CARcTipoUSR")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoUSR")%>'> <%= Ob_RS2("CARcTipoUSR")%>
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
        <B>Nombre de la Persona</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Nombre' SIZE=10 ROWS=5 COLS=35><%=Nombre%></TEXTAREA>
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

 // no Tiene Campos Obligatorios 


}
</script> 

