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
  <FORM METHOD="post" ACTION= "Altas_CARdSituacionLaboral.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">

  
  <CENTER>
    <H2> 
     <FONT COLOR= #3366CC>Altas de  SituacionLaboral   </FONT>
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
        if request("CARdSituacionLaboral")  <> "" then  Ob_RS("CARdSituacionLaboral")=request("CARdSituacionLaboral") end if
        if request("Id_CARcEstatusLaboral")  <> "" then  Ob_RS("Id_CARcEstatusLaboral")=request("Id_CARcEstatusLaboral") end if
        if request("Id_CARcDesignacionEspecial")  <> "" then  Ob_RS("Id_CARcDesignacionEspecial")=request("Id_CARcDesignacionEspecial") end if
        if request("NoOficioDocto")  <> "" then  Ob_RS("NoOficioDocto")=request("NoOficioDocto") end if
        if request("FechaoficioDocto")  <> "" then  Ob_RS("FechaoficioDocto")=request("FechaoficioDocto") end if
        if request("Periodo")  <> "" then  Ob_RS("Periodo")=request("Periodo") end if
        if request("Id_CARcCargoEstructura")  <> "" then  Ob_RS("Id_CARcCargoEstructura")=request("Id_CARcCargoEstructura") end if
        if request("Id_CARcMotivoEstatus")  <> "" then  Ob_RS("Id_CARcMotivoEstatus")=request("Id_CARcMotivoEstatus") end if
        if request("FechaBaja")  <> "" then  Ob_RS("FechaBaja")=request("FechaBaja") end if
        if request("Id_CARcTipoAcuerdo")  <> "" then  Ob_RS("Id_CARcTipoAcuerdo")=request("Id_CARcTipoAcuerdo") end if
        if request("FechaAcuerdo")  <> "" then  Ob_RS("FechaAcuerdo")=request("FechaAcuerdo") end if
        if request("FechaInicio")  <> "" then  Ob_RS("FechaInicio")=request("FechaInicio") end if
        if request("FechaTermino")  <> "" then  Ob_RS("FechaTermino")=request("FechaTermino") end if
        if request("Tiempo")  <> "" then  Ob_RS("Tiempo")=request("Tiempo") end if
        if request("FechaCaptura")  <> "" then  Ob_RS("FechaCaptura")=request("FechaCaptura") end if
        if request("Id_CARcActual")  <> "" then  Ob_RS("Id_CARcActual")=request("Id_CARcActual") end if
        if request("Id_CARdDatosPersonales")  <> "" then  Ob_RS("Id_CARdDatosPersonales")=request("Id_CARdDatosPersonales") end if
        if request("Fecha_Captura")  <> "" then  Ob_RS("Fecha_Captura")=request("Fecha_Captura") end if
        if request("Id_CARcSubprocuradurias")  <> "" then  Ob_RS("Id_CARcSubprocuradurias")=request("Id_CARcSubprocuradurias") end if
        if request("Id_CARcDG_o_Delegaciones")  <> "" then  Ob_RS("Id_CARcDG_o_Delegaciones")=request("Id_CARcDG_o_Delegaciones") end if
        if request("Id_CARcDir_o_subsede")  <> "" then  Ob_RS("Id_CARcDir_o_subsede")=request("Id_CARcDir_o_subsede") end if
        if request("IdLogin")  <> "" then  Ob_RS("IdLogin")=request("IdLogin") end if
        if request("IP_user")  <> "" then  Ob_RS("IP_user")=request("IP_user") end if
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
        <B>Observaciones</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <TEXTAREA NAME='CARdSituacionLaboral' SIZE=10 ROWS=5 COLS=35><%=CARdSituacionLaboral%></TEXTAREA>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Estatus</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCESTATUSLABORAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1 >
          <% IF Id_CARcEstatusLaboral = "" OR Id_CARcEstatusLaboral = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcEstatusLaboral")= CINT(Id_CARcEstatusLaboral) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcEstatusLaboral")%>'> <%= Ob_RS2("CARcEstatusLaboral")%>
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
         <B>ugnación Especial</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDESIGNACIONESPECIAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDesignacionEspecial' SIZE=1 >
          <% IF Id_CARcDesignacionEspecial = "" OR Id_CARcDesignacionEspecial = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
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
     <TR>
      <TD>
        <B>No. Oficio / Documento</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='NoOficioDocto' SIZE=50 MAXLENGTH=50 VALUE=<%= NoOficioDocto%>>
      </TD > 
     </TR>
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
     <TR>
      <TD>
        <B>Periodo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Periodo' SIZE=20 MAXLENGTH=20 VALUE=<%= Periodo%>>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Cargo de Estructura</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCCARGOESTRUCTURA" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcCargoEstructura' SIZE=1 >
          <% IF Id_CARcCargoEstructura = "" OR Id_CARcCargoEstructura = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
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
     <TR>
      <TD> 
         <B>Motivo de baja</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCMOTIVOESTATUS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcMotivoEstatus' SIZE=1 >
          <% IF Id_CARcMotivoEstatus = "" OR Id_CARcMotivoEstatus = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
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
     <TR>
      <TD>
        <B>Fecha de Baja</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaBaja' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaBaja%> >
       <IMG ONCLICK="window_open('FormAltas','FechaBaja')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Por acuerdo</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCTIPOACUERDO" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoAcuerdo' SIZE=1 >
          <% IF Id_CARcTipoAcuerdo = "" OR Id_CARcTipoAcuerdo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcTipoAcuerdo")= CINT(Id_CARcTipoAcuerdo) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcTipoAcuerdo")%>'> <%= Ob_RS2("CARcTipoAcuerdo")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcTipoAcuerdo")%>'> <%= Ob_RS2("CARcTipoAcuerdo")%>
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
        <B>Fecha de Acuerdo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaAcuerdo' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaAcuerdo%> >
       <IMG ONCLICK="window_open('FormAltas','FechaAcuerdo')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de Inicio</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaInicio' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaInicio%> >
       <IMG ONCLICK="window_open('FormAltas','FechaInicio')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de Termino</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaTermino' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaTermino%> >
       <IMG ONCLICK="window_open('FormAltas','FechaTermino')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Tiempo</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Tiempo' SIZE=15 MAXLENGTH=15 VALUE=<%= Tiempo%>>
      </TD > 
     </TR>
     <TR>
      <TD>
        <B>Fecha de Captura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='FechaCaptura' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= FechaCaptura%> >
       <IMG ONCLICK="window_open('FormAltas','FechaCaptura')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>Actual ?</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCACTUAL" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcActual' SIZE=1 >
          <% IF Id_CARcActual = "" OR Id_CARcActual = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
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
     <TR>
      <TD> 
         <B>CARdDatosPersonales</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARDDATOSPERSONALES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARdDatosPersonales' SIZE=1 >
          <% IF Id_CARdDatosPersonales = "" OR Id_CARdDatosPersonales = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARdDatosPersonales")= CINT(Id_CARdDatosPersonales) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARdDatosPersonales")%>'> <%= Ob_RS2("CARdDatosPersonales")%>
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
        <B>Fecha de captura</font>	</B>
      </TD>
      <TD>
 	   <P ALIGN='left'>
       <INPUT TYPE='TEXT' NAME='Fecha_Captura' SIZE=16 MAXLENGTH=16 READONLY VALUE=<%= Fecha_Captura%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_Captura')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
      </TD > 
     </TR>
     <TR>
      <TD> 
         <B>ogin</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCSUBPROCURADURIAS" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1 >
          <% IF Id_CARcSubprocuradurias = "" OR Id_CARcSubprocuradurias = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
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
         <B>user</B>
      </TD>
      <TD>
          <%Sql ="SELECT * FROM CARCDG_O_DELEGACIONES" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1 >
          <% IF Id_CARcDG_o_Delegaciones = "" OR Id_CARcDG_o_Delegaciones = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcDG_o_Delegaciones")= CINT(Id_CARcDG_o_Delegaciones) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_RS2("CARcDG_o_Delegaciones")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_RS2("CARcDG_o_Delegaciones")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
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

  if (FormAltas.Id_CARcEstatusLaboral.value  == 0 )
  {
       alert("EL CAMPO: Id_Estatus, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.FechaInicio.value  == "")
  {
       alert("EL CAMPO: Fecha de Inicio, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.FechaTermino.value  == "")
  {
       alert("EL CAMPO: Fecha de Termino, no puede estar vacio");
       return false;
  }
  
  if (FormAltas.Id_CARdDatosPersonales.value  == 0 )
  {
       alert("EL CAMPO: Id_CARdDatosPersonales, no puede estar vacio");
       return false;
  }
  


}
</script> 

