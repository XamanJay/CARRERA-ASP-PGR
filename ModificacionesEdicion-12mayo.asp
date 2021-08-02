<!-- #INCLUDE File="ADOVBS.inc" -->

<HTML>
 <HEAD>
  <TITLE>
   Pantalla Modificaciones
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>


 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>

  <FORM METHOD="post" ACTION="ModificacionesOpr.asp" NAME= "FormVehiModificaciones" >

  <%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_Rel  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS_Etiq_Nor  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

lnkIdCarros= Request.QueryString("lnkIdCarros")
Tabla = Request.QueryString("parametroTabla")
ODBC = Request.QueryString("parametroODBC")
ID = Request.QueryString("parametroID")
Mtarea = request("Tarea")
    v_Tabla = Tabla
    v_Tabla = TRIM(v_TABLA)
    v_ODBC  = ODBC
    v_ID    = ID
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

Campo_Principal = "Id_" & v_Tabla

  %>
  
  <%
     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
  %>



  <%
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

   consulta = "SELECT * FROM " & v_Tabla & " WHERE " & Campo_Principal & "=" & lnkIdCarros   
   
   Ob_RS.OPEN consulta, Ob_Conn
   total_campos = Ob_RS.FIELDS.COUNT
   
    SqlRel = "Select * from CARdRelaciones where CARdRelaciones.TablaMaestra='"&Tabla&"'"
'response.write(SqlREl)
'response.end()

    Ob_Rel.OPEN SqlRel, Ob_Conn

   ruta = "Calendario.gif"
  %>

  <!-- FIELDSET STYLE="padding: 0; width:"90%"; height:232" -->


   <CENTER>

<!--- Consulta para sacar la descripción de los campos---------------------------------------------------------------- --->
<%
  Etiq_Nor = "SELECT VALUE FROM sysproperties WHERE  ID =" + "'" + v_ID + "'"
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

  <!--CENTER>
   <HR width=40%>
    <H2> 
     Captura de <% RESPONSE.WRITE (titulo)%>
    </H2>
   <HR WIDTH=40%>
   <BR><BR><BR>
  </CENTER -->


   <LEGEND>
    <B>
     <H3>
     <br> <br>
      Modificaciones de <% RESPONSE.WRITE (titulo)%>
     </H3>
    </B>
   </LEGEND>
   
  <Table>
   <TR>
<% 
Menus = 0
DO UNTIL Ob_Rel.Eof 
   if Menus = 5 or Menus = 9 then%>
      </TR><TR>
   <%end if%>
      <td width="17%" height="14" background="Multimedia/imagenes/menus/menu_izquierdo.jpg">
	<a target="mainFrame4" href="https://"+ session("IP_SERVER") +"/carrerapgr/MFiltro.asp?tabla_original=<%= OB_Rel("TablaDetalle")%>&ODBC=SIIFP&IdMaestro=<%= OB_Rel("TablaMaestra")%>&<%= "Id_"+OB_Rel("TablaMaestra")%>= <%= lnkIdCarros%>">
      <font size="2" face="Verdana, Arial, Helvetica, sans-serif"color="#FFFFFF"><%= trim(OB_Rel("MenuOpcion")) %></font></a>

   </TD>
<%
  Menus = Menus +1
Ob_Rel.MOVENEXT
   LOOP%>
   </TR>
 </Table>


<!--- ---------------------------------------------------------------------------------------------------------------- --->
<%x = -1 %>

  <%DO UNTIL Ob_RS_Etiq_Nor.Eof
    x = x + 1 %>
     <%FOR camp_etiq=0 TO total_campos_Etiq_Nor-1 %>
       <TABLE border="1" CELLSPACING="0"   WIDTH="90%" ID="AutoNumber1" HEIGHT="0">
         <TR>
           <TD WIDTH="232"
	    BGCOLOR = "">
       	    <P ALIGN="left">
<!--- Impresión de etiquetas para campos normales (<> de Id_) -------------------------------------------------------- --->
      	    <%IF (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "Id_") AND (MID(Ob_RS_Etiq_Nor(camp_etiq),1,3) <> "TI_")THEN%>
                <B>		<font color="#000080"> 	<%= Ob_RS_Etiq_Nor(camp_etiq) & ":" & "<BR>" %>  </font>	</B>
      	    <%END IF%>

           </TD> 
         <!--/TR --> 

<!--- Catálogo de tipos de datos SQL --------------------------------------------------------------------------------- --->
         <!-- TR -->
           <TD WIDTH="548" colspan="2">
       	   <P ALIGN="left">

     	   <%IF (MID(Ob_RS(x).NAME,1,3) <> "Id_") AND ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE <= 50) OR (Ob_RS(x).TYPE = 20) OR (Ob_RS(x).TYPE = 3) OR (Ob_RS(x).TYPE = 2) OR (Ob_RS(x).TYPE = 17) OR (Ob_RS(x).TYPE = 131) OR (Ob_RS(x).TYPE = 6) OR (Ob_RS(x).TYPE = 5) OR (Ob_RS(x).TYPE = 4) ) THEN%>
      		 
      		 <INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" VALUE = <%= chr(34) & Ob_RS(x).VALUE & chr(34) %>> 		   		 
      		     	   
    	   <%End If%>

     	   <%IF (MID(Ob_RS(x).NAME,1,3) <> "Id_") AND (Ob_RS(x).TYPE = 11) THEN
     	   
     	      If Ob_RS(x).VALUE = "True" or Ob_RS(x).VALUE = "Verdadero" Then %>	           	   
				<INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" VALUE = 1> 		   		 
     	   <% else %>
				<INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" VALUE = 0> 		   		 
     	         	 
     	   <% end if  
     	        
    	   End If%>



           	<%IF ( (Ob_RS(x).TYPE = 129 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 200 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 201) OR (Ob_RS(x).TYPE = 130 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 202 AND Ob_RS(x).DEFINEDSIZE > 50) OR (Ob_RS(x).TYPE = 203) )THEN%>
       			<TEXTAREA NAME="<%=Ob_RS(x).NAME%>" SIZE=10 ROWS=5 COLS=35><%=Ob_RS(x).VALUE%></TEXTAREA>
          	<%END IF%>

                 <%IF Ob_RS(x).TYPE = 135 THEN%> 
      			<INPUT TYPE="TEXT" NAME="<%=Ob_RS(x).NAME%>" SIZE="<%=Ob_RS(x).DEFINEDSIZE%>"  MAXLENGTH="<%=Ob_RS(x).DEFINEDSIZE%>" VALUE = <%=Ob_RS(x).VALUE%>> 
     		  	<IMG ONCLICK="window_open('FormVehiModificaciones','<%=Ob_RS(x).NAME%>')" border="0" src="<%= ruta%>" WIDTH="32" HEIGHT="34">
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
               <TD WIDTH="232"
	       BGCOLOR = "">
    	       <P ALIGN="left">

<!--- Impresion de etiquetas de campos de tipo catálogo (Empiezan con Id_) ------------------------------------------- --->     
 
               <B>	<font color="#000080"> 
				<%= MID( Ob_RS_Etiq_Nor(camp_etiq),4, LEN(Ob_RS_Etiq_Nor(camp_etiq)) ) & ":" %> 
	       </font>  </B>
	       
	       </TD>
	       <!-- /TR -->

	       <TD WIDTH="515"> 
          
	       <%control_combo = "cbx"+tabla_descripcion%>	
	       <%parametro_registro = "TxtNew"+tabla_descripcion%>
	       <%parametro_ODBC = v_ODBC%>

<!--- Creación de Combo Boxes para contener los catálogos ------------------------------------------------------------ ---> 
	     <SELECT NAME= <%= control_combo %> SIZE=1>
	         <OPTION VALUE="">
                   Ninguno
                 </OPTION>

	         <%DO UNTIL Ob_RS2.Eof%>

	           <OPTION <%IF Ob_RS(x) = Ob_RS2("Id_" & tabla_descripcion) THEN%> SELECTED <%END IF%>
		             VALUE="<%=Ob_RS2(0)%>">
                     <%= Ob_RS2(1)%> 
                   </OPTION>	
	           <%Ob_RS2.MOVENEXT
	         LOOP%>
	       </SELECT>
	       
	       <%parametro_tabla_encabezado = MID( (Ob_RS2(1).NAME),4,LEN(Ob_RS2(1).NAME))%>
	       <%parametro_tabla = Ob_RS2(1).NAME%>
	       <%pagina_catalogo = "Altas_" + parametro_tabla%>
	       </TD>

	       <TD WIDTH="27"> 
          
             <INPUT TYPE='button' NAME='boton' VALUE=' ... ' ONCLICK=" location.href='Operador.asp?Link1= <%=Nombre_Archivo_Original%>&Link2=<%=pagina_catalogo%>'"  STYLE="float: right"></TD>
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
<INPUT TYPE="Hidden" NAME=lnkIdCarros Value = <%= lnkIdCarros%> >

  <% Ob_Rs.CLOSE %>

 

  </FIELDSET>
<% IF mtarea <> "VER" THEN %>
  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Actualizar" NAME="B1"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  <BR><BR>
<% END IF%>
  <%
     IF SESSION("Contador") <> 0 THEN
  %>
     <INPUT TYPE="button" VALUE="Regresar a <%= b%>" ONCLICK="location.href='Operador_2.ASP'   " ID=button1 NAME=button1>
  <%		
     END IF
  %>
  </p>

   </CENTER>
        
   </FORM>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->