<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_AUX  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdNombramientos"
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

  SQLNOM = "select * from CARdNombramientos WHERE Id_CARdDatosPersonales ="+CSTR(idPersona)
  Ob_AUX.OPEN SQLNOM, Ob_Conn,2, 3, 1
  IF Ob_AUX.EOF THEN
      CeroReg = TRUE
  END IF
  Ob_AUX.CLOSE
 
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
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Nombramientos</FONT>
    </H2>
  </CENTER>
<% 'usu = Session("UserLogin")
  'response.Write(session("UserLogin")&"p")
 ' IP_user = request.servervariables("remote_addr")
  ' response.Write(IP_user)
 '  response.end
   %>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdNombramientos")  <> "" then  Ob_RS("CARdNombramientos")=request("CARdNombramientos") end if
        if request("Id_CARcTipoNombramiento")  <> "" then  Ob_RS("Id_CARcTipoNombramiento")=request("Id_CARcTipoNombramiento") end if
        if request("Id_CARcCategoria")  <> "" then  Ob_RS("Id_CARcCategoria")=request("Id_CARcCategoria") end if
        if request("Id_CARcNivel")  <> "" then  Ob_RS("Id_CARcNivel")=request("Id_CARcNivel") end if
        if request("Id_CARcNombramientoMotivo")  <> "" then  Ob_RS("Id_CARcNombramientoMotivo")=request("Id_CARcNombramientoMotivo") end if
		
		if request("Id_CARcTipo_ingreso") <> " " then Ob_RS("Id_CARcTipo_ingreso")=request("Id_CARcTipo_ingreso") end if
        if REQUEST("Fecha_ingreso") <> " " then Ob_RS("Fecha_ingreso")=request("Fecha_ingreso") end if
		if REQUEST("Fecha_nombramiento") <> " " then Ob_RS("Fecha_nombramiento")=REQUEST("Fecha_nombramiento") end if
		IF REQUEST("Nombramiento_historico") <> " " then Ob_RS("Nombramiento_historico")=REQUEST("Nombramiento_historico") end if
		IF REQUEST("Id_CARcTipo_Designacion") <> " " THEN Ob_RS("Id_CARcTipo_Designacion")=REQUEST("Id_CARcTipo_Designacion") end if
		
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		



		
        Ob_RS("FechaCaptura")= date()
'        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
    <%'===== Solo se captura los siguientes dos datos cuando es el primer REgistro
	 IF CeroReg THEN %>
 	      <TR>
      <TD> 
         <B>Tipo de ingreso</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPO_INGRESO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipo_ingreso' SIZE=1 >
          <% IF Id_CARcTipo_ingreso = "" OR Id_CARcTipo_ingreso = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipo_ingreso")= CINT(Id_CARcTipo_ingreso) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_ingreso")%>'> <%= Ob_RS2("CARcTipo_ingreso")%>
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
        <B>Fecha de ingreso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_ingreso' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_ingreso%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_ingreso')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
  <%ELSE'CeroReg %>
    <INPUT TYPE="Hidden" NAME=Id_CARcTipo_ingreso Value ='0'%>>
 <% END IF 'CeroReg  %>
      <TR>
      <TD> 
         <B>Tipo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPONOMBRAMIENTO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoNombramiento' SIZE=1 >
          <% IF Id_CARcTipoNombramiento = "" OR Id_CARcTipoNombramiento = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoNombramiento")= CINT(Id_CARcTipoNombramiento) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoNombramiento")%>'> <%= Ob_RS2("CARcTipoNombramiento")%>
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
         <B>Categoria</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCATEGORIA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCategoria' SIZE=1 >
          <% IF Id_CARcCategoria = "" OR Id_CARcCategoria = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCategoria")= CINT(Id_CARcCategoria) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= Ob_RS2("CARcCategoria")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCategoria")%>'> <%= Ob_RS2("CARcCategoria")%>
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
         <B>Nivel</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNIVEL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNivel' SIZE=1 >
          <% IF Id_CARcNivel = "" OR Id_CARcNivel = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNivel")= CINT(Id_CARcNivel) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= Ob_RS2("CARcNivel")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNivel")%>'> <%= Ob_RS2("CARcNivel")%>
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
         <B>Motivo de Nombramiento</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNOMBRAMIENTOMOTIVO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcNombramientoMotivo' size=1 >
            <% IF Id_CARcNombramientoMotivo = "" OR Id_CARcNombramientoMotivo = "0" THEN %>
            <option value='0'> Seleccione registro </option>
            <% END IF  %>
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcNombramientoMotivo")= CINT(Id_CARcNombramientoMotivo) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcNombramientoMotivo")%>'> <%= Ob_RS2("CARcNombramientoMotivo")%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcNombramientoMotivo")%>'> <%= Ob_RS2("CARcNombramientoMotivo")%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>    
        <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
      <TD> 
         <B>Tipo de designación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcTipo_Designacion" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipo_Designacion' SIZE=1 >
          <% IF Id_CARcTipo_Designacion = "" OR Id_CARcTipo_Designacion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipo_Designacion")= CINT(Id_CARcTipo_Designacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipo_Designacion")%>'> <%= Ob_RS2("CARcTipo_Designacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipo_Designacion")%>'> <%= Ob_RS2("CARcTipo_Designacion")%>
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
        <B>Fecha de nombramiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_nombramiento' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha_nombramiento%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_nombramiento')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Nombramiento historico</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Nombramiento_historico' SIZE=10 ROWS=5 COLS=35><%=Nombramiento_historico%></TEXTAREA>
      </TD > 
     </TR>

	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='CARdNombramientos' SIZE=50 MAXLENGTH=50 VALUE=<%= CARdNombramientos%>>
      </TD > </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

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

  if (FormAltas.Id_CARcTipoNombramiento.value  == 0)
  {
       alert("EL CAMPO: Tipo de Nombramiento, no puede estar vacio");
       return false;
  }
    
  if (FormAltas.Fecha_nombramiento.value  == "")
  {
       alert("EL CAMPO: Fecha de Nombramiento, no puede estar vacio");
       return false;
  }
    
 /* if (FormAltas.Id_CARcCategoria.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Categoria.");
       return false;
  }
  
  if (FormAltas.Id_CARcNivel.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Nivel.");
       return false;
  }
  
  if (FormAltas.Id_CARcNombramientoMotivo.value == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Motivo de Nombramiento.");
       return false;
  }
  
*/  


}
</script> 

