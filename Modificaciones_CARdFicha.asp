<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARdFicha"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
    ParId   = request("ParamID")
    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

  	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+v_ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

   consulta = "SELECT * FROM CARdFicha WHERE Id_CARdFicha ="+CSTR(ParID) 
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
   CARdFicha= OB_RS("CARdFicha")
   Id_CARcBoca= OB_RS("Id_CARcBoca")
   Id_CARcCara= OB_RS("Id_CARcCara")
   Id_CARcCejas= OB_RS("Id_CARcCejas")
   Id_CARcFrente= OB_RS("Id_CARcFrente")
   Id_CARcComplexion= OB_RS("Id_CARcComplexion")
   Id_CARcFormaCabello= OB_RS("Id_CARcFormaCabello")
   Id_CARcColorCabello= OB_RS("Id_CARcColorCabello")
   Id_CARcMenton= OB_RS("Id_CARcMenton")
   Id_CARcNariz= OB_RS("Id_CARcNariz")
   Id_CARcFormaOjos= OB_RS("Id_CARcFormaOjos")
   Id_CARcOjos= OB_RS("Id_CARcOjos")
   Id_CARcOrejas= OB_RS("Id_CARcOrejas")
   Id_CARcColorTez= OB_RS("Id_CARcColorTez")
   
   Id_CARcCabelloCantidad= OB_RS("Id_CARcCabelloCantidad")
   Id_CARcNarizAncho= OB_RS("Id_CARcNarizAncho")
   Id_CARcNarizForma= OB_RS("Id_CARcNarizForma")
   Id_CARcOjosTamano= OB_RS("Id_CARcOjosTamano")
   Id_CARcAnteojos= OB_RS("Id_CARcAnteojos")
   
   




   
   Id_CARcLabios= OB_RS("Id_CARcLabios")
   Estatura= OB_RS("Estatura")
'   Foto= OB_RS("Foto")
   Id_CARdDatosPersonales= OB_RS("Id_CARdDatosPersonales")
   Peso= OB_RS("Peso")
   'TipoSangre= OB_RS("TipoSangre")
   Id_CARcTipoSangre= OB_RS("Id_CARcTipoSangre")
   
   Firma = OB_RS("Firma")
   Huellas = OB_RS("Huellas")
   VOZ = OB_RS("VOZ")
   SeniasParticulares = OB_RS("SeniasParticulares")
   

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
<!--  <FORM METHOD="post" ACTION= "Modificaciones_CARdFicha.asp" NAME= "FormEdita">-->
  <FORM METHOD='post'  ENCTYPE="multipart/form-data" ACTION="sendfile2.asp" NAME="FormEdita">

        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
<%
TOper = REQUEST("TOper")
 IF TOper = "VER" then%>
    <H2><FONT COLOR= #990000>Ver Media Filiación  </FONT></h2>
     <BR>
    <INPUT TYPE="button" VALUE="Ver otro registro" ONCLICK="location.href='javascript:window.history.back()'   " >
<% ELSE %>
     
    <H2><FONT COLOR= #990000>Modificar Media Filiaci&oacute;n</FONT></h2>
    <p ALIGN="center"> &nbsp;
 <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()">&nbsp;&nbsp;&nbsp; 
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
        consulta = "SELECT * FROM CARdFicha WHERE Id_CARdFicha ="+CSTR(ParID)
        Ob_RS.OPEN consulta, Ob_Conn 
        if request("CARdFicha")  <> "" then  Ob_RS("CARdFicha")=request("CARdFicha") end if
        if request("Id_CARcBoca")  <> "" then  Ob_RS("Id_CARcBoca")=request("Id_CARcBoca") end if
        if request("Id_CARcCara")  <> "" then  Ob_RS("Id_CARcCara")=request("Id_CARcCara") end if
        if request("Id_CARcCejas")  <> "" then  Ob_RS("Id_CARcCejas")=request("Id_CARcCejas") end if
        if request("Id_CARcFrente")  <> "" then  Ob_RS("Id_CARcFrente")=request("Id_CARcFrente") end if
        if request("Id_CARcComplexion")  <> "" then  Ob_RS("Id_CARcComplexion")=request("Id_CARcComplexion") end if
        if request("Id_CARcFormaCabello")  <> "" then  Ob_RS("Id_CARcFormaCabello")=request("Id_CARcFormaCabello") end if
        if request("Id_CARcColorCabello")  <> "" then  Ob_RS("Id_CARcColorCabello")=request("Id_CARcColorCabello") end if
        if request("Id_CARcMenton")  <> "" then  Ob_RS("Id_CARcMenton")=request("Id_CARcMenton") end if
        if request("Id_CARcNariz")  <> "" then  Ob_RS("Id_CARcNariz")=request("Id_CARcNariz") end if
        if request("Id_CARcFormaOjos")  <> "" then  Ob_RS("Id_CARcFormaOjos")=request("Id_CARcFormaOjos") end if
        if request("Id_CARcOjos")  <> "" then  Ob_RS("Id_CARcOjos")=request("Id_CARcOjos") end if
        if request("Id_CARcOrejas")  <> "" then  Ob_RS("Id_CARcOrejas")=request("Id_CARcOrejas") end if
        if request("Id_CARcColorTez")  <> "" then  Ob_RS("Id_CARcColorTez")=request("Id_CARcColorTez") end if
        if request("Id_CARcLabios")  <> "" then  Ob_RS("Id_CARcLabios")=request("Id_CARcLabios") end if
        if request("Estatura")  <> "" then  Ob_RS("Estatura")=request("Estatura") end if
'        if request("Foto")  <> "" then  Ob_RS("Foto")=request("Foto") end if
        if request("SeniasParticulares")  <> "" then  Ob_RS("SeniasParticulares")=request("SeniasParticulares") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Peso")  <> "" then  Ob_RS("Peso")=request("Peso") end if
        if request("CARcTipoSangre")  <> "" then  Ob_RS("CARcTipoSangre")=request("CARcTipoSangre") end if
		
		Ob_RS("Id_CARcSubprocuradurias") = session("Subprocuraduria") 
		Ob_RS("Id_CARcDG_o_Delegaciones") = session ("Delegacion") 
		Ob_RS("Id_CARcDir_o_subsede") = session ("Subsede") 
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO MODIFICADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
      
	  <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCCARA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Cara</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcCara' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCara")= CINT(Id_CARcCara) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= UCASE(Ob_RS2("CARcCara"))%></OPTION>
                <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= UCASE(Ob_RS2("CARcCara"))%></OPTION>
             	<%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>

	  
          <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCCEJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Cejas</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcCejas' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCejas")= CINT(Id_CARcCejas) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= UCASE(Ob_RS2("CARcCejas"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= UCASE(Ob_RS2("CARcCejas"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCFRENTE" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Frente</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcFrente' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFrente")= CINT(Id_CARcFrente) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= UCASE(Ob_RS2("CARcFrente"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= UCASE(Ob_RS2("CARcFrente"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCOREJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Orejas</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcOrejas' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOrejas")= CINT(Id_CARcOrejas) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= UCASE(Ob_RS2("CARcOrejas"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= UCASE(Ob_RS2("CARcOrejas"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 
	 <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCBOCA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Boca</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcBoca' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcBoca")= CINT(Id_CARcBoca) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= UCASE(Ob_RS2("CARcBoca"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= UCASE(Ob_RS2("CARcBoca"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     
	 
	 
	 
	  <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCLABIOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Labios</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcLabios' SIZE=1 >
   	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcLabios")= CINT(Id_CARcLabios) THEN %>                  
				 <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= UCASE(Ob_RS2("CARcLabios"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= UCASE(Ob_RS2("CARcLabios"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	
	  <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCMENTON" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Mentón</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcMenton' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMenton")= CINT(Id_CARcMenton) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= UCASE(Ob_RS2("CARcMenton"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= UCASE(Ob_RS2("CARcMenton"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	
	
	 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCCOLORCABELLO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Color de cabello</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcColorCabello' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcColorCabello")= CINT(Id_CARcColorCabello) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%= UCASE(Ob_RS2("CARcColorCabello"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%=UCASE(Ob_RS2("CARcColorCabello"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 <TR>
      <TD> 
         <B>Cantidad de cabello</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcCabelloCantidad" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCabelloCantidad' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCabelloCantidad")= CINT(Id_CARcCabelloCantidad) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%= UCASE(Ob_RS2("CARcCabelloCantidad"))%></OPTION>
                <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%= UCASE(Ob_RS2("CARcCabelloCantidad"))%></OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	 
	 
 <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcFormaCabello" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Forma de cabello</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcFormaCabello' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaCabello")= CINT(Id_CARcFormaCabello) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%= UCASE(Ob_RS2("CARcFormaCabello"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%=UCASE(Ob_RS2("CARcFormaCabello"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>  
	 
     
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCOJOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Color de ojos</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcOjos' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOjos")= CINT(Id_CARcOjos) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%=UCASE(Ob_RS2("CARcOjos"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%=UCASE(Ob_RS2("CARcOjos"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARcFormaOjos" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Forma de ojos</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcFormaOjos' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaOjos")= CINT(Id_CARcFormaOjos) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%=UCASE(Ob_RS2("CARcFormaOjos"))%></OPTION>
               <%ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%=UCASE(Ob_RS2("CARcFormaOjos"))%></OPTION>
               <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     
	 <TR>
      <TD> 
         <B>Tamaño de ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcOjosTamano" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOjosTamano' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOjosTamano")= CINT(Id_CARcOjosTamano) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjosTamano")%>'> <%=UCASE(Ob_RS2("CARcOjosTamano"))%></OPTION>
             <% ELSE  %>
                  <OPTION VALUE='<%=Ob_RS2("Id_CARcOjosTamano")%>'> <%=UCASE(Ob_RS2("CARcOjosTamano"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 

	 <TR>
      <TD> 
         <B>¿ Usa anteojos ?</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcAnteojos" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcAnteojos' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcAnteojos")= CINT(Id_CARcAnteojos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAnteojos")%>'> <%=UCASE(Ob_RS2("CARcAnteojos"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAnteojos")%>'> <%=UCASE(Ob_RS2("CARcAnteojos"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     
	 
     
	 
	 
     <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCNARIZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Altura de nariz</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcNariz' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNariz")= CINT(Id_CARcNariz) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%=UCASE(Ob_RS2("CARcNariz"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%=UCASE(Ob_RS2("CARcNariz"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 
	 
	 
	 <TR>
      <TD> 
         <B>Ancho de nariz</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNarizAncho" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNarizAncho' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNarizAncho")= CINT(Id_CARcNarizAncho) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNarizAncho")%>'> <%=UCASE(Ob_RS2("CARcNarizAncho"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNarizAncho")%>'> <%=UCASE(Ob_RS2("CARcNarizAncho"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 

	 
	 
	 
	 <TR>
      <TD> 
         <B>Forma de nariz</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNarizForma" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNarizForma' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNarizForma")= CINT(Id_CARcNarizForma) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNarizForma")%>'> <%=UCASE(Ob_RS2("CARcNarizForma"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNarizForma")%>'> <%=UCASE(Ob_RS2("CARcNarizForma"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 

	 <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCCOLORTEZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Color de piel</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcColorTez' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcColorTez")= CINT(Id_CARcColorTez) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%=UCASE(Ob_RS2("CARcColorTez"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%=UCASE(Ob_RS2("CARcColorTez"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
	 
	 
	 
	 
	 <TR>
      <TD> 
          <%Sql ="SELECT * FROM CARCCOMPLEXION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
         <B>Complexión</B><BR>
      </TD>
      <TD>
	     <SELECT NAME='Id_CARcComplexion' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcComplexion")= CINT(Id_CARcComplexion) THEN %>                   
				<OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%=UCASE(Ob_RS2("CARcComplexion"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%=UCASE(Ob_RS2("CARcComplexion"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     
	 
     <TR>
      <TD>
        <B>Estatura<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estatura' SIZE=8 MAXLENGTH=8 style="text-transform: uppercase" VALUE='<%= Estatura%>'>
		 cm.<BR> <BR>
      </TD > 
     </TR> 
     <TR>
      <TD>
        <B>Peso<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Peso' SIZE=6 MAXLENGTH=6 style="text-transform: uppercase" VALUE='<%= Peso%>'>
		 kg.<BR> <BR>
      </TD > 
     <TR>
      <TD>
        <B>Tipo de sangre<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
<!--       <INPUT TYPE='TEXT' NAME='TipoSangre' SIZE=5 MAXLENGTH=5 style="text-transform: uppercase" VALUE='<%'= TipoSangre%>'>
-->	   
	   <%Sql ="SELECT * FROM CARcTipoSangre" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoSangre' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoSangre")= CINT(Id_CARcTipoSangre) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoSangre")%>'> <%=UCASE(Ob_RS2("CARcTipoSangre"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoSangre")%>'> <%=UCASE(Ob_RS2("CARcTipoSangre"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
	
	
	
		 <BR> <BR>
      </TD > 
    </TR>
	      <TR>
      <TD>
        <B>Señas particulares</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='SeniasParticulares' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%= SeniasParticulares%></TEXTAREA>
      </TD > 
     </TR>
	  <tr  align="center"> 
      <td><div align="left"><strong>Imagen de firma digitalizada</strong>
                
    </div></td>
	  <td><input type="text" value="<%= Firma%>" size="20" style="text-transform: uppercase"><input name="File1" size=30 type="file"> 
	  </td>
    </tr>
	<tr  align="center"> 
      <td><div align="left"><strong>Imagen de huella dactilar digitalizada</strong>
                
    </div></td>
	  <td><input type="text" value="<%= Huellas%>" size="20" style="text-transform: uppercase"><input name="File2" size=30 type="file" ></td>
	  <input type="hidden" name="oculto" value="oculto">
    </tr>
	 <tr  align="center"> 
      <td><div align="left"><strong>Voz en formato digital</strong></div></td>
	  <td><input type="text" value="<%= VOZ%>" size="20" style="text-transform: uppercase"><input name="File3" size=30 type="file"  ></td>
	  <input type="hidden" name="oculto3" value="oculto3">
    </tr>
	  <TR>
      <TD>
        <B>Observaciones<BR>  
        </font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFicha' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdFicha%></TEXTAREA>
  	<BR><BR>
      </TD > 
	  </TR>
</TABLE>


<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<% '''jv  Id_Persona = REQUEST("Id_Persona")  %>


<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%= Id_CARdDatosPersonales%> >

<INPUT TYPE="Hidden" NAME=tabla_original Value = CARdFicha >
<INPUT TYPE="Hidden" NAME=v_ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Modi Value =S >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParID%> >

<INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>>
<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>

  <% Ob_Rs.CLOSE %>

 
<% IF TOper <> "VER" then %>
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()">&nbsp;&nbsp;&nbsp; 
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

  if (FormEdita.Estatura.value  == "")
  {
       alert("EL CAMPO: Estatura, no puede estar vacio");
       return false;
  }
  
  if (FormEdita.Id_CARdDatosPersonales.value  == "")
  {
       alert("EL CAMPO: Id_Datos de la persona, no puede estar vacio");
       return false;
  }



/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        if(jvi_numero_correcto.test(FormEdita.Estatura.value)) {
       alert('Ha escrito un caracter no valido en el campo Estatura, verifique por favor.');
	   FormEdita.Estatura.focus();
       return false;    
    }
	
	
	    if(jvi_numero_correcto.test(FormEdita.Peso.value)) {
       alert('Ha escrito un caracter no valido en el campo Peso, verifique por favor.');
	   FormEdita.Peso.focus();
       return false;    
    }
	
	   /* if(jvi_textoynumero_correcto.test(FormEdita.SeniasParticulares.value)) {
       alert('Ha escrito un caracter no valido en el campo Señas particulares , verifique por favor.');
	   FormEdita.SeniasParticulares.focus();
       return false;    
    }*/
	
	   /* if(jvi_textoynumero_correcto.test(FormEdita.CARdFicha.value)) {
       alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	   FormEdita.CARdFicha.focus();
       return false;    
    }*/
	
	
 	 
FormEdita.B1.disabled = true;  
document.FormEdita.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/

}
</script>