<% 'On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="Utilerias.vbs" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- Include File = "Seguridad/Perfil.inc" -->




<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEstimulosReconocimientos"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

 consulta = "SELECT * FROM CARcDetalle " 
 Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Detalle = OB_rs.getrows
Campos_Detalle = UBound(tbl_Detalle,1) 
regs_Detalle = UBound(tbl_Detalle,2)
OB_RS.CLOSE 

   consulta = "SELECT * FROM CARdEstimulosReconocimientos WHERE Id_CARdEstimulosReconocimientos ="+CSTR(ParID) 
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
   CARdEstimulosReconocimientos= OB_RS("CARdEstimulosReconocimientos")
   Id_CARcTipoEstimuloRec= OB_RS("Id_CARcTipoEstimuloRec")
   Id_CARcDetalle= OB_RS("Id_CARcDetalle")
   Motivo= OB_RS("Motivo")
   Fecha= OB_RS("Fecha")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   Fecha_Captura= OB_RS("Fecha_Captura")
   IdLogin= OB_RS("IdLogin")
   IP_user= OB_RS("IP_user")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" THEN%>
<link href="Estilo1.css" rel="stylesheet" type="text/css">
<% ELSE %>
<link href="Estilo.css" rel="stylesheet" type"text/css">
<%END IF %> 

 <HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARdEstimulosReconocimientos.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Estimulos y Reconocimientos  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Estimulos y Reconocimientos</FONT></h2>
    <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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
        consulta = "SELECT * FROM CARdEstimulosReconocimientos WHERE Id_CARdEstimulosReconocimientos ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
		
        Ob_RS("CARdEstimulosReconocimientos")=ucase(request("CARdEstimulosReconocimientos")) 
        if request("Id_CARcTipoEstimuloRec")  <> "" then  Ob_RS("Id_CARcTipoEstimuloRec")=request("Id_CARcTipoEstimuloRec") end if
        if request("Id_CARcDetalle")  <> "" then  Ob_RS("Id_CARcDetalle")=request("Id_CARcDetalle") end if
        Ob_RS("Motivo")=ucase(request("Motivo")) 
        
		
'		if request("Fecha")  <> "" then  Ob_RS("Fecha")=request("Fecha") end if
IF request ("Fecha") = "" then 
    Ob_RS("Fecha")= NULL 
 ELSE
    Ob_RS("Fecha")= request("Fecha") 
 END IF 
        'Ob_RS("Observaciones")=request("Observaciones") 
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
       
	    'if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
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
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD>
        <B>Est&iacute;mulo/Reconocimiento </font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcTipoEstimuloRec" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEstimuloRec' SIZE=1 onchange='SeleMenu("C")'>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoEstimuloRec")= CINT(Id_CARcTipoEstimuloRec) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= Ob_RS2("CARcTipoEstimuloRec")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoEstimuloRec")%>'> <%= Ob_RS2("CARcTipoEstimuloRec")%>
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
       <B>Tipo est&iacute;mulo/Reconocimiento</font>	</B> </TD>
      <TD>
 	   <P ALIGN='left'>
            <%Sql ="SELECT * FROM CARcDetalle where Id_CARcTipoEstimuloRec="+ CSTR(Id_CARcTipoEstimuloRec) %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDetalle' SIZE=1 on>
		    <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDetalle")= CINT(Id_CARcDetalle) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDetalle")%>'> <%= Ob_RS2("CARcDetalle")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDetalle")%>'> <%= Ob_RS2("CARcDetalle")%>
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
        <B>Motivo<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Motivo' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=Motivo%></TEXTAREA>
  	<BR><BR>
      </TD > 
     <TR>
      <TD>
        <B>Fecha<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha' SIZE=10  MAXLENGTH=16  VALUE=<%= Fecha%> >
       <IMG ONCLICK="window_open('FormEdita','Fecha')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
	   
      
	   
      </TD > 
     <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEstimulosReconocimientos' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEstimulosReconocimientos%></TEXTAREA>
  	<BR><BR>
      </TD > 
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdEstimulosReconocimientos >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >
<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
	<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>
<%
idPersona = REQUEST.QUERYSTRING("Id_Persona")
Fecha_IngresoPGR = "Select Fecha_IngresoPGR FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = "& idPersona 
     Ob_RS2.OPEN Fecha_IngresoPGR, Ob_Conn, 3, 1 
		totderegistros = Ob_RS2.RECORDCOUNT
		Fecha_Ingreso_PGR = Ob_RS2("Fecha_IngresoPGR")
		
   Ob_RS2.CLOSE	
   
   
   ''''''''''''''''''''
   
  %>
 
<% IF TOper <> "VER" then%>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Guardar cambios" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp;
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
<!-- #Include File = "INCLUDE/DesableOjectsEdita.inc"-->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormEdita.Id_CARcTipoEstimuloRec.value  == 0)
  {
       alert("EL CAMPO: Tipo de Movimiento, no puede estar vacio");
       return false;
  }

  if (FormEdita.Id_CARcDetalle.value  == 0)
  {
       alert("EL CAMPO: Detalle tipo, no puede estar vacio");
       return false;
  }
  
  
  if (FormEdita.Fecha.value != "")
	  {
		  if (!esFecha(FormEdita.Fecha.value,'E'))
		  {
			alert("El campo - Fecha - debe ser de tipo: DD/MM/AAAA");
			FormEdita.Fecha.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var Fecha = FormEdita.Fecha.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			Fecha = Date.parse(Fecha)
		
			if (Fecha < Fecha_Ingreso_PGR)
		 {
			alert("La fecha no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.Fecha.focus();
			return false;
		  }
		
		
/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/


        /*if(jvi_textoynumero_correcto.test(FormEdita.Motivo.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Motivo, verifique por favor.');
	  	 FormEdita.Motivo.focus();
      	 return false;    
        }

        if(jvi_textoynumero_correcto.test(FormEdita.CARdEstimulosReconocimientos.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdEstimulosReconocimientos.focus();
      	 return false;    
        }*/



	
 FormEdita.B1.disabled = true;  
     document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	






}




function SeleMenu(pas)
{
var xcont = 1 
var ycont = 0 
   
//  document.FormEdita.Id_CARcDetalle.length= 0;
   <% FOR I = 0 to regs_Detalle %>
	    if  (document.FormEdita.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormEdita.Id_CARcDetalle.length= xcont;
//alert(<%= regs_Detalle %>)
    <% FOR I = 0 to regs_Detalle %>
 //         alert(document.FormEdita.Id_CARcTipoEstimuloRec.value)
        if  (document.FormEdita.Id_CARcTipoEstimuloRec.value == <%= tbl_Detalle(2,I)%> )
		 {
		   ycont = ycont +1;
 //         alert(<%= tbl_Detalle(0,I)%>);
          document.FormEdita.Id_CARcDetalle.options[ycont].text='<%= tbl_Detalle(1,I) %>'
          document.FormEdita.Id_CARcDetalle.options[ycont].value='<%= tbl_Detalle(0,I) %>'
		  }
   <%  next    %>   

  document.FormEdita.Id_CARcDetalle.options[0].selected=true // Esta linea se agrega solo en Modificaciones
}




</script> 

<!-- #INCLUDE File="errores.inc" --><!--- ================================================================================================================ --->

