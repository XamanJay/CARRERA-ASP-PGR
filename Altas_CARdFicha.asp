<% On Error Resume Next %>
<!-- #Include File = "Session/ActiveSession.inc" -->
<!-- #Include File = "Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   idMaestro = "Id_CARdDatosPersonales"
   idPersona = request("Id_CARdDatosPersonales")
'response.write(idPersona)
'response.end
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
<FORM METHOD='post'  ENCTYPE="multipart/form-data" ACTION="sendfile1.asp" NAME="FormAltas">
  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Ficha</FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
   <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()">&nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
    %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
    
     <TR>
      <TD> 
         <B>Cara</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCara' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCara")= CINT(Id_CARcCara) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%=UCASE(Ob_RS2("CARcCara"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%=UCASE(Ob_RS2("CARcCara"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	 
	<TR>
      <TD> 
         <B>Cejas</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCEJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCejas' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCejas")= CINT(Id_CARcCejas) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%=UCASE(Ob_RS2("CARcCejas"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%=UCASE(Ob_RS2("CARcCejas"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
 
	  <TR>
      <TD> 
         <B>Frente</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCFRENTE" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFrente' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFrente")= CINT(Id_CARcFrente) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%=UCASE(Ob_RS2("CARcFrente"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%=UCASE(Ob_RS2("CARcFrente"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
     
	 <TR>
      <TD> 
         <B>Orejas</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCOREJAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <select name='Id_CARcOrejas' size=1 >
            <%DO UNTIL Ob_RS2.Eof%>
            <%IF Ob_RS2("Id_CARcOrejas")= CINT(Id_CARcOrejas) THEN %>
            <option selected value='<%=Ob_RS2("Id_CARcOrejas")%>'> <%=UCASE(Ob_RS2("CARcOrejas"))%> </option>
            <% ELSE  %>
            <option value='<%=Ob_RS2("Id_CARcOrejas")%>'> <%=UCASE(Ob_RS2("CARcOrejas"))%> </option>
            <%END IF  %>
            <%Ob_RS2.MOVENEXT %>
            <%LOOP%>
          </select>
          <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	 
     <TR>
      <TD> 
         <B>Boca</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCBOCA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcBoca' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcBoca")= CINT(Id_CARcBoca) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%=UCASE(Ob_RS2("CARcBoca"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%=UCASE(Ob_RS2("CARcBoca"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	  <TR>
      <TD> 
         <B>Labios</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCLABIOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcLabios' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcLabios")= CINT(Id_CARcLabios) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%=UCASE(Ob_RS2("CARcLabios"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%=UCASE(Ob_RS2("CARcLabios"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
    
	    <TR>
      <TD> 
         <B>Mentón</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMENTON" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMenton' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMenton")= CINT(Id_CARcMenton) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%=UCASE(Ob_RS2("CARcMenton"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%=UCASE(Ob_RS2("CARcMenton"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
         
     
     <TR>
      <TD> 
         <B>Color de cabello</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORCABELLO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcColorCabello' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcColorCabello")= CINT(Id_CARcColorCabello) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%=UCASE(Ob_RS2("CARcColorCabello"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%=UCASE(Ob_RS2("CARcColorCabello"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 <TR>
      <TD> 
         <B>Cantidad de cabello</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcCabelloCantidad" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCabelloCantidad' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCabelloCantidad")= CINT(Id_CARcCabelloCantidad) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%=UCASE(Ob_RS2("CARcCabelloCantidad"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCabelloCantidad")%>'> <%=UCASE(Ob_RS2("CARcCabelloCantidad"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	 
<TR>
      <TD> 
         <B>Forma de cabello</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcFormaCabello" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFormaCabello' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaCabello")= CINT(Id_CARcFormaCabello) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%=UCASE(Ob_RS2("CARcFormaCabello"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%=UCASE(Ob_RS2("CARcFormaCabello"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>  
	 
	 
     <TR>
      <TD> 
         <B>Color de ojos</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCOJOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOjos' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOjos")= CINT(Id_CARcOjos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%=UCASE(Ob_RS2("CARcOjos"))%>                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%=UCASE(Ob_RS2("CARcOjos"))%>                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
<TR>
      <TD> 
         <B>Forma de ojos</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcFormaOjos" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFormaOjos' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaOjos")= CINT(Id_CARcFormaOjos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%=UCASE(Ob_RS2("CARcFormaOjos"))%></OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%=UCASE(Ob_RS2("CARcFormaOjos"))%></OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	  
	 <TR>
      <TD> 
         <B>Tamaño de ojos</B>      </TD>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 

	 
	 <TR>
      <TD> 
         <B>¿ Usa anteojos ?</B>      </TD>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>

	 
	 
	 
	 
      <TR>
      <TD> 
         <B>Altura de nariz</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNARIZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
    
	 
	 
	 
	 
	 <TR>
      <TD> 
         <B>Ancho de nariz</B>      </TD>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 <TR>
      <TD> 
         <B>Forma de nariz</B>      </TD>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 

	  <TR>
      <TD> 
         <B>Color de piel</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORTEZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	 	 

	 <TR>
      <TD> 
         <B>Complexión</B>      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOMPLEXION" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
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
    <% Ob_RS2.CLOSE%>      </TD>
     </TR>
	 
	 
     <TR>
      <TD>
        <B>Estatura</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estatura' SIZE=8 MAXLENGTH=8 style="text-transform: uppercase" VALUE=<%= Estatura%>>
      cm.</TD > 
     </TR>
     
     <TR>
      <TD>
        <B>Peso</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Peso' SIZE=8 MAXLENGTH=6 style="text-transform: uppercase" VALUE=<%= Peso%>>
      kg.</TD > 
     </TR>
     <TR>
      <TD>
        <B>Tipo de sangre</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
     <!--  <INPUT TYPE='TEXT' NAME='TipoSangre' SIZE=8 MAXLENGTH=5 style="text-transform: uppercase" VALUE=<%'= TipoSangre%>>-->
	   
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
      </TD > 
     </TR>
	      <TR>
      <TD>
        <B>Señas particulares</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA style="text-transform: uppercase" NAME='SeniasParticulares' SIZE=10 ROWS=5 COLS=35><%= SeniasParticulares%></TEXTAREA>
      </TD > 
     </TR>
	 <tr  align="center"> 
      <td><div align="left"><strong>Imagen de firma digitalizada</strong></div></td>
	  <td><input name="File1" size=30 type="file">	  </td>
    </tr>
	<tr  align="center"> 
      <td><div align="left"><strong>Imagen de huella dactilar digitalizada</strong>
                
    </div></td>
	  <td><input name="File2" size=30 type="file"  ></td>
	  <input type="hidden" name="oculto" value="oculto">
    </tr>
	<tr  align="center"> 
      <td><div align="left"><strong>Voz en formato digital</strong>
                
    </div></td>
	  <td><input name="File3" size=30 type="file"  ></td>
	  <input type="hidden" name="oculto3" value="oculto3">
    </tr>
	 <TR>
      <TD>
        <B>Observaciones</font>	</B>      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFicha' style="text-transform: uppercase" SIZE=10 ROWS=5 COLS=35><%=CARdFicha%></TEXTAREA>
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

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Enviar" NAME="B1" onClick="ValidaCampos()">&nbsp;&nbsp;&nbsp;  
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

  if (FormAltas.Estatura.value  == "")
  {
       alert("EL CAMPO: Estatura, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdDatosPersonales.value  == "")
  {
       alert("EL CAMPO: Id_Datos de la persona, no puede estar vacio");
       return false;
  }

/*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
   
   		var jvi_texto_correcto = /[\d\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_numero_correcto = /[\D\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/
		var jvi_textoynumero_correcto = /[\'\"\(\)\%\$\!\#\&\<\>\+\*\=\?\¿\¡\[\]\{\}\/\@]/

        if(jvi_numero_correcto.test(FormAltas.Estatura.value)) {
       alert('Ha escrito un caracter no valido en el campo Estatura, verifique por favor.');
	   FormAltas.Estatura.focus();
       return false;    
    }
	
	
	    if(jvi_numero_correcto.test(FormAltas.Peso.value)) {
       alert('Ha escrito un caracter no valido en el campo Peso, verifique por favor.');
	   FormAltas.Peso.focus();
       return false;    
    }
	
	   /* if(jvi_textoynumero_correcto.test(FormAltas.SeniasParticulares.value)) {
       alert('Ha escrito un caracter no valido en el campo Señas particulares , verifique por favor.');
	   FormAltas.SeniasParticulares.focus();
       return false;    
    }*/
	
	   /* if(jvi_textoynumero_correcto.test(FormAltas.CARdFicha.value)) {
       alert('Ha escrito un caracter no valido en el campo Observaciones, verifique por favor.');
	   FormAltas.CARdFicha.focus();
       return false;    
    }*/
	
	
 	 
FormAltas.B1.disabled = true;  
document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
}
</script>