<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->
<HTML>
 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>

  <FORM METHOD="post" ACTION="ConsultasFiltro.asp" NAME= "FormVehiConsultas">

  <%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_Etiq_Nor  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_Id = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdVehiculos"
    'v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = "SIIFP"
   %>


  <%

   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

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
  <FIELDSET STYLE="padding: 2; width:352; height:232">

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
  <CENTER>
   <HR width=40%>
    <H2> 
      <FONT COLOR= #990000> Consultas de <% RESPONSE.WRITE (titulo)%> </FONT>
    </H2>
   <HR WIDTH=40%>
   <BR><BR>
  </CENTER>

<!---
<TABLE>
<TR>
  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Altas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Altas%>" >      
  </TD>
  
  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Bajas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Bajas%>" >
  </TD>      

  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Consultas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Consultas%>" >
  </TD>
  
  <TD>
  <P ALIGN="CENTER">  
      <IMG ONCLICK="location.href='Modificaciones_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Modificaciones%>" >
  </TD>
</TR>
</TABLE>

<BR> <BR>
--->

   <LEGEND>
    <B>
     <H3>
      Parámetros de búsqueda
     </H3>
    </B>
   </LEGEND>
<!--- ---------------------------------------------------------------------------------------------------------------- --->
<%x = -1 %>

  <%DO UNTIL Ob_RS_Etiq_Nor.Eof
    x = x + 1 %>
     <%FOR camp_etiq=0 TO total_campos_Etiq_Nor-1 %>
       <TABLE border="0" CELLPADDING="0" CELLSPACING="0" STYLE="border-collapse: collapse" BORDERCOLOR="#111111" WIDTH="350" ID="AutoNumber1" HEIGHT="0">
         <TR>
           <TD 
	    BGCOLOR = "#00003C">
       	    <P ALIGN="left">
<!--- Impresión de etiquetas para campos normales (<> de Id_) -------------------------------------------------------- --->
      	    <%IF (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "Id_") AND (Mid(Ob_RS(x).NAME,1,3) <> "CT_") AND (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "TI_") THEN%>
                <B>		<font color="#FFFFFF"> 	<%= Ob_RS_Etiq_Nor(camp_etiq) & ":" & "<BR>" %>  </font>	</B>
      	    <%END IF%>
			<% 
			  IF (Mid(Ob_RS(x).NAME,1,3) = "CT_") THEN
			%>
                <B>		<font color="#FFFFFF"> 	<%= Ob_RS_Etiq_Nor(camp_etiq) & ":" & "<BR>" %>  </font>	</B>
			<%
			  END IF
			%>

           </TD> 
         </TR> 

<!--- Catálogo de tipos de datos SQL --------------------------------------------------------------------------------- --->
         <TR>
           <TD>
       	   <P ALIGN="left">

     	   <%IF (MID(Ob_RS(x).NAME,1,3) <> "Id_")  AND (Mid(Ob_RS(x).NAME,1,3) <> "CT_") AND ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 20) OR (Ob_RS(x).TYPE = 3) OR (Ob_RS(x).TYPE = 2) OR (Ob_RS(x).TYPE = 17) OR (Ob_RS(x).TYPE = 11) OR (Ob_RS(x).TYPE = 131) OR (Ob_RS(x).TYPE = 6) OR (Ob_RS(x).TYPE = 5) OR (Ob_RS(x).TYPE = 4) ) THEN%>
      		 <INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>"> 
      		 <BR> <BR> <BR>
    	   <%ELSE%>

           	<%IF ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 201) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 203) )THEN%>
       			<TEXTAREA NAME="<%=Ob_RS(x).NAME%>" SIZE=10 ROWS=5 COLS=35></TEXTAREA>
     			<BR><BR>  <BR>
          	<%END IF%>

                <%IF Ob_RS(x).TYPE = 135 THEN%>
      			<INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" READONLY> 
     		  	<IMG ONCLICK="window_open('FormVehiConsultas','<%=Ob_RS(x).NAME%>')" border="0" src="<%= ruta_img_calendario%>" WIDTH="32" HEIGHT="34">
      		  	<BR><BR> <BR> 
                <%END IF%>

    	   <%END IF%>
 
<!--- Catálogo de tipos de datos SQL (Catálogos Personalizados)------------------------------------------------------ --->
	   <% 
	     IF (Mid(Ob_RS(x).NAME,1,3) = "CT_") THEN
	   %>

		 <% 
		   nombre = Ob_RS(x).NAME 
		   var_combo = "cbx" & MID(nombre,4,LEN(nombre))
 	       tot_elems_arreglo = Ubound(Session(nombre)) 	       
		 %>

	     <SELECT NAME="<%= var_combo%>" SIZE=1>

	         <OPTION VALUE="">
                   Ninguno
             </OPTION>

			<% FOR w = 0 TO tot_elems_arreglo%>
		   		<OPTION VALUE= <%= w%> >
                     <%= response.write (Session(nombre) (w))%>                               
           		</OPTION>           			
			<% NEXT %>

	     </SELECT>

		 <BR><BR><BR>

	   <%
	     END IF
	   %>
<!--- ================================================================================================================ ---> 
           </TD> 
         </TR> 
<!--- ================================================================================================================ --->
         <%IF (MID(Ob_RS(x).NAME,1,3) = "Id_") AND (Mid(Ob_RS(x).NAME,1,3) <> "CT_") THEN%>

     <%FOR camp_etiq2=0 TO total_campos_Etiq_Nor-1 %>
    
       <%IF TRIM(left(UCASE(Ob_RS_Etiq_Nor(camp_etiq)),3)) <> "TI_" THEN
             tabla_descripcion=MID(Ob_RS(x).NAME,4,LEN(Ob_RS(x).NAME)) 
             Sql = "SELECT * FROM "+ UCASE(tabla_descripcion)
             Ob_RS2.OPEN Sql, Ob_Conn%>
    	
             <TR>
               <TD 
	       BGCOLOR = "#00003C">
    	       <P ALIGN="left">

<!--- Impresion de etiquetas de campos de tipo catálogo (Empiezan con Id_) ------------------------------------------- --->     
 
               <B>	<font color="#FFFFFF"> 
				<%= MID( Ob_RS_Etiq_Nor(camp_etiq),4, LEN(Ob_RS_Etiq_Nor(camp_etiq)) ) & ":" %> 
	       </font>  </B>
	       
	       </TD></TR>

	       <TD 
       	       <P ALIGN="left">
          
	       <%control_combo = "cbx"+tabla_descripcion%>	
	       <%parametro_registro = "TxtNew"+tabla_descripcion%>
	       <%parametro_ODBC = v_ODBC%>

<!--- Creación de Combo Boxes para contener los catálogos ------------------------------------------------------------ ---> 
<BR>	       <SELECT NAME= <%= control_combo %> SIZE=1>
	         <OPTION VALUE="">
                   Ninguno
                 </OPTION>

	         <%DO UNTIL Ob_RS2.Eof%>
				 <%IF Ob_RS2(0).NAME = "Id_CARdDatosPersonales" THEN%>
		           <OPTION VALUE="<%=Ob_RS2(0)%>">				   
                     <%= Ob_RS2(3) & " " & Ob_RS2(4) & " " & Ob_RS2(5)%>               
                   </OPTION>
                 <%ELSE%>
	               <OPTION VALUE="<%=Ob_RS2(0)%>">
                     <%= Ob_RS2(1)%>          
                   </OPTION>	                
                 <%END IF%>
	           <%Ob_RS2.MOVENEXT
	         LOOP%>

	       </SELECT>
<BR><BR><BR>
	       <%parametro_tabla_encabezado = MID( (Ob_RS2(1).NAME),4,LEN(Ob_RS2(1).NAME))%>
	       <%parametro_tabla = Ob_RS2(1).NAME%>
	    <%pagina_catalogo = "Altas_" + parametro_tabla%>

	       </TD>

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
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

  <% Ob_Rs.CLOSE %>

  <P>&nbsp;
   
  </P>

  </FIELDSET>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  <BR><BR>
  </p>

   </CENTER>
  </FORM>
<BR> 

<!---
<TABLE>
<TR>
  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Altas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Altas%>" >      
  </TD>
  
  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Bajas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Bajas%>" >
  </TD>      

  <TD>
  <P ALIGN="CENTER">
      <IMG ONCLICK="location.href='Consultas_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Consultas%>" >
  </TD>
  
  <TD>
  <P ALIGN="CENTER">  
      <IMG ONCLICK="location.href='Modificaciones_<%= v_Tabla%>.ASP'" border="0" src="<%= ruta_btn_Modificaciones%>" >
  </TD>
</TR>
</TABLE>

<BR> <BR>
--->

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>

</HTML> 

<!-- #INCLUDE File="errores.inc" --><!--- ================================================================================================================ --->