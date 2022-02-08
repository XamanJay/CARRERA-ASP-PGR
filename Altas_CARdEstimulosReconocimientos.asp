<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->


<!-- #Include File = "Seguridad/Perfil.inc" -->

<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Tabla  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
    v_Tabla = "CARdEstimulosReconocimientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

 consulta = "SELECT * FROM CARcDetalle " 
 Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Detalle = OB_rs.getrows
Campos_Detalle = UBound(tbl_Detalle,1) 
regs_Detalle = UBound(tbl_Detalle,2)
OB_RS.CLOSE 

 
   TABLA.OPEN "Select * from CARdDatosPersonales", Ob_Conn 
		  
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
  <FORM METHOD="post" ACTION= "Altas_CARdEstimulosReconocimientos.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Estimulos y Reconocimientos   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
'	 response.write request.Form
'	 response.end
    	   Ob_RS.Addnew 
        if request("CARdEstimulosReconocimientos")  <> "" then  Ob_RS("CARdEstimulosReconocimientos")=ucase(request("CARdEstimulosReconocimientos")) end if
        if request("Id_CARcTipoEstimuloRec")  <> "" then  Ob_RS("Id_CARcTipoEstimuloRec")=request("Id_CARcTipoEstimuloRec") end if
        if request("Id_CARcDetalle")  <> "" then  Ob_RS("Id_CARcDetalle")=request("Id_CARcDetalle") end if
        if request("Motivo")  <> "" then  Ob_RS("Motivo")=ucase(request("Motivo")) end if
        if request("Fecha")  <> "" then  Ob_RS("Fecha")=request("Fecha") end if
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
       Ob_RS("Id_CARdDatosPersonales")= CLng(idPersona)
        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
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
        <B>Est&iacute;mulo/Reconocimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcTipoEstimuloRec" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEstimuloRec' SIZE=1 onchange='SeleMenu("C")'>
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEstimuloRec")= CINT(Id_CARcTipoEstimuloRec) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= UCASE(Ob_RS2("CARcTipoEstimuloRec"))%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= UCASE(Ob_RS2("CARcTipoEstimuloRec"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
     <TR>
      <TD>
        <B>Tipo est&iacute;mulo/Reconocimiento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcDetalle" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDetalle' SIZE=1 >
          <% IF Ob_RS2 THEN %>
	            <OPTION VALUE='0'>SELECCIONE</OPTION>
           <% END IF  %>
       </SELECT>
    <% Ob_RS2.CLOSE%>
    </TD > 
     </TR>
     <TR>
      <TD>
        <B>Motivo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Motivo' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=Motivo%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEstimulosReconocimientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEstimulosReconocimientos%></TEXTAREA>
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
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>
  
   <%
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>	


  <p ALIGN="center"> &nbsp;
     <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2">&nbsp;&nbsp;&nbsp;  </p>

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
  if (FormAltas.Id_CARcTipoEstimuloRec.value  == 0)
  {
       alert("EL CAMPO: Tipo de Movimiento, no puede estar vacio");
       return false;
  }

  if (FormAltas.Id_CARcDetalle.value  == 0)
  {
       alert("EL CAMPO: Detalle tipo, no puede estar vacio");
       return false;
  }
  
  
  if (FormAltas.Fecha.value != "")
	  {
		  if (!esFecha(FormAltas.Fecha.value,'E'))
		  {
			alert("El campo - Fecha - debe ser de tipo: DD/MM/AAAA");
			FormAltas.Fecha.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var Fecha = FormAltas.Fecha.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			Fecha = Date.parse(Fecha)
		
			if (Fecha < Fecha_Ingreso_PGR)
		 {
			alert("La fecha no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormAltas.Fecha.focus();
			return false;
		  }
		
		
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/


        /*if(jvi_textoynumero_correcto.test(FormAltas.Motivo.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Motivo, verifique por favor.');
	  	 FormAltas.Motivo.focus();
      	 return false;    
        }

        if(jvi_textoynumero_correcto.test(FormAltas.CARdEstimulosReconocimientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormAltas.CARdEstimulosReconocimientos.focus();
      	 return false;    
        }
*/


	
 FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	






}

function SeleMenu(pas)
{
var xcont = 1 
var ycont = 0 
   
//  document.FormAltas.Id_CARcDetalle.length= 0;
   <% FOR I = 0 to regs_Detalle %>
	    if  (document.FormAltas.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
  document.FormAltas.Id_CARcDetalle.length= xcont;
//alert(<%= regs_Detalle %>)
    <% FOR I = 0 to regs_Detalle %>
 //         alert(document.FormAltas.Id_CARcTipoEstimuloRec.value)
        if  (document.FormAltas.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		 {
		   ycont = ycont +1;
 //         alert(<%= tbl_Detalle(0,I)%>);
          document.FormAltas.Id_CARcDetalle.options[ycont].text='<%= tbl_Detalle(1,I) %>'
          document.FormAltas.Id_CARcDetalle.options[ycont].value='<%= tbl_Detalle(0,I) %>'
		  }
   <%  next    %>   

}

</script> 
