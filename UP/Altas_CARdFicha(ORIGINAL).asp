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
  <FORM METHOD="post" ACTION= "Altas_CARdFicha.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  Ficha   </FONT>
    </H2>
  </CENTER>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" onClick="return ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
    	   Ob_RS.Addnew 
        if request("CARdFicha")  <> "" then  Ob_RS("CARdFicha")=request("CARdFicha") end if
        if request("Id_CARcBoca")  <> "" then  Ob_RS("Id_CARcBoca")=request("Id_CARcBoca") end if
        if request("Id_CARcCara")  <> "" then  Ob_RS("Id_CARcCara")=request("Id_CARcCara") end if
        if request("Id_CARcCejas")  <> "" then  Ob_RS("Id_CARcCejas")=request("Id_CARcCejas") end if
        if request("Id_CARcFrente")  <> "" then  Ob_RS("Id_CARcFrente")=request("Id_CARcFrente") end if
        if request("Id_CARcComplexion")  <> "" then  Ob_RS("Id_CARcComplexion")=request("Id_CARcComplexion") end if
        if request("Id_CARcColorCabello")  <> "" then  Ob_RS("Id_CARcColorCabello")=request("Id_CARcColorCabello") end if
        if request("Id_CARcFormaCabello")  <> "" then  Ob_RS("Id_CARcFormaCabello")=request("Id_CARcFormaCabello") end if
        if request("Id_CARcMenton")  <> "" then  Ob_RS("Id_CARcMenton")=request("Id_CARcMenton") end if
        if request("Id_CARcNariz")  <> "" then  Ob_RS("Id_CARcNariz")=request("Id_CARcNariz") end if
        if request("Id_CARcFormaOjos")  <> "" then  Ob_RS("Id_CARcFormaOjos")=request("Id_CARcFormaOjos") end if
        if request("Id_CARcOjos")  <> "" then  Ob_RS("Id_CARcOjos")=request("Id_CARcOjos") end if
        if request("Id_CARcOrejas")  <> "" then  Ob_RS("Id_CARcOrejas")=request("Id_CARcOrejas") end if
        if request("Id_CARcColorTez")  <> "" then  Ob_RS("Id_CARcColorTez")=request("Id_CARcColorTez") end if
        if request("Id_CARcLabios")  <> "" then  Ob_RS("Id_CARcLabios")=request("Id_CARcLabios") end if
        if request("Estatura")  <> "" then  Ob_RS("Estatura")=request("Estatura") end if
        if request("Firma")  <> "" then  Ob_RS("Firma")=request("Firma") end if
        if request("SeniasParticulares")  <> "" then  Ob_RS("SeniasParticulares")=request("SeniasParticulares") end if
		if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
		if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
        Ob_RS("Id_CARdDatosPersonales")= CINT(idPersona)
'        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Peso")  <> "" then  Ob_RS("Peso")=request("Peso") end if
        if request("TipoSangre")  <> "" then  Ob_RS("TipoSangre")=request("TipoSangre") end if
        Ob_RS.update
        response.clear
	       response.write("<H1>EL REGISTRO HA SIDO AGREGADO</H1>")
        response.end
     end if
    %>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     <TR>
      <TD> 
     </TR>
     <TR>
      <TD>
        <B>Comentario</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdFicha' SIZE=10 ROWS=5 COLS=35><%=CARdFicha%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Boca</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCBOCA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcBoca' SIZE=1 >
          <% IF Id_CARcBoca = "" OR Id_CARcBoca = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcBoca")= CINT(Id_CARcBoca) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= Ob_RS2("CARcBoca")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcBoca")%>'> <%= Ob_RS2("CARcBoca")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Cara</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCara' SIZE=1 >
          <% IF Id_CARcCara = "" OR Id_CARcCara = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCara")= CINT(Id_CARcCara) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= Ob_RS2("CARcCara")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCara")%>'> <%= Ob_RS2("CARcCara")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcCejas' SIZE=1 >
          <% IF Id_CARcCejas = "" OR Id_CARcCejas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCejas")= CINT(Id_CARcCejas) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= Ob_RS2("CARcCejas")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCejas")%>'> <%= Ob_RS2("CARcCejas")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcFrente' SIZE=1 >
          <% IF Id_CARcFrente = "" OR Id_CARcFrente = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFrente")= CINT(Id_CARcFrente) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= Ob_RS2("CARcFrente")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFrente")%>'> <%= Ob_RS2("CARcFrente")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcComplexion' SIZE=1 >
          <% IF Id_CARcComplexion = "" OR Id_CARcComplexion = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcComplexion")= CINT(Id_CARcComplexion) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%= Ob_RS2("CARcComplexion")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcComplexion")%>'> <%= Ob_RS2("CARcComplexion")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Color de cabello</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORCABELLO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcColorCabello' SIZE=1 >
          <% IF Id_CARcColorCabello = "" OR Id_CARcColorCabello = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcColorCabello")= CINT(Id_CARcColorCabello) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%= Ob_RS2("CARcColorCabello")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorCabello")%>'> <%= Ob_RS2("CARcColorCabello")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcFormaCabello' SIZE=1 >
          <% IF Id_CARcFormaCabello = "" OR Id_CARcFormaCabello = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaCabello")= CINT(Id_CARcFormaCabello) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%= Ob_RS2("CARcFormaCabello")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaCabello")%>'> <%= Ob_RS2("CARcFormaCabello")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>     <TR>
      <TD> 
         <B>Mentón</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMENTON" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMenton' SIZE=1 >
          <% IF Id_CARcMenton = "" OR Id_CARcMenton = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMenton")= CINT(Id_CARcMenton) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= Ob_RS2("CARcMenton")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMenton")%>'> <%= Ob_RS2("CARcMenton")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Nariz</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCNARIZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcNariz' SIZE=1 >
          <% IF Id_CARcNariz = "" OR Id_CARcNariz = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcNariz")= CINT(Id_CARcNariz) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%= Ob_RS2("CARcNariz")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcNariz")%>'> <%= Ob_RS2("CARcNariz")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCOJOS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcOjos' SIZE=1 >
          <% IF Id_CARcOjos = "" OR Id_CARcOjos = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOjos")= CINT(Id_CARcOjos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%= Ob_RS2("CARcOjos")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOjos")%>'> <%= Ob_RS2("CARcOjos")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<TR>
      <TD> 
         <B>Forma de Ojos</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcFormaOjos" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcFormaOjos' SIZE=1 >
          <% IF Id_CARcFormaOjos = "" OR Id_CARcFormaOjos = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcFormaOjos")= CINT(Id_CARcFormaOjos) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%= Ob_RS2("CARcFormaOjos")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcFormaOjos")%>'> <%= Ob_RS2("CARcFormaOjos")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcOrejas' SIZE=1 >
          <% IF Id_CARcOrejas = "" OR Id_CARcOrejas = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcOrejas")= CINT(Id_CARcOrejas) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= Ob_RS2("CARcOrejas")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcOrejas")%>'> <%= Ob_RS2("CARcOrejas")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD> 
         <B>Color de Piel</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCOLORTEZ" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcColorTez' SIZE=1 >
          <% IF Id_CARcColorTez = "" OR Id_CARcColorTez = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcColorTez")= CINT(Id_CARcColorTez) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%= Ob_RS2("CARcColorTez")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcColorTez")%>'> <%= Ob_RS2("CARcColorTez")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
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
	     <SELECT NAME='Id_CARcLabios' SIZE=1 >
          <% IF Id_CARcLabios = "" OR Id_CARcLabios = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcLabios")= CINT(Id_CARcLabios) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= Ob_RS2("CARcLabios")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcLabios")%>'> <%= Ob_RS2("CARcLabios")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
     <TR>
      <TD>
        <B>Estatura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Estatura' SIZE=8 MAXLENGTH=8 VALUE=<%= Estatura%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Firma</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='Firma' SIZE=10 ROWS=5 COLS=35><%=Firma%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Peso</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Peso' SIZE=6 MAXLENGTH=6 VALUE=<%= Peso%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Tipo de Sangre</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='TipoSangre' SIZE=5 MAXLENGTH=5 VALUE=<%= TipoSangre%>>
      </TD > 
     </TR>
	      <TR>
      <TD>
        <B>Señas Particulares</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='SeniasParticulares' SIZE=10 ROWS=5 COLS=35><%= SeniasParticulares%></TEXTAREA>
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
<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

  if (FormAltas.Estatura.value  == "")
  {
       alert("EL CAMPO: Estatura, no puede estar vacio");
       return false;
  }
  
  
  if (FormAltas.Id_CARdFicha.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Media Filiación.");
       return false;
  }
  
  if (FormAltas.Id_CARcBoca.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Boca.");
       return false;
  }
  
  if (FormAltas.Id_CARcCara.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Cara.");
       return false;
  }
  
  if (FormAltas.Id_CARcCejas.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Cejas.");
       return false;
  }
  
  if (FormAltas.Id_CARcFrente.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Frente.");
       return false;
  }
  
  if (FormAltas.Id_CARcComplexion.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Complexión.");
       return false;
  }
  
  if (FormAltas.Id_CARcColorCabello.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Color de cabello.");
       return false;
  }
  
  if (FormAltas.Id_CARcMenton.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Mentón.");
       return false;
  }
  
  if (FormAltas.Id_CARcNariz.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Nariz.");
       return false;
  }
  
  if (FormAltas.Id_CARcOjos.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Ojos.");
       return false;
  }
  
  if (FormAltas.Id_CARcOrejas.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Orejas.");
       return false;
  }
  
  if (FormAltas.Id_CARcColorTez.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Color de Piel.");
       return false;
  }
  
  if (FormAltas.Id_CARcLabios.value.search("[^0-9]")  == 0 ) 
  {
       alert(" Debe seleccionar una opcion en EL CAMPO: Labios.");
       return false;
  }
  
  


}
</script> 

