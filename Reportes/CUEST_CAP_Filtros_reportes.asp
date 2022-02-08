<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "../Seguridad/Perfil.inc" -->

<HTML> <HEAD>  <TITLE>   Busqueda filtrada  </TITLE><!-- #INCLUDE file="CAP_titulo.inc"  -->
<link href="Reportes/CarreraPGR.css" rel="stylesheet" type="text/css">
<link href="css/bubbleicious.css" rel="stylesheet" type="text/css">
 </HEAD> <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY background = "softgri1.jpg">
 <CENTER>
 <FORM METHOD="post" ACTION="CUEST_ConsultasFiltro_CAPdConvocatoria_2.asp" NAME= "FormVehiAltas">
  <%SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_Etiq_Nor  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CAPdConvocatoria"	
	'response.write("yyyy")
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = "SIIFP"
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)
  %>
  <%
     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
  %>



  <%
     
  
   Ob_Conn.PROVIDER="sqloledb"
    IP_Servidor = session("IP_Servidor")
   Ob_Conn.OPEN="SERVER="&IP_Servidor&";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

   ruta_btn_Altas		= "btn_Altas.gif"
   ruta_btn_Bajas		= "btn_Bajas.gif"
   ruta_btn_Consultas		= "btn_Consultas.gif"
   ruta_btn_Modificaciones	= "btn_Modificaciones.gif" 

  %>

  <%
    consulta_Id = "SELECT Id FROM sysobjects WHERE xtype = 'U' AND name <> 'dtproperties' AND name = '" & v_Tabla & "'"
  
    Ob_RS_Id.OPEN consulta_Id, Ob_Conn
  
    v_ID = Ob_RS_Id(0)
  %>
  <FIELDSET STYLE="padding: 2; width:830; ">


   <CENTER>

<!--- Consulta para sacar la descripción de los campos---------------------------------------------------------------- --->
<%
  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" & "'" & v_ID & "'"
  Ob_RS_Etiq_Nor.OPEN Etiq_Nor, Ob_Conn
  total_campos_Etiq_Nor = Ob_RS_Etiq_Nor.FIELDS.COUNT
%>

<!--- Impresión de títulos ------------------------------------------------------------------------------------------- --->
<%FOR i=0 TO total_campos_Etiq_Nor-1 
    IF mid(Ob_RS_Etiq_Nor(i),1,3) = "TI_" THEN
       titulo = MID( UCASE( Ob_RS_Etiq_Nor(i)),4, LEN(Ob_RS_Etiq_Nor(i)))
       'Response.Write titulo
    END IF
NEXT
%>


     <LEGEND>
    <B>
     
  <H3> <font color="#3CA0BD">Busqueda filtrada para las</font> <font color="#3CA0BD"> 
    <% RESPONSE.WRITE (titulo)%>
    </font> </H3>
    </B>
   </LEGEND>
 <!--  <TABLE>
<TR>
  <TD>
  <P ALIGN="CENTER">
     
	  <input type="button" name="btnAltas" value = "A l t a s" onClick="location.href='Altas_<%= v_Tabla%>.ASP'">
  </TD>
  
  <TD>
  <P ALIGN="CENTER">
     
	  <input type = "button" name="btnBajas" value = "B a j a s" ONCLICK="location.href='Bajas_<%= v_Tabla%>.ASP'">
  </TD>      

  <TD>
  <P ALIGN="CENTER">
      <input type="button" name="btnConsultas" value="Consultas" ONCLICK="location.href='Consultas_<%= v_Tabla%>.ASP'" >
  </TD>
  
  <TD>
  <P ALIGN="CENTER">  
      <input type="button" name="btnModificaciones" value="Modificar"ONCLICK="location.href='Modificaciones_<%= v_Tabla%>.ASP'"  >
  </TD>
</TR>
</TABLE>-->
<!--- ---------------------------------------------------------------------------------------------------------------- --->
<%x = -1 %>

  <%DO UNTIL Ob_RS_Etiq_Nor.Eof
    x = x + 1 %>
     <%FOR camp_etiq=0 TO total_campos_Etiq_Nor-1 %>
       <TABLE border="1"    WIDTH="127%" ID="AutoNumber1" HEIGHT="0"  valign="top">
         <TR>
           <TD width="150" class="fieldtd" >
       	    
<!--- Impresión de etiquetas para campos normales (<> de Id_) -------------------------------------------------------- --->
      	    <%IF (Ob_RS_Etiq_Nor(camp_etiq))<> "Fecha de registro" and (Ob_RS_Etiq_Nor(camp_etiq))<>"Registro de usuario"   and (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "Id_") AND (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "TI_")THEN%>
                <B>		<font color="#3CA0BD"> 	<%= rtrim(ltrim(Ob_RS_Etiq_Nor(camp_etiq))) & ":" & "<BR>" %>  </font>	</B>
      	    <%END IF%>

           </TD> 
         

<!--- Catálogo de tipos de datos SQL --------------------------------------------------------------------------------- --->
         
           
      <TD width="670"   > <P ALIGN="left"> 
          <%IF (Ob_RS(x).NAME) <> "Registro_usuario" AND  (MID(Ob_RS(x).NAME,1,3) <> "Id_") AND ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 20) OR (Ob_RS(x).TYPE = 3) OR (Ob_RS(x).TYPE = 2) OR (Ob_RS(x).TYPE = 17) OR (Ob_RS(x).TYPE = 11) OR (Ob_RS(x).TYPE = 131) OR (Ob_RS(x).TYPE = 6) OR (Ob_RS(x).TYPE = 5) OR (Ob_RS(x).TYPE = 4) ) THEN%>
          <input type="TEXT" name="<%=Ob_RS(x).NAME%>" size="<%=Ob_RS(x).DEFINEDSIZE%>"  maxlength="<%=Ob_RS(x).DEFINEDSIZE%>">
          <BR>
          <%ELSE%>
          <%IF ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 201) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 203) )THEN%>
          <TEXTAREA NAME="<%=Ob_RS(x).NAME%>" SIZE=10 ROWS=2 COLS=40></TEXTAREA>
          <BR>
          <%END IF%>
          <%IF (Ob_RS(x).NAME) <> "Fechahora" AND Ob_RS(x).TYPE = 135 THEN%>
          <INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" READONLY>
          <IMG ONCLICK="window_open('FormVehiAltas','<%=Ob_RS(x).NAME%>')" border="0" src="<%= ruta_img_calendario%>" WIDTH="17" HEIGHT="20"> 
          <BR>
          <%END IF%>
          <%END IF%>
      </TD> 
         </TR> 
<!--- ================================================================================================================ --->
         <%IF (MID(Ob_RS(x).NAME,1,3) = "Id_") THEN%>

     <%FOR camp_etiq2=0 TO total_campos_Etiq_Nor-1 %>
    
       <%IF TRIM(left(UCASE(Ob_RS_Etiq_Nor(camp_etiq)),3)) <> "TI_" THEN
             tabla_descripcion=MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) 
             Sql = "SELECT * FROM "+ UCASE(tabla_descripcion)
             Ob_RS2.OPEN Sql, Ob_Conn%>
    	
             <TR>
               <TD height="26" class="fieldtd">
    	       <P ALIGN="left">

<!--- Impresion de etiquetas de campos de tipo catálogo (Empiezan con Id_) ------------------------------------------- --->     
 
               <B>	<font color="#FFFFFF"> 
				<%= MID( Ob_RS_Etiq_Nor(camp_etiq),4, LEN(Ob_RS_Etiq_Nor(camp_etiq)) ) & ":" %> 
	       </font>  </B>
	       
	       </TD>

	       <TD  >
          
	       <%control_combo = "cbx"+tabla_descripcion%>	
	       <%parametro_registro = "TxtNew"+tabla_descripcion%>
	       <%parametro_ODBC = v_ODBC%>

<!--- Creación de Combo Boxes para contener los catálogos ------------------------------------------------------------ ---> 
	     <SELECT NAME= <%= control_combo %> SIZE=1>
	         <OPTION VALUE="">
                   Ninguno
                 </OPTION>

	         <%DO UNTIL Ob_RS2.Eof%>
	           <OPTION VALUE="<%=Ob_RS2(0)%>">
                     <%= Ob_RS2(1)%>          
                   </OPTION>	
	           <%Ob_RS2.MOVENEXT
	         LOOP%>
	       </SELECT>
        <%parametro_tabla_encabezado = MID( (Ob_RS2(1).NAME),4,LEN(Ob_RS2(1).NAME))%>
		 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type='button' name='boton' value='...' height="1" onClick="location.href='Operador.asp?Link1= <%=Nombre_Archivo_Original%>&Link2=<%=pagina_catalogo%>'" > 
        <%parametro_tabla = Ob_RS2(1).NAME%>
        <%pagina_catalogo = "Altas_" + parametro_tabla%>
      </TD>
		   </TR>
	       
           <% Ob_RS2.CLOSE%>          
           <%END IF%>
     <%
     NEXT
     %>
         <%END IF%>
<!--- ================================================================================================================ --->
       </TABLE>
     <%NEXT %>
     <%Ob_RS_Etiq_Nor.MoveNext%>
  <%LOOP%>
 




<!--- ================================================================================================================ --->
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
  <% Ob_Rs.CLOSE %>
  </FIELDSET>
<br>
  <p ALIGN="center"> 
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>
  </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!-- #INCLUDE File="../Error/errores.inc" -->
<!--- ================================================================================================================ --->

