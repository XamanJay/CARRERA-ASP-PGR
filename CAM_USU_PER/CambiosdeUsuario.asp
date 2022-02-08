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
<link href="../Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Altas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Cambios de Usuarios</FONT>
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
'        if request("Id_CARcNombramientoMotivo")  <> "" then  Ob_RS("Id_CARcNombramientoMotivo")=request("Id_CARcNombramientoMotivo") end if
		
		if request("Id_CARcTipo_ingreso") <> " " then Ob_RS("Id_CARcTipo_ingreso")=request("Id_CARcTipo_ingreso") end if
        if REQUEST("Fecha_ingreso") <> " " then Ob_RS("Fecha_ingreso")=request("Fecha_ingreso") end if
		if REQUEST("Fecha_nombramiento") <> " " then Ob_RS("Fecha_nombramiento")=REQUEST("Fecha_nombramiento") end if
'		IF REQUEST("Nombramiento_historico") <> " " then Ob_RS("Nombramiento_historico")=REQUEST("Nombramiento_historico") end if
'		IF REQUEST("Id_CARcTipo_Designacion") <> " " THEN Ob_RS("Id_CARcTipo_Designacion")=REQUEST("Id_CARcTipo_Designacion") end if


		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		
		
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
		



		
'        Ob_RS("FechaCaptura")= date()
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
  <%ELSE'CeroReg %>
    <INPUT TYPE="Hidden" NAME=Id_CARcTipo_ingreso Value ='0'%>>
 <% END IF 'CeroReg  %>
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

