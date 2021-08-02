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

    v_Tabla = "CARdSituacionLaboral"
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

  IF request("Id_CARcEstatusLaboral") <> "" THEN
'   response.write"::::::"
 '  RESPONSE.WrITE(request("Id_CARcEstatusLaboral"))
'   RESPONSE.END
      xEstatus = CINT(request("Id_CARcEstatusLaboral"))
     Id_CARcEstatusLaboral = request("Id_CARcEstatusLaboral")
	 
   END IF 
	xAct  = 1
	xSusp = 2
	xLEsp = 3
	xBaja = 4
	xLTmp = 5
	xIrre = 6
	xLMed = 7 

%>


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
<%  
    IF request("Id_CARcEstatusLaboral") = "" THEN %>
  <FORM METHOD="post" ACTION= "Consultas_CARdSituacionLaboral.asp" NAME= "FormConsultas">
<%  ELSE %>
  <FORM METHOD="post" ACTION= "ConsultasFiltro.asp" NAME= "FormConsultas">
<% END IF %>

        <input type="hidden" name="Agregar" value="S">
  
  <CENTER>    <H2>      <FONT COLOR= #3366CC>Consultas de  Situacion Laboral   </FONT>    </H2>  </CENTER>

 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

<fieldset>
 <TABLE  border='1'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>

<%
IF request("Id_CARcEstatusLaboral") <> "" THEN
  CALL DispEstatus()
   IF xEstatus = xAct THEN
      CALL Actual()
   END IF
ELSE 
  CALL Estatus()
END IF

IF xEstatus = xSusp THEN
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF
IF xEstatus = xLEsp THEN
 '  CALL Estatus()
   CALL CargoEstructura()
   CALL Adscripcion()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL NumSesion()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF
IF xEstatus = xLTmp THEN
'   CALL Estatus()
   CALL DESIGNACIONEspecial()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL NumSesion()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF

IF xEstatus = xIrre THEN
'   CALL Estatus()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF

IF xEstatus = xLMed THEN
'   CALL Estatus()
   CALL NumOficio()
   CALL FechaOficio()
   CALL Periodos()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF

IF xEstatus = xBaja THEN
'   CALL Estatus()
   CALL MotivoBaja()
   CALL FechaBaja()
   CALL Actual()
   CALL SValidado()
   CALL Observaciones()
END IF

%>
	  </TABLE>
	  </fieldset>



<%
'=====FIN LOOP ===================================================================================
%>
<!--- Paso de parámetros (Tabla y ODBC seleccionados) --->

<%TITU = "Situación Laboral"%>
<INPUT TYPE="Hidden" NAME="TITU" Value = "<%= (CSTR(TITU))%>" >
<INPUT TYPE="Hidden" NAME=tabla_original Value = <%= v_Tabla%> >
<INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=Id_CARdDatosPersonales Value = <%=  idPersona%> >
<!--INPUT TYPE="Hidden" NAME=IdLogin Value = <%=Session("IdLogin")%>-->
<!--<INPUT TYPE="Hidden" NAME=IP_user Value = <%=request.servervariables("remote_addr")%>>-->

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  
 <%  IF request("Id_CARcEstatusLaboral") = ""  THEN %>
   <INPUT TYPE="submit" VALUE="Siguiente" NAME="B1" > &nbsp;&nbsp;&nbsp; 
   <INPUT TYPE="button" VALUE="Regresar" NAME="B2" onClick="history.go(-1)"> &nbsp;&nbsp;&nbsp; 
   <%ELSE %>
   
   
   
   
   <INPUT TYPE="submit" VALUE="Enviar" NAME="B1" > &nbsp;&nbsp;&nbsp; 
   
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  
   <INPUT TYPE="button" VALUE="Regresar" NAME="B2" onClick="history.go(-1)"> &nbsp;&nbsp;&nbsp; 
   
    <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">
   
 <%  DIM VAR_Id_CARcEstatusLaboral
 VAR_Id_CARcEstatusLaboral = request.Form("Id_CARcEstatusLaboral")
 
 %>
  <INPUT TYPE="Hidden" NAME="Id_CARcEstatusLaboral" Value = <%=  VAR_Id_CARcEstatusLaboral%> >
   
   
   <input type="hidden" name="Agregar" value="S">
   
   <!--    <input type="hidden" name="Id_CARcEstatusLaboral" value=<%'=request("Id_CARcEstatusLaboral")%>>   -->
   
 <% END IF %>
  </p>

   </CENTER>
  </FORM>


  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

 </BODY>
</HTML>
<!--- ================================================================================================================ --->

<%
SUB Estatus %>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARcEstatusLaboral" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1 <% IF xESTATUS <> 0 Then response.write("DISABLED") END IF %>>
          <%IF Ob_RS2.EOF THEN %>
	            <OPTION VALUE='0'>SIN INFORMACIÓN</OPTION>
          <%ELSE%>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusLaboral")= CINT(Id_CARcEstatusLaboral) THEN%>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
		  <%END IF%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>

<%
END SUB 


SUB DispEstatus %>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD>
         <%
		  Sql ="SELECT * FROM CARcEstatusLaboral where Id_CARcEstatusLaboral = " + CSTR(Id_CARcEstatusLaboral) 
         Ob_RS2.OPEN Sql, Ob_Conn 
	 ' RESPONSE.WRITE(Sql)& "----------"
	  
	  RESPONSE.WRITE(Ob_RS2("CARcEstatusLaboral"))
          Ob_RS2.CLOSE 
		  %>
      </TD>
     </TR>

<%
END SUB %>

<%
SUB DesignacionEspecial 
  %> 
     <TR>
      <TD> 
         <B>Designación especial</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESIGNACIONESPECIAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesignacionEspecial' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDesignacionEspecial")= CINT(Id_CARcDesignacionEspecial) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%= Ob_RS2("CARcDesignacionEspecial")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDesignacionEspecial")%>'> <%= Ob_RS2("CARcDesignacionEspecial")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
 <%

END SUB

SUB NUMOficio %>
     <TR>
      <TD>
        <B>No. Oficio / Documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficioDocto' SIZE=50 MAXLENGTH=50 style="text-transform: uppercase" VALUE=<%= NoOficioDocto%>>
      </TD > 
     </TR>

<%
END SUB
SUB FEchaOficio
%>
     <TR>
      <TD>
        <B>Fecha de oficio o documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaoficioDocto' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaoficioDocto%> >
       <IMG ONCLICK="window_open('FormAltas','FechaoficioDocto')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%	 
END SUB

SUB Periodos %> 
     <TR>
      <TD>
        <B>Periódo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Periodo' SIZE=20 MAXLENGTH=20 style="text-transform: uppercase" VALUE=<%= Periodo%>>
      </TD > 
     </TR>
<%
END SUB

SUB NumSesion %>
     <TR>
      <TD>
        <B>Sesión</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Sesion' SIZE=10 MAXLENGTH=10 style="text-transform: uppercase" VALUE=<%= Sesion%>>
      </TD > 
     </TR>
<%
END SUB

SUB CargoEstructura %>
     <TR>
      <TD> 
         <B>Cargo de estructura</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARGOESTRUCTURA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCargoEstructura' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcCargoEstructura")= CINT(Id_CARcCargoEstructura) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%= Ob_RS2("CARcCargoEstructura")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcCargoEstructura")%>'> <%= Ob_RS2("CARcCargoEstructura")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB Adscripcion %>
      <TR>
      <TD>
        <B>Adscripción para estructura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='AdscripcionEstructura' SIZE=60 MAXLENGTH=80  style="text-transform: uppercase" VALUE=<%= AdscripcionEstructura%>>
      </TD > 
     </TR>

<%END SUB

SUB MotivoBaja %>
    <TR>
      <TD> 
         <B>Motivo de baja</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOESTATUS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoEstatus' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcMotivoEstatus")= CINT(Id_CARcMotivoEstatus) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%= Ob_RS2("CARcMotivoEstatus")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcMotivoEstatus")%>'> <%= Ob_RS2("CARcMotivoEstatus")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB FechaBaja %>
     <TR>
      <TD>
        <B>Fecha de baja</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaBaja' SIZE=16 MAXLENGTH=16 READONLY >
       <IMG ONCLICK="window_open('FormAltas','FechaBaja')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
<%
END SUB

SUB BAJA %>


<%
END SUB

SUB Actual %>

     <TR>
      <TD>
        <B>¿Actual?</font>	</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcActual")= CINT(Id_CARcActual) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcActual")%>'> <%= Ob_RS2("CARcActual")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
<%
END SUB

SUB Observaciones %>
   <TR>
      <TD>
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdSituacionLaboral' SIZE=10 ROWS=5 COLS=35 style="text-transform: uppercase"><%=CARdSituacionLaboral%></TEXTAREA>
      </TD > 
	</TR>
<%
END SUB

SUB SValidado %>
      <TR>
      <TD>
        <B>Registro validado</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
           <%Sql ="SELECT * FROM CARcValidado" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcValidado' SIZE=1 >
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcValidado")= CINT(Id_CARcValidado) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcValidado")%>'> <%= Ob_RS2("CARcValidado")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
     </TD > 
   </TR>

<%
END SUB
%>




<!-- #INCLUDE File="errores.inc" -->

