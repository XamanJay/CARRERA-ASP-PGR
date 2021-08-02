<!-- #Include File = "../MD5/md5.asp" -->

<%
  SUBPROCURA = TRIM(REQUEST.FORM("Id_CARcSubprocuradurias"))
  DELEGA     = TRIM(REQUEST.FORM("Id_CARcDG_o_Delegaciones")) 
  SUBSEDE    = TRIM(REQUEST.FORM("Id_CARcDir_o_subsede"))
  USUARIO 	 = TRIM(REQUEST.FORM("CARcUSR"))
  PASS	 = REQUEST.FORM("PW")
  PASS = TRIM(CSTR(PASS))
  IF PASS <> "" THEN
     PASS = MD5(PASS)
  END IF 

   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_C2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_C3  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
    v_Tabla = "CARcUSR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("Id_CARcUSR")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ Session("IP_SERVER")+";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")


consulta = "SELECT * FROM CARcDG_o_Delegaciones " 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = OB_rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
OB_RS.CLOSE 

'===== Llena un arreglo con los datos del Catalogo que sirve para ligar los combos Categoria y Nivel
consulta = "SELECT * FROM CARcDir_o_subsede" 
Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo3 = OB_rs.getrows
Campos_Combo3 = UBound(tbl_Combo3,1) 
regs_Combo3 = UBound(tbl_Combo3,2)
OB_RS.CLOSE 


'========== Combos
   consulta = "SELECT * FROM CARdUsrPerfilGrupo WHERE Id_CARcUSR ="+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT
   IF not OB_RS.EOF THEN
      Id_CARcPerfilGrupo = Ob_RS("Id_CARcPerfilGrupo")
   END IF 
   Ob_RS.CLOSE

   consulta = "SELECT * FROM CARcUSR WHERE Id_CARcUSR ="+CSTR(ParID) 
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT


   ruta_img_calendario		= "Calendario.gif"
%>

<%
'======= Inicializa variables de ambiente ===========
   CARcUSR= OB_RS("CARcUSR")
   PW= OB_RS("PW")
   Id_CARcSubprocuradurias= OB_RS("Id_CARcSubprocuradurias")
   Id_CARcDG_o_Delegaciones= OB_RS("Id_CARcDG_o_Delegaciones")
   Id_CARcDir_o_subsede= OB_RS("Id_CARcDir_o_subsede")
   Id_CARcTipoUSR= OB_RS("Id_CARcTipoUSR")
   Nombre= OB_RS("Nombre")
   Micro= OB_RS("Micro")
   Descripcion_usuario= OB_RS("Descripcion_usuario")
   Carrera= OB_RS("Carrera")
   Activo= OB_RS("Activo")

'========= No tiene combos ========= 
CALL SModifica()


%>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" THEN%>
<link href="../Estilo1.css" rel="stylesheet" type="text/css">
<% ELSE %>
<link href="../Estilo.css" rel="stylesheet" type"text/css">
<%END IF %> 



<% '========== Inicia HTML %>
<HTML><HEAD>
  <TITLE>
   Pantalla Modificacion
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
  <FORM METHOD="post" ACTION= "Modificaciones_CARcUSR.asp" NAME= "FormEdita">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%

TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT color="#006666">  USUARIOS DEL SISTEMA </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     <H2><FONT COLOR= #006666>MODIFICACI&Oacute;N DE USUARIOS DEL SISTEMA  </FONT></h2>
     <p ALIGN="center"> &nbsp;
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1">
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>
<%END IF %> 
   </H2>

  </CENTER>

 <!--- insertar resulstado de  LOOP ----------------------------------------------------------------------------------------------- --->

    <% 
    %>
    <TABLE   class="SL" border="1"  HEIGHT='349' width="805">
     <TR>
        <TD height="30" width="235"> 
          <%Sql ="SELECT * FROM CARcSubprocuradurias WHERE Id_CARcSubprocuradurias = "& Id_CARcSubprocuradurias %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
		 
       Subprocuraduría u homologa: </TD>
        
      <TD height="30" width="554"> 
	  
	  <strong> <%= Ob_RS2("CARcSubprocuradurias")%></strong>
	  <!--   <select name='Id_CARcSubprocuradurias' size=1 onChange='SeleCombo2("C")'>
          <%'''DO UNTIL Ob_RS2.Eof%>
          <%''' IF Ob_RS2("Id_CARcSubprocuradurias")= CLNG(Id_CARcSubprocuradurias) THEN %>
          <option selected value='<%'''=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%'''= Ob_RS2("CARcSubprocuradurias")%> 
          </option>
              <% '''ELSE  %>
                <OPTION VALUE='<%'''=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%'''= Ob_RS2("CARcSubprocuradurias")%>
                </OPTION>
         <%'''END IF  %>
          <%'''Ob_RS2.MOVENEXT %>
          <%'''LOOP%>
        </select>--></TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
        <TD height="30" width="235">Dirección General o Delegación : </TD>
        <TD height="30" width="554"> 
          <%Sql ="SELECT * FROM CARcDG_o_Delegaciones  WHERE Id_CARcDG_o_Delegaciones =" & Id_CARcDG_o_Delegaciones %>
          <% Ob_C2.OPEN Sql, Ob_Conn %>
		  <strong><%=Ob_C2("CARcDG_o_Delegaciones")%></strong>
<!--          <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1 onchange='SeleCombo3("C")'>
	  		 
	         <%'''DO UNTIL Ob_C2.Eof%>
                <% '''IF Ob_C2("Id_CARcDG_o_Delegaciones")= CLNG(Id_CARcDG_o_Delegaciones) THEN %>
                   <OPTION SELECTED VALUE='<%'''=Ob_C2("Id_CARcDG_o_Delegaciones")%>'> <%'''= Ob_C2("CARcDG_o_Delegaciones")%>
                   </OPTION>
             <%'''END IF  %>
	         <%'''Ob_C2.MOVENEXT %>
	         <%'''LOOP%>
       </SELECT>-->
      </TD>
    <% Ob_C2.CLOSE%>
     </TR>

     <TR>
        <TD height="30" width="235"> Dirección o Subsede : </TD>
        <TD height="30" width="554"> 
          <%Sql ="SELECT * FROM CARcDir_o_subsede  WHERE Id_CARcDir_o_subsede = "  & Id_CARcDir_o_subsede%>
          <% Ob_C3.OPEN Sql, Ob_Conn %>
		 <strong> <%= Ob_C3("CARcDir_o_subsede") %> </strong>
<!--          <SELECT NAME='Id_CARcDir_o_subsede' SIZE=1 >
	         <%'''DO UNTIL Ob_C3.Eof%>
                <% '''IF Ob_C3("Id_CARcDir_o_subsede")= CLNG(Id_CARcDir_o_subsede) THEN %>
                   <OPTION SELECTED VALUE='<%'''=Ob_C3("Id_CARcDir_o_subsede")%>'> <%'''= Ob_C3("CARcDir_o_subsede")%>
                   </OPTION>
             <%'''END IF  %>
	         <%'''Ob_C3.MOVENEXT %>
	         <%'''LOOP%>
       </SELECT>-->
      </TD>
     
     
    <% Ob_C3.CLOSE%>
     </TR>
     
          
	 
	 <TR> <BR>
	 <TD> Usuario: </TD>	 
	  <TD><input type="text" name="CARcUSR" size="35" VALUE="<%=CARcUSR%>" disabled></TD>
	 </TR>
	 	 <TR> 
		 	 <TD>Password : </TD>
		 	 <TD><Input type="text" size="35" name="PW" ></TD>
		 </TR>
		 
		 <TR>
      <TD> 
         Perfil de permisos : 
      </TD>
      <TD>
	  <%' DES_ESP  = 1 quiere decir que solo se mostraran los registros de Personal Sustantivo
	    ' Activos = 1 Son los perfiles que se van a mostrar 
	  Sql ="SELECT * FROM CARcPerfilGrupo WHERE Id_CARcPerfilGrupo = "& Id_CARcPerfilGrupo &"AND  DES_ESP = 1 AND Activo = 1" %>
          
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
		  
		  
		  <strong> <%= Ob_RS2("CARcPerfilGrupo")%></strong>
<!--	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE= 1 >
          <% ''' IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% '''END IF  %>
	         <%'''DO UNTIL Ob_RS2.Eof%>
                <%'''IF Ob_RS2("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>
                   <OPTION SELECTED VALUE='<%'''=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%'''= Ob_RS2("CARcPerfilGrupo")%>
                   </OPTION>
             <%''' ELSE  %>
                <OPTION VALUE='<%'''=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%'''= Ob_RS2("CARcPerfilGrupo")%>
                </OPTION>
             <%'''END IF  %>
	         <%'''Ob_RS2.MOVENEXT %>
	         <%'''LOOP%>
       </SELECT>-->
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	  <TR>
	 <TD>Descripción del Usuario:</TD>
	 <TD><Input type="text" name="Descripcion_Usuario" size="50" VALUE="<%=Descripcion_Usuario%>"></TD>
	 </TR>
	 
	 <TR>
	 <TD>Nombre de la persona responsable del usuario:</TD>
	 <TD><Input type="text" name="Nombre" size="50" VALUE="<%=Nombre%>"></TD>
	 </TR>
	 
	  <TR>
	 <TD>Micro(s) de la persona responsable del usuario:</TD>
	 <TD><Input type="text" name="Micro" size="50" VALUE="<%=Micro%>"></TD>
	 </TR>
	
	 
    </TABLE> </Center>

<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARcUSR >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=Id_CARcUSR Value ="<%= ParID%>" >

  <p ALIGN="center"> &nbsp;
 
<% IF TOper = "MOD" then%>
  <INPUT TYPE="SUBMIT" VALUE="Guardar cambios " NAME="B1">
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
<% ELSE %>
   <BR>
  <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% END IF %> 

  </p>

   </CENTER>
  </FORM>

  <% Ob_Rs.CLOSE %>
  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->
<%
SUB SModifica
     vModi = request("Modi") 
     if vModi = "S" then  
   
'   IF SUBPROCURA = 0 THEN  ' Si no elijo subprocu quiere decir que es un *todopoderoso
'       Id_CARcTipoUSR = 4   'por consiguiente si no elijo subprocur todos se van en 0 ceros
'   ELSEIF SUBPROCURA <> 0 AND DELEGA = 0 THEN   ' SI solo elijo subprocurador y dejo los demas en blanco
'       Id_CARcTipoUSR = 5                        ' quiere decir que es s*ubprocu
'   ELSEIF SUBPROCURA <> 0 AND DELEGA <> 0 AND SUBSEDE = 0 THEN   ' Quiere decir que es *delegado 
'       Id_CARcTipoUSR = 6
'   ELSEIF SUBPROCURA <> 0 AND DELEGA <> 0 AND SUBSEDE <> 0 THEN   ' Quiere decir que es * Va a poder consultar todo lo de un Subdelegado o usuario
'       Id_CARcTipoUSR = 7
'   END IF

        QueryModi = " UPDATE CARcUSR SET "
'        QueryModi = QueryModi + "CARcUSR = '" + UCASE(REQUEST("CARcUSR"))+"', "
         IF PASS <> "" THEN
'			RESPONSE.WRITE ">"+TRIM(CSTR(PASS))+"<"
'			RESPONSE.END
            QueryModi = QueryModi + "PW = '" +PASS+"', "
         END IF 
   '     QueryModi = QueryModi + "Id_CARcSubprocuradurias = '" + UCASE(REQUEST("Id_CARcSubprocuradurias"))+"', "
   '     QueryModi = QueryModi + "Id_CARcDG_o_Delegaciones = '" + UCASE(REQUEST("Id_CARcDG_o_Delegaciones"))+"', "
    '    QueryModi = QueryModi + "Id_CARcDir_o_subsede = '" + UCASE(REQUEST("Id_CARcDir_o_subsede"))+"', "
 '       QueryModi = QueryModi + "Id_CARcTipoUSR = '" + cstr(Id_CARcTipoUSR) +"', "
        QueryModi = QueryModi + "Nombre = '" + UCASE(REQUEST("Nombre"))+"', "
        QueryModi = QueryModi + "Micro = '" + UCASE(REQUEST("Micro"))+"', "
        QueryModi = QueryModi + "Descripcion_usuario = '" + UCASE(REQUEST("Descripcion_usuario"))+"' "
'        QueryModi = QueryModi + "Carrera = '" + UCASE(REQUEST("Carrera"))+"', "
'        QueryModi = QueryModi + "Activo = '" + UCASE(REQUEST("Activo"))+"'"
        QueryModi = QueryModi + "WHERE Id_CARcUSR = "+CSTR(ParID)
		
'        IF Id_CARcPerfilGrupo  <> request("Id_CARcPerfilGrupo") and request("Agregar")="S" THEN
'		   QueryPerfil = " update CARdUsrPerfilGrupo SET Id_CARcPerfilGrupo = "+REQUEST("Id_CARcPerfilGrupo")+" where Id_CARcUSR = "+CSTR(ParID)
'        END IF 
		
'        Ob_Conn.EXECUTE( QueryModi + QueryPerfil)
'		response.write QueryModi
'		response.end 
		
        Ob_Conn.EXECUTE(QueryModi)


        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if

END SUB
%>



