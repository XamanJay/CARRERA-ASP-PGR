<% On Error Resume Next  %>
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

    v_Tabla = "CARdEvaluaciones"
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

'======== Llena un arreglo con los registros del Catalogo para ligar los combos de TipoEvaluacion y ResultadoEva
consulta = "SELECT * FROM CARcResultadoEva " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_ResultadoEva = OB_rs.getrows
Campos_ResultadoEva = UBound(tbl_ResultadoEva,1) 
regs_ResultadoEva = UBound(tbl_ResultadoEva,2)
OB_RS.CLOSE 
'========= Termina Llenar Arreglo

  
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
  <FORM METHOD="post" ACTION= "Altas_CARdEvaluaciones.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Evaluaciones   </FONT>
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
        if request("CARdEvaluaciones")  <> "" then  Ob_RS("CARdEvaluaciones")=ucase(request("CARdEvaluaciones")) end if
        if request("Id_CARcTipoEvaluacion")  <> "" then  Ob_RS("Id_CARcTipoEvaluacion")=request("Id_CARcTipoEvaluacion") end if
        if request("FechaEvaluacion")  <> "" then  Ob_RS("FechaEvaluacion")=request("FechaEvaluacion") end if
        if request("Id_CARcResultadoEva")  <> "" then  Ob_RS("Id_CARcResultadoEva")=request("Id_CARcResultadoEva") end if
        if request("Calificacion")  <> "" then  Ob_RS("Calificacion")=request("Calificacion") end if
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
 '         Ob_RS("FechaCaptura")=date()
        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
    
     
     </TR>
     <TR>
      <TD> 
         <B>Tipo de Evaluación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOEVALUACION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEvaluacion' SIZE=1 onchange='SeleMenu("C")'>
          <% IF Id_CARcTipoEvaluacion = "" OR Id_CARcTipoEvaluacion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEvaluacion")= CINT(Id_CARcTipoEvaluacion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEvaluacion")%>'> <%= Ob_RS2("CARcTipoEvaluacion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEvaluacion")%>'> <%= Ob_RS2("CARcTipoEvaluacion")%>
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
        <B>Fecha de Evaluación</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEvaluacion%> >
       <IMG ONCLICK="window_open('FormAltas','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Resultado Evaluación</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCRESULTADOEVA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcResultadoEva' SIZE=1 >
          <% IF Id_CARcResultadoEva = "" OR Id_CARcResultadoEva = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcResultadoEva")= CINT(Id_CARcResultadoEva) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcResultadoEva")%>'> <%= Ob_RS2("CARcResultadoEva")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcResultadoEva")%>'> <%= Ob_RS2("CARcResultadoEva")%>
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
        <B>Puntaje</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' id='IDCAL' NAME='Calificacion' SIZE=5 MAXLENGTH=5 VALUE=<%= Calificacion%>>
      </TD > 
     </TR>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEvaluaciones' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEvaluaciones%></TEXTAREA>
      </TD ></TR>
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

  if (FormAltas.Id_CARcTipoEvaluacion.value  == 0)
  {
       alert("EL CAMPO: Id_Tipo de Evaluación, no puede estar vacio");
       return false;
  }
  
/*  if (FormAltas.FechaEvaluacion.value  == "")
  {
       alert("EL CAMPO: Fecha de Evaluación, no puede estar vacio");
       return false;
  }
*/
     if (FormAltas.Calificacion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Solo Acepta Numeros EL CAMPO: Puntaje.");
       return false;
  }
  
  if (FormAltas.FechaEvaluacion.value  != "" && !esFecha(FormAltas.FechaEvaluacion.value,'E'))
		   {alert("El formato del campo -Fecha de Evaluación- debe ser de tipo: DD/MM/AAAA ");
		   return false;}
  

 /*      
 if (FormAltas.Id_CARcResultadoEva.value  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Resultado Evaluación.");
       return false;
  }
  */
}

function SeleMenu(pas)
{
var xcont = 1 
var ycont = 0 
//alert(<%= regs_ResultadoEva %>)
// El siguiente IF es para habilitar el campo calificacion solo cuando TipoEvaluación = Conocimientos = 3
 	  if (FormAltas.Id_CARcTipoEvaluacion.value == 3 ) 
        {
	     document.FormAltas.Calificacion.disabled=false;	
        }
	  else
        {
	      document.FormAltas.Calificacion.disabled=true;	
     	  document.FormAltas.Calificacion.value=''
       }
  
   <% FOR I = 0 to regs_ResultadoEva %>
	    if  (document.FormAltas.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_CARcResultadoEva.length= xcont;
    <% FOR I = 0 to regs_ResultadoEva %>
        if  (document.FormAltas.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcResultadoEva.options[ycont].text='<%= tbl_ResultadoEva(1,I) %>'
          document.FormAltas.Id_CARcResultadoEva.options[ycont].value='<%= tbl_ResultadoEva(0,I) %>'
		  }
   <%  next    %>   
  document.FormAltas.Id_CARcResultadoEva.options[0].selected=true // Esta linea se agrega solo en Modificaciones

}


</script>