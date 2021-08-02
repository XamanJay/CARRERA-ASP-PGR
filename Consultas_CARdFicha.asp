<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Include/InhabilitaPag.inc" -->
<%On Error Resume Next
'response.write "1"
%>

<!-- #Include File = "Seguridad/Perfil.inc" -->




<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")


    v_Tabla = "CARdFicha"
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

   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

   ruta_img_calendario		= "Calendario.gif"

'========== Combos
%>

<%'=======No tiene combos===========%>


<% '========== Inicia HTML %>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">

 <HEAD>
  <TITLE>
   Pantalla Consultas
  </TITLE>
 </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">

  <CENTER>
 <!-- <FORM METHOD="post" ACTION= "ConsultasFiltro_F.asp" NAME= "FormConsultas">-->
 <FORM METHOD="post" ACTION= "ConsultasFiltro.asp" NAME= "FormConsultas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Consultas de Media Filiación  </FONT>
    </H2>
  </CENTER>
 <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">

  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

 <TABLE  border='1'   ID='AutoNumber1' HEIGHT='0'>
     
     <TR>
      <TD> 
         <B>Cara</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCara' SIZE=1>
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcCara")= CINT(Id_CARcCara) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= Ob_RS2("CARcCara")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= Ob_RS2("CARcCara")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Cejas</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCEJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCejas' SIZE=1>
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcCejas")= CINT(Id_CARcCejas) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= UCASE(Ob_RS2("CARcCejas"))%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= Ob_RS2("CARcCejas")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Frente</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCFRENTE" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFrente' SIZE=1>
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcFrente")= CINT(Id_CARcFrente) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= Ob_RS2("CARcFrente")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= Ob_RS2("CARcFrente")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	 <TR>
      <TD> 
         <B>Orejas</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCOREJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOrejas' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcOrejas")= CINT(Id_CARcOrejas) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= Ob_RS2("CARcOrejas")%>
                </OPTION>
             <%ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= Ob_RS2("CARcOrejas")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
      <TD> 
         <B>Boca</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCBOCA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcBoca' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcBoca")= CINT(Id_CARcBoca) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= Ob_RS2("CARcBoca")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= Ob_RS2("CARcBoca")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Labios</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCLABIOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcLabios' SIZE=1>
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcLabios")= CINT(Id_CARcLabios) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= Ob_RS2("CARcLabios")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= Ob_RS2("CARcLabios")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>

	 <TR>
      <TD> 
         <B>Mentón</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMENTON" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMenton' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcMenton")= CINT(Id_CARcMenton) THEN%>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= Ob_RS2("CARcMenton")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= Ob_RS2("CARcMenton")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>	
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     
      <TD> 
         <B>Color de cabello</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORCABELLO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcColorCabello' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcColorCabello")= CINT(Id_CARcColorCabello) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%= Ob_RS2("CARcColorCabello")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%= Ob_RS2("CARcColorCabello")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	<TR>
	 <TD> 
         <B>Cantidad de cabello</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcCabelloCantidad" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCabelloCantidad' SIZE=1 >
           <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCabelloCantidad")= CINT(Id_CARcCabelloCantidad) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%= Ob_RS2("CARcCabelloCantidad")%>
                   </OPTION>
               <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%= Ob_RS2("CARcCabelloCantidad")%>
                </OPTION>
               <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		   <%END IF %>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
	 
    </TR> 
	 
<TR>
      <TD> 
         <B>Forma de cabello</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcFormaCabello" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFormaCabello' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcFormaCabello")= CINT(Id_CARcFormaCabello) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%= UCASE(Ob_RS2("CARcFormaCabello"))%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%= UCASE(Ob_RS2("CARcFormaCabello"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
    </TR>
	 <TR>
      <TD> 
         <B>Color de ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCOJOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOjos' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcOjos")= CINT(Id_CARcOjos) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%= Ob_RS2("CARcOjos")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%= Ob_RS2("CARcOjos")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Forma de ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcFormaOjos" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFormaOjos' SIZE=1>
          <% IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcFormaOjos")= CINT(Id_CARcFormaOjos) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%= Ob_RS2("CARcFormaOjos")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%= Ob_RS2("CARcFormaOjos")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	 <TR>
      <TD> 
         <B>Tamaño de ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcOjosTamano" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOjosTamano' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOjosTamano")= CINT(Id_CARcOjosTamano) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjosTamano")%>'> <%= Ob_RS2("CARcOjosTamano")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOjosTamano")%>'> <%= Ob_RS2("CARcOjosTamano")%>
                </OPTION>
             <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
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
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcAnteojos")= UCASE(CINT(Id_CARcAnteojos)) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcAnteojos")%>'> <%= Ob_RS2("CARcAnteojos")%>
                   </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcAnteojos")%>'> <%= UCASE(Ob_RS2("CARcAnteojos"))%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Altura de nariz</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNARIZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNariz' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcNariz")= CINT(Id_CARcNariz) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%= Ob_RS2("CARcNariz")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%= Ob_RS2("CARcNariz")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 <TR>
      <TD> 
         <B>Ancho de nariz</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcNarizAncho" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNarizAncho' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNarizAncho")= CINT(Id_CARcNarizAncho) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNarizAncho")%>'> <%= Ob_RS2("CARcNarizAncho")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNarizAncho")%>'> <%= Ob_RS2("CARcNarizAncho")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
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
          <%IF Ob_RS2.EOF THEN%>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNarizForma")= CINT(Id_CARcNarizForma) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNarizForma")%>'> <%= Ob_RS2("CARcNarizForma")%>
                   </OPTION>
                <%ELSE  %>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcNarizForma")%>'> <%= Ob_RS2("CARcNarizForma")%>
                   </OPTION>
                <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	  
     <TR>
      <TD> 
         <B>Color de piel</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORTEZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcColorTez' SIZE=1>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <%IF Ob_RS2("Id_CARcColorTez")= CINT(Id_CARcColorTez) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%= Ob_RS2("CARcColorTez")%>
                </OPTION>
             <%ELSE%>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%= Ob_RS2("CARcColorTez")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	
	 <TR>
      <TD> 
         <B>Complexión</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOMPLEXION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcComplexion' SIZE=1>
           <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
           <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
             <% IF Ob_RS2("Id_CARcComplexion")= CINT(Id_CARcComplexion) THEN %>
                <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%= Ob_RS2("CARcComplexion")%>
                </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%= Ob_RS2("CARcComplexion")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>

     <TR>
      <TD>
        <B>Estatura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estatura' SIZE=8 MAXLENGTH=8 style="text-transform: uppercase"  VALUE=<%= Estatura%>>
      </TD > 
     <TR>
      <TD>
        <B>Peso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Peso' SIZE=6 MAXLENGTH=6 style="text-transform: uppercase" VALUE=<%= Peso%>>
      </TD > 
     <TR>
      <TD>
        <B>Tipo de sangre</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoSangre' SIZE=5 MAXLENGTH=5 style="text-transform: uppercase" VALUE=<%= TipoSangre%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Señas particulares</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='SeniasParticulares' SIZE=10 ROWS=1 COLS=35 style="text-transform: uppercase"><%=SeniasParticulares%></TEXTAREA>
      </TD > 
     </TR>
      <TR>
      <TD>
        <B>Registro validado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
          <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcValidado' SIZE=1 >
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcValidado")= CINT(Id_CARcValidado) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                   </OPTION>
                <%ELSE%>
                   <OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                   </OPTION>
                <%END IF%>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		 <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
   </TR>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE=TEXT NAME='CARdFicha' SIZE=40 style="text-transform: uppercase" ><%=CARdFicha%></TEXTAREA>
      </TD > 
     </TR>
</TABLE>



<%
'=====FIN LOOP ===================================================================================

TITU = "Media Filiación"
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >

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
<!-- #INCLUDE File="errores.inc" -->
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

VAR_JS

}
</script> 

