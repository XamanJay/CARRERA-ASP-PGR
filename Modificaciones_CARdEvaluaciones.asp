<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdEvaluaciones"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Tipo evaluacion y Rsultado Evaluacion
consulta = "SELECT * FROM CARcResultadoEva " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_ResultadoEva = OB_rs.getrows
Campos_ResultadoEva = UBound(tbl_ResultadoEva,1) 
regs_ResultadoEva = UBound(tbl_ResultadoEva,2)
OB_RS.CLOSE 
'============= Termina de llenar arreglo

   consulta = "SELECT * FROM CARdEvaluaciones WHERE Id_CARdEvaluaciones ="+CSTR(ParID) 
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
   CARdEvaluaciones= OB_RS("CARdEvaluaciones")
   Id_CARcTipoEvaluacion= OB_RS("Id_CARcTipoEvaluacion")
   FechaEvaluacion= OB_RS("FechaEvaluacion")
   Id_CARcResultadoEva= OB_RS("Id_CARcResultadoEva")
   Calificacion= OB_RS("Calificacion")
'   FechaCaptura= OB_RS("FechaCaptura")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")

'========= No tiene combos ========= %>



<% '========== Inicia HTML %>

<HTML>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
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
  <FORM METHOD="post" ACTION= "Modificaciones_CARdEvaluaciones.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Evaluaciones  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #990000>Modificar  Evaluaciones  </FONT></h2>
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
        consulta = "SELECT * FROM CARdEvaluaciones WHERE Id_CARdEvaluaciones ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        Ob_RS("CARdEvaluaciones")=ucase(request("CARdEvaluaciones")) 
        if request("Id_CARcTipoEvaluacion")  <> "" then  Ob_RS("Id_CARcTipoEvaluacion")=request("Id_CARcTipoEvaluacion") end if
       
'	    if request("FechaEvaluacion")  <> "" then  Ob_RS("FechaEvaluacion")=request("FechaEvaluacion") end if
		
		IF request ("FechaEvaluacion") = "" then 
    Ob_RS("FechaEvaluacion")= NULL 
 ELSE
    Ob_RS("FechaEvaluacion")= request("FechaEvaluacion") 
 END IF 
		
		
        if request("Id_CARcResultadoEva")  <> "" then  Ob_RS("Id_CARcResultadoEva")=request("Id_CARcResultadoEva") end if
        Ob_RS("Calificacion")=request("Calificacion") 
'        if request("FechaCaptura")  <> "" then  Ob_RS("FechaCaptura")=request("FechaCaptura") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
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
     
     
     	
<%	

USUARIO = Session("UserLogin")
IF  USUARIO =  "COPLADII36CEDH" THEN       %>
     
     </TR>
     <TR>
      <TD> 
         <B>Tipo de evaluación</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOEVALUACION WHERE Id_CARcTipoEvaluacion in (0,1,2,3)" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEvaluacion' SIZE=1 onchange='SeleMenu("C")'>
            <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>			
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
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	 
	 
	 
	<% ELSEIF USUARIO = "COPLADII36ICAP"  THEN %> 
	 
	 
	 
	 
	 </TR>
     <TR>
      <TD> 
         <B>Tipo de evaluación</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOEVALUACION WHERE Id_CARcTipoEvaluacion in (0,4)" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEvaluacion' SIZE=1 onchange='SeleMenu("C")'>
            <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>	
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
			<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     
	 
	 
	 
	 
	 
	  <% ELSEIF USUARIO <> "COPLADII36ICAP" OR USUARIO <> "COPLADII36CEDH"   THEN %> 
	 
	 
	 
	 
	 </TR>
     <TR>
      <TD> 
         <B>Tipo de evaluación</B></TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOEVALUACION WHERE Id_CARcTipoEvaluacion in (0,1,2,3,4)" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoEvaluacion' SIZE=1 onchange='SeleMenu("C")'>
            <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>	          
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
		<%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
    
	 
	 
	 
	 
	 
	 
	 
	 
	 <%END IF %>

     <TR>
      <TD>
        <B>Fecha de evaluación<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaEvaluacion' SIZE=10  MAXLENGTH=16  VALUE=<%= FechaEvaluacion%> >
       <IMG ONCLICK="window_open('FormEdita','FechaEvaluacion')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
  	<BR><BR> 
      </TD > 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCRESULTADOEVA WHERE Id_CARcTipoEvaluacion ="+CSTR(Id_CARcTipoEvaluacion) %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Resultado evaluación</B><BR>
      </TD>
      <TD>
        <select name='Id_CARcResultadoEva' size=1 >
		  <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>	
          <%DO UNTIL Ob_RS2.Eof%>
          <%IF Ob_RS2("Id_CARcResultadoEva")= CINT(Id_CARcResultadoEva) THEN %>
          <option selected value='<%=Ob_RS2("Id_CARcResultadoEva")%>'> <%= Ob_RS2("CARcResultadoEva")%> </option>
          <% ELSE  %>
          <option value='<%=Ob_RS2("Id_CARcResultadoEva")%>'> <%= Ob_RS2("CARcResultadoEva")%> </option>
          <%END IF  %>
          <%Ob_RS2.MOVENEXT %>
          <%LOOP%>
		  <%END IF%>
        </select>
</TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD>
        <B>Puntaje<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Calificacion' id='IDCAL' SIZE=5 MAXLENGTH=5 style="text-transform: uppercase" VALUE=<%= Calificacion%>>
		 <BR> <BR>
      </TD > 
    </TR>
	  <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdEvaluaciones' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdEvaluaciones%></TEXTAREA>
  	
      </TD > </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdEvaluaciones >
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

if (FormEdita.Id_CARcTipoEvaluacion.value  == 0)
  {
       alert("EL CAMPO: Tipo de Evaluación, no puede estar vacio");
       return false;
  }
  

     if (FormEdita.Calificacion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Solo Acepta Numeros EL CAMPO: Puntaje.");
       return false;
  }
  
  
  /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
  if (FormEdita.FechaEvaluacion.value != "")
	  {
		  if (!esFecha(FormEdita.FechaEvaluacion.value,'E'))
		  {
			alert("El campo - Fecha de Evaluación- debe ser de tipo: DD/MM/AAAA");
			FormEdita.FechaEvaluacion.focus();
			return false;
		  }	
	  }
  
  
  
			 var Fecha_Ingreso_PGR = '<%= Fecha_Ingreso_PGR%>'
			 var FechaEvaluacion = FormEdita.FechaEvaluacion.value
			  
			Fecha_Ingreso_PGR = Date.parse(Fecha_Ingreso_PGR)
			FechaEvaluacion = Date.parse(FechaEvaluacion)
		
			if (FechaEvaluacion < Fecha_Ingreso_PGR)
		 {
			alert("La fecha de Evaluación no puede ser menor a la fecha del ingreso a la PGR de esta persona.");
			FormEdita.FechaEvaluacion.focus();
			return false;
		  }
		
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        /*if(jvi_textoynumero_correcto.test(FormEdita.CARdEvaluaciones.value))
		 {
     	  alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	  	 FormEdita.CARdEvaluaciones.focus();
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
//alert(<%= regs_ResultadoEva %>)
// El siguiente IF es para habilitar el campo calificacion solo cuando TipoEvaluación = Conocimientos = 3
 	  if (FormEdita.Id_CARcTipoEvaluacion.value == 3 ) 
        {
	     document.FormEdita.Calificacion.disabled=false;	
        }
	  else
        {
	      document.FormEdita.Calificacion.disabled=true;	
     	  document.FormEdita.Calificacion.value=''
       }
  
   <% FOR I = 0 to regs_ResultadoEva %>
	    if  (document.FormEdita.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormEdita.Id_CARcResultadoEva.length= xcont;
    <% FOR I = 0 to regs_ResultadoEva %>
        if  (document.FormEdita.Id_CARcTipoEvaluacion.value == <%= tbl_ResultadoEva(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormEdita.Id_CARcResultadoEva.options[ycont].text='<%= tbl_ResultadoEva(1,I) %>'
          document.FormEdita.Id_CARcResultadoEva.options[ycont].value='<%= tbl_ResultadoEva(0,I) %>'
		  }
   <%  next    %>   
    document.FormEdita.Id_CARcResultadoEva.options[0].selected=true // Esta linea se agrega solo en Modificaciones

}


</script>