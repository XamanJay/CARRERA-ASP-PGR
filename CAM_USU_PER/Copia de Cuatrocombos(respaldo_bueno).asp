<!-- #INCLUDE File="Verifica.inc" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.vbs" -->
<!-- #INCLUDE File="INCLUDE/Utilerias.js" -->
<%
'//------------------------ para barrer las variables que llevo---------------JVI

'response.Write "FORMA: "
'response.Write"<br>"
  'for each x in request.Form
  	'response.Write x
	'response.write " = "
	'response.write request.form(x)
	'response.Write"<br>"
  'next
  'response.Write"<br>"
  'response.Write "URL: "
'response.Write"<br>"
  'for each x in request.querystring
  	'response.Write x
	'response.write " = "
	'response.write request.querystring(x)
	'response.Write"<br>"
  'next
'response.end
'**************************************************
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RSV   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "SPGRdFacultad_atraccion"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
	ParamID = request.querystring("ParamID") 
	

    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	
   v_ODBC  = SESSION("VARDNS")	
Ob_Conn.Open v_ODBC

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

<%

'==== Recupera Campos Cuando ya capturaton y despues Modifican COMBOS

SPGRdFacultad_atraccion= REQUEST("SPGRdFacultad_atraccion")
Fecha_acuerdo= REQUEST("Fecha_acuerdo")
Id_SPGRdAveriguacionPrevia= REQUEST("Id_SPGRdAveriguacionPrevia")
 if Id_SPGRdAveriguacionPrevia = "" then Id_SPGRdAveriguacionPrevia = 0 end if
No_Oficio= REQUEST("No_Oficio")
Id_SPGRcSubprocuradurias= REQUEST("Id_SPGRcSubprocuradurias")
 if Id_SPGRcSubprocuradurias = "" then Id_SPGRcSubprocuradurias = 0 end if
Id_SPGRcDelegaciones= REQUEST("Id_SPGRcDelegaciones")
 if Id_SPGRcDelegaciones = "" then Id_SPGRcDelegaciones = 0 end if
Id_SPGRcAgencias= REQUEST("Id_SPGRcAgencias")
 if Id_SPGRcAgencias = "" then Id_SPGRcAgencias = 0 end if
Id_SPGRcMesas= REQUEST("Id_SPGRcMesas")
 if Id_SPGRcMesas = "" then Id_SPGRcMesas = 0 end if
'========== Recarga del Boton ============================
 Edo_Destino=request.querystring("Edo_Destino") 
 FIniAP = REQUEST.QUERYSTRING("FIniAP")
'========== COMBOS ============================
 VCombo4  = Request.querystring("IDCombo4")


response.write VCombo3

'==== caso 2/3
 VCombo1  = Request.querystring("IDCombo1")
 if vcombo = "" then 
    SupInc = Id_SPGRcSubprocuradurias
	DelInc = Id_SPGRcDelegaciones
	AgeInc = Id_SPGRcAgencias
	MesInc = Id_SPGRcMesas
 end if 
 SET Ob_C2  = SERVER.CREATEOBJECT("ADODB.RECORDSET") 

    if VCombo1 = "" then
       vCombo1 = Id_SPGRcSubprocuradurias
    end if
    sqlC2= "SELECT * FROM SPGRcDelegaciones WHERE Id_SPGRcSubprocuradurias = "+CSTR(vCombo1)+ "or Id_SPGRcSubprocuradurias = 0 order by SPGRcDelegaciones" 
    Ob_C2.open sqlC2, Ob_Conn
    C2_EOF = Ob_C2.EOF 

'====== caso 2/2 3/3

 VCombo2  = Request.querystring("IDCombo2")
 SET Ob_C3  = SERVER.CREATEOBJECT("ADODB.RECORDSET") ' agregado
   if VCombo2 = "" then
      vCombo2 = Id_SPGRcDelegaciones
   end if
   sqlC3= "SELECT * FROM SPGRcAgencias WHERE Id_SPGRcDelegaciones = "+CSTR(vCombo2) + "or Id_SPGRcDelegaciones = 0 order by SPGRcAgencias"
   Ob_C3.open sqlC3, Ob_Conn
   C3_EOF = Ob_C3.EOF 

'====== caso 3/3 4/4

 VCombo3  = Request("IDCombo3")
 SET Ob_C4  = SERVER.CREATEOBJECT("ADODB.RECORDSET") ' agregado
   if VCombo3 = "" then
      vCombo3 = Id_SPGRcAgencias
   end if
  sqlC4 = "SELECT * FROM SPGRcMesas WHERE Id_SPGRcAgencias = "+CSTR(VCombo3)+" order by SPGRcMesas "
  Ob_C4.open sqlC4, Ob_Conn
   C4_EOF = Ob_C4.EOF 

%>

<script LANGUAGE="JavaScript">

	function Refresca_Combo1()
	{
	  var VArC0= document.FormAltas.elements["AnioAP_Reasignada"].value
	  var VarId= document.FormAltas.elements["ParamID"].value
      var VarC1= document.FormAltas.elements["SPGRdFacultad_atraccion"].value
      var VarC2= document.FormAltas.elements["Fecha_acuerdo"].value
      var VarC3= document.FormAltas.elements["Id_SPGRdAveriguacionPrevia"].value
      /*var VarC4= document.FormAltas.elements["No_Oficio"].value*/
      var VarC5= document.FormAltas.elements["Id_SPGRcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_SPGRcDelegaciones"].value
      var VarC7= document.FormAltas.elements["Id_SPGRcAgencias"].value
      var VarC8= document.FormAltas.elements["Id_SPGRcMesas"].value
	//================ RECARGA DE BOTON ===================
	  var Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'
      /*var VarC9= document.FormAltas.elements["Id_SPGRcUsuarios"].value
      var VarC10= document.FormAltas.elements["IdSPGRcResponsable"].value
      var VarC11= document.FormAltas.elements["Id_SPGRcLey"].value
      var VarC12= document.FormAltas.elements["Id_SPGRcDelitos"].value
       var VarC13= document.FormAltas.elements["Id_SPGRcModalidad_delitos"].value
     var VarC14= document.FormAltas.elements["Desc_Modalidad"].value
      var VarC15= document.FormAltas.elements["Id_SPGRdRespuestas_consultas"].value*/
    /* var VarC16= document.FormAltas.elements["Subprocuraduria_atrayente"].value*/
     /* var VarC17= document.FormAltas.elements["Delegacion_atrayente"].value*/
      /* var VarC18= document.FormAltas.elements["Agencia_atrayente"].value*/
	var IDCombo1 = document.FormAltas.Id_SPGRcSubprocuradurias.options(document.FormAltas.Id_SPGRcSubprocuradurias.selectedIndex).value
	var IDCombo2 = "0"
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	//document.location="Altas_SPGRdFacultad_atraccion.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3 +"&Id_SPGRcSubprocuradurias="+VarC5 + "&Id_SPGRcDelegaciones="+VarC6 + "&Id_SPGRcAgencias="+VarC7
	document.location="Altas_SPGRdFacultad_atraccion.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 +"&IDCombo4=" + IDCombo4 +  "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3 +"&Id_SPGRcSubprocuradurias="+VarC5+"&Id_SPGRcDelegaciones="+VarC6 + "&Id_SPGRcAgencias="+VarC7+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0
	}
	function Refresca_Combo2()
	{
	  var VArC0= document.FormAltas.elements["AnioAP_Reasignada"].value	
	  var VarId= document.FormAltas.elements["ParamID"].value
      var VarC1= document.FormAltas.elements["SPGRdFacultad_atraccion"].value
      var VarC2= document.FormAltas.elements["Fecha_acuerdo"].value
      var VarC3= document.FormAltas.elements["Id_SPGRdAveriguacionPrevia"].value
      /*var VarC4= document.FormAltas.elements["No_Oficio"].value*/
      var VarC5= document.FormAltas.elements["Id_SPGRcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_SPGRcDelegaciones"].value
      var VarC7= document.FormAltas.elements["Id_SPGRcAgencias"].value
      var VarC8= document.FormAltas.elements["Id_SPGRcMesas"].value
	//======================== RECERGA DE MI BOTON ===================
	  var Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
  	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'
      /*var VarC9= document.FormAltas.elements["Id_SPGRcUsuarios"].value
      var VarC10= document.FormAltas.elements["IdSPGRcResponsable"].value
      var VarC11= document.FormAltas.elements["Id_SPGRcLey"].value
      var VarC12= document.FormAltas.elements["Id_SPGRcDelitos"].value
      var VarC13= document.FormAltas.elements["Id_SPGRcModalidad_delitos"].value
      var VarC14= document.FormAltas.elements["Desc_Modalidad"].value
      var VarC15= document.FormAltas.elements["Id_SPGRdRespuestas_consultas"].value*/
      /*var VarC16= document.FormAltas.elements["Subprocuraduria_atrayente"].value*/
     /* var VarC17= document.FormAltas.elements["Delegacion_atrayente"].value*/
     /* var VarC18= document.FormAltas.elements["Agencia_atrayente"].value*/

	var IDCombo1 = document.FormAltas.Id_SPGRcSubprocuradurias.options(document.FormAltas.Id_SPGRcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_SPGRcDelegaciones.options(document.FormAltas.Id_SPGRcDelegaciones.selectedIndex).value
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="Altas_SPGRdFacultad_atraccion.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4 + "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3+"&Id_SPGRcSubprocuradurias="+VarC5 + "&Id_SPGRcDelegaciones="+VarC6 + "&Id_SPGRcAgencias="+VarC7+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0
	}
	
		function Refresca_Combo3()
	{
	  var VArC0= document.FormAltas.elements["AnioAP_Reasignada"].value	
	  var VarId= document.FormAltas.elements["ParamID"].value
      var VarC1= document.FormAltas.elements["SPGRdFacultad_atraccion"].value
      var VarC2= document.FormAltas.elements["Fecha_acuerdo"].value
      var VarC3= document.FormAltas.elements["Id_SPGRdAveriguacionPrevia"].value
      /*var VarC4= document.FormAltas.elements["No_Oficio"].value*/
      var VarC5= document.FormAltas.elements["Id_SPGRcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_SPGRcDelegaciones"].value
      var VarC7= document.FormAltas.elements["Id_SPGRcAgencias"].value
      var VarC8= document.FormAltas.elements["Id_SPGRcMesas"].value
	  	//=====================  RECARGA DE MI BOTON ======================
	  var  Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'
      /*var VarC9= document.FormAltas.elements["Id_SPGRcUsuarios"].value
      var VarC10= document.FormAltas.elements["IdSPGRcResponsable"].value
      var VarC11= document.FormAltas.elements["Id_SPGRcLey"].value
      var VarC12= document.FormAltas.elements["Id_SPGRcDelitos"].value
      var VarC13= document.FormAltas.elements["Id_SPGRcModalidad_delitos"].value
      var VarC14= document.FormAltas.elements["Desc_Modalidad"].value
      var VarC15= document.FormAltas.elements["Id_SPGRdRespuestas_consultas"].value*/
      /*var VarC16= document.FormAltas.elements["Subprocuraduria_atrayente"].value*/
     /* var VarC17= document.FormAltas.elements["Delegacion_atrayente"].value*/
     /* var VarC18= document.FormAltas.elements["Agencia_atrayente"].value*/

	var IDCombo1 = document.FormAltas.Id_SPGRcSubprocuradurias.options(document.FormAltas.Id_SPGRcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_SPGRcDelegaciones.options(document.FormAltas.Id_SPGRcDelegaciones.selectedIndex).value
	var IDCombo3 = document.FormAltas.Id_SPGRcAgencias.options(document.FormAltas.Id_SPGRcAgencias.selectedIndex).value
	var IDCombo4 = "0"
	document.location="Altas_SPGRdFacultad_atraccion.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4 + "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3+"&Id_SPGRcSubprocuradurias="+VarC5+"&Id_SPGRcSubprocuradurias="+VarC5 + "&Id_SPGRcDelegaciones="+VarC6 + "&Id_SPGRcAgencias="+VarC7 + "&Id_SPGRcMesas="+VarC8+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0     
	}
	
	
	
</script>




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
<!-- #INCLUDE File="Encabezado.inc" -->

  <FORM METHOD="post" ACTION= "Altas_SPGRdFacultad_atraccion.asp?Edo_Destino=<%=Request.QueryString("Edo_Destino")%>" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">
     
       
  <CENTER>
   <HR width=40%>
    <H2> 
     <FONT COLOR= #3366CC>Despacho por Reasignación</FONT>
    </H2>
   <HR WIDTH=40%>
  </CENTER>


  
 <!--- insertar resultado de  LOOP ----------------------------------------------------------------------------------------- --->

    <% 
     vAgregar = request("Agregar") 
     if vAgregar = "S" then  
	 '//------------------------ para barrer las variables que llevo---------------

response.Write "FORMA: "
response.Write"<br>"
  for each x in request.Form
  	response.Write x
	response.write " = "
	response.write request.form(x)
	response.Write"<br>"
  next
  response.Write"<br>"
  response.Write "URL: "
response.Write"<br>"
  for each x in request.querystring
  	response.Write x
	response.write " = "
	response.write request.querystring(x)
	response.Write"<br>"
  next
'response.end
'**************************************************

	No_Oficio = ucase(request("SPGRdFacultad_atraccion"))
	Fecha_acuerdo = cdateformat(request ("Fecha_acuerdo"),9)
	Id_SPGRdAveriguacionPrevia = request("Id_SPGRdAveriguacionPrevia")
	'Id_SPGRdRespuestas_consultas = request("Id_SPGRdRespuestas_consultas")
	Id_SPGRcSubprocuradurias_Atray =request("Id_SPGRcSubprocuradurias")
	Id_SPGRcDelegaciones_Atray =request("Id_SPGRcDelegaciones")
	Id_SPGRcAgencias_Atray =request("Id_SPGRcAgencias") 
	Id_SPGRcMesas_Atray = request("Id_SPGRcMesas")
	Num_AP = request("AP_Reasignada")
	FIniAP = cdateformat(request ("FIniAP"),9)
	AnioAp  = request("AnioAP_Reasignada")

    	   Ob_RS.Addnew 
        if request("SPGRdFacultad_atraccion") <> "" then  Ob_RS("SPGRdFacultad_atraccion")=ucase(request("SPGRdFacultad_atraccion")) end if
        if request("Fecha_acuerdo")  <> "" then  Ob_RS("Fecha_acuerdo")=cDateFormat(request("Fecha_acuerdo"),9) end if

        if request("Id_SPGRdAveriguacionPrevia")  <> "" then  Ob_RS("Id_SPGRdAveriguacionPrevia")=request("Id_SPGRdAveriguacionPrevia") end if
        if request("AP_Reasignada")  <> "" then  Ob_RS("AP_Reasignada")=request("AP_Reasignada") end if
        if request("AnioAP_Reasignada")  <> "" then  Ob_RS("AnioAP_Reasignada")=request("AnioAP_Reasignada") end if
     
        Ob_RS("Id_SPGRcSubprocuradurias")= Session("UserSub")
        Ob_RS("Id_SPGRcDelegaciones")    = Session("UserDel")
        Ob_RS("Id_SPGRcAgencias")        = Session("UserAgen") 
        Ob_RS("Id_SPGRcMesas")           = Session("UserMesa")
        Ob_RS("Id_SPGRcUsuarios")        = Session("IdUsuario")
        Ob_RS("IdSPGRcResponsable")      = Session("IdResponsable")
      
        if request("Id_SPGRcSubprocuradurias")  <> "" then  Ob_RS("Subprocuraduria_atrayente")=request("Id_SPGRcSubprocuradurias") end if
        if request("Id_SPGRcDelegaciones")  <> "" then  Ob_RS("Delegacion_atrayente")=request("Id_SPGRcDelegaciones") end if
        if request("Id_SPGRcAgencias")  <> "" then  Ob_RS("Agencia_atrayente")=request("Id_SPGRcAgencias") end if
        if request("Id_SPGRcMesas")  <> "" then  Ob_RS("Mesa_atrayente")=request("Id_SPGRcMesas") end if
        
        
        Ob_RS.update
		'--------------------------------- duplica expediente -------------------------
par_usu = 0
par_resp = 0
 	Set Ob_RS_dupli = Server.CreateObject("ADODB.RecordSet")
	 var_sp = "exec SP_TP_CopiaExpediente_reasignacion_AP " & Id_SPGRdAveriguacionPrevia & ", '" & Num_AP &_
			  "', '" & FIniAP  &"', '"&AnioAp &"'" &_
			  ", " & Id_SPGRcSubprocuradurias_Atray & ", " & Id_SPGRcDelegaciones_Atray & ", " & Id_SPGRcAgencias_Atray & ", " & Id_SPGRcMesas_Atray &_
			  ", " & par_usu & ", " & par_resp
	Ob_RS_dupli.Open var_sp, Ob_Conn
	Set Ob_RS_dupli = Nothing

'------------------------------------------------------------------------------	

        response.clear
		%>
		<SCRIPT>
	
		  var res = confirm("El registro reasignado ya ha sido Agregado. Desea Agregar otro Registro?") 
			if (res)
			{
				var Edo_Destino = '<%=request.querystring("Edo_Destino")%>'
				var TITULO = "Búsqueda de APs para el registro del despacho por reasignación"
				var A="SPGRdFacultad_atraccion"
				
				document.location="Consultas_SPGRdAveriguacionPrevia.asp?Edo_Destino="+Edo_Destino+"&TITULO="+TITULO+"&A="+A
			}
			else
			{
	            document.location="SUS_S_4.asp"
			}           
		</SCRIPT>		

		<%
        response.end
     	end if
    	%>
 <Center>
    <TABLE  border='0'   ID='AutoNumber1' HEIGHT='280' width="429">
      <TR>
      <TD height="5" width="221"> 
	  
	  <!--- ---JVI-------------------------------------------------------------------------->
	   <!--- ----------------------------------------------------------------------------->

	<%
	Sql =" SELECT * FROM SPGRDAVERIGUACIONPREVIA WHERE Id_SPGRdAveriguacionPrevia = " + ParamId 
	Ob_RS2.OPEN Sql, Ob_Conn 
		if REQUEST.QUERYSTRING("FIniAP") = "01/01/1900" then
			FIniAP = REQUEST.QUERYSTRING("FIniAP")
			AnioAp = Ob_RS2("Anio_EA")
		else
		   FIniAP = REQUEST.QUERYSTRING("FIniAP")
		   AnioAP = Year(FIniAP)
		end if
	%>
         
         <B>No de Averiguación Previa</B>:<BR>
      </TD>
      <TD height="5" width="198">
	    <%Id_AP=Ob_RS2("Id_SPGRdAveriguacionPrevia")%>
	    <%Num_AP=Ob_RS2("SPGRdAveriguacionPrevia")%>
		<b><%=Num_AP%></b>	
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
        <TD height="29" width="221"><B>A&ntilde;o:</B></TD>
        <TD height="29" width="198"><b><%=AnioAp%></b></TD>
     </TR>
 
     <TR>
        <TD height="32" width="221"> Número de oficio: </font> </TD>
        <TD height="32" width="198"> 
          <P ALIGN='left'>
       <!--<TEXTAREA NAME='SPGRdFacultad_atraccion' SIZE=10 ROWS=5 COLS=35><%'=SPGRdFacultad_atraccion%></TEXTAREA>-->
	   <input name="SPGRdFacultad_atraccion" type="text" style="text-transform: uppercase" value="<%=SPGRdFacultad_atraccion%>" size="20">
  	</TD > 
     <TR>
      <TD height="1" width="221">
        Fecha de acuerdo:</font>
      </TD>
      <TD height="1" width="198">
 	   <INPUT TYPE='TEXT' NAME='Fecha_acuerdo' SIZE=16 MAXLENGTH=16  VALUE=<%= Fecha_acuerdo%> >
       <IMG ONCLICK="window_open('FormAltas','Fecha_acuerdo')" border='0' src="Calendario.gif" WIDTH='32' HEIGHT='34'>
       <%	 ' ------------- 1. Inicio  03/03/2005 -------------------
	 ' Genere hasta arriba un recordset denominado Ob_RSVs
	 VAR_PAR_IdAP = request.querystring("ParamId")
	 
	 sqlVal = "SELECT Id_SPGRdAveriguacionPrevia, Fecha_respuesta " 
	 sqlVal = sqlVal + "from SPGRDRESPUESTAS_CONSULTAS "
	 sqlVal = sqlVal + "where Id_SPGRdAveriguacionPrevia="& VAR_PAR_IdAP
	 
	Ob_RSV.open sqlVal, Ob_Conn

	if Not Ob_RSV.EoF then
 		FR = Ob_RSV("Fecha_respuesta")
		FReC4= Day(FR) & "/" & Month(FR) & "/" & Year(FR)
	end if		
	'response.end
	'------------- 1. Fin  03/03/2005 ------------------- 
	%>		

     </TD > 
   
     <TR>
        <TD height="30" width="221"> 
          <%Sql ="SELECT * FROM SPGRCSUBPROCURADURIAS order by SPGRcSubprocuradurias" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          Subprocuraduría atrayente: </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_SPGRcSubprocuradurias' SIZE=1 onchange='Refresca_Combo1()'>
	   		 
	         <%DO UNTIL Ob_RS2.Eof%>
                <% IF Ob_RS2("Id_SPGRcSubprocuradurias")= CLNG(VCombo1) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_SPGRcSubprocuradurias")%>'> <%= Ob_RS2("SPGRcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_SPGRcSubprocuradurias")%>'> <%= Ob_RS2("SPGRcSubprocuradurias")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
        <TD height="30" width="221"> Delegación atrayente: </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_SPGRcDelegaciones' SIZE=1 onchange='Refresca_Combo2()'>
	  		 
	         <%DO UNTIL Ob_C2.Eof%>
                <% IF Ob_C2("Id_SPGRcDelegaciones")= CLNG(VCombo2) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C2("Id_SPGRcDelegaciones")%>'> <%= Ob_C2("SPGRcDelegaciones")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C2("Id_SPGRcDelegaciones")%>'> <%= Ob_C2("SPGRcDelegaciones")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_C2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_C2.CLOSE%>
     </TR>

     <TR>
        <TD height="30" width="221"> Agencia atrayente: </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_SPGRcAgencias' SIZE=1 onchange='Refresca_Combo3()'>
	   
	         <%DO UNTIL Ob_C3.Eof%>
                <% IF Ob_C3("Id_SPGRcAgencias")= CLNG(VCombo3) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C3("Id_SPGRcAgencias")%>'> <%= Ob_C3("SPGRcAgencias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C3("Id_SPGRcAgencias")%>'> <%= Ob_C3("SPGRcAgencias")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_C3.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
     
     
    <% Ob_C3.CLOSE%>
     </TR>
     
          <TR>
      <TD height="23" width="221"> 
         Mesa atrayente:
      </TD>
      <TD height="23" width="198">
       <SELECT NAME='Id_SPGRcMesas' SIZE=1 >
	   
	         <%DO UNTIL Ob_C4.Eof%>
                <% IF Ob_C4("Id_SPGRcMesas")= CLNG(VCombo4) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C4("Id_SPGRcMesas")%>'> <%= Ob_C4("SPGRcMesas")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C4("Id_SPGRcMesas")%>'> <%= Ob_C4("SPGRcMesas")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_C4.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
      
      
    <% 
   Ob_C4.CLOSE
   %>
     </TR>
        
 </TABLE>
 </Center>



  <%
'=====FIN LOOP ===================================================================================
%>
  <!--- Paso de parámetros (Tabla y ODBC seleccionados) --->
  <% 'ParamId = request.querystring("ParamId") %>
  <input type="Hidden" name=tabla_original value = <%= v_Tabla%> >
  <INPUT TYPE="Hidden" NAME=ODBC Value = <%= v_ODBC%> >
<INPUT TYPE="Hidden" NAME=catalogo Value = <%= pagina_catalogo%> >
<INPUT TYPE="Hidden" NAME=ID Value = <%= v_ID%> >
<INPUT TYPE="Hidden" NAME=ParamID Value = <%= ParamID%> >

<INPUT TYPE="Hidden" NAME=Id_SPGRdAveriguacionPrevia Value = <%= Id_AP%> >
<INPUT TYPE="Hidden" NAME=AP_Reasignada Value = <%=Num_AP%> >
<INPUT TYPE="Hidden" NAME=AnioAP_Reasignada Value = <%=AnioAP%> >
<INPUT TYPE="Hidden" NAME=FIniAP Value = <%=FIniAP%> >

  <% Ob_Rs.CLOSE %>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" <%=sBtnHab%> VALUE="Enviar" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>



  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>
  </FORM>
 </BODY>

</HTML>

<script Language="JavaScript"> 
function ValidaCampos()
{

	if (document.FormAltas.SPGRdFacultad_atraccion.value == '')
		{alert ("El Número de oficio no puede enviarse vacio");
		return false;}
		
	var Facultad_atraccion = FormAltas.SPGRdFacultad_atraccion.value.search("[^A-Za-z0-9ÁÉÍÓÚáéíóúÑñÜü¡!¿?#$%&/()=*+,-.:;<>@\^_{}~ ]"); 
	if (FormAltas.SPGRdFacultad_atraccion.value.length > 0 &&  Facultad_atraccion >= 0) 
		{ alert("El Número de Oficio no debe contener caracteres especiales")
		return false;} 				
		
   //  AQUI COMPARE LA FECHA DE INICIO DE LA AP CONTRA LA FECHA ACTUAL
	if (esVacio(FormAltas.Fecha_acuerdo.value))
		{alert("La Fecha del Acuerdo no debe ser vacío");
		return false;}
	
	if (!esFecha(FormAltas.Fecha_acuerdo.value,'E'))
		{alert("Introduce el formato dd/mm/aaaa");
		return false;}
	
	var sFechaAct = '<%=Day(Date)%>/<%=Month(Date)%>/<%=Year(Date)%>'

	if (!comparaFechas(FormAltas.Fecha_acuerdo.value,'menor_igual',sFechaAct,0))
		{alert("La Fecha del Acuerdo no puede ser mayor a la Fecha Actual")
		return false;}

    //  AQUI COMPARE LA FECHA DE DESPACHO DE LA AP CONTRA LA FECHA DE INICIO DE LA AC
	
	<% if  FReC4 <> "" then %>	
		if (!comparaFechas('<%=FReC4%>','menor_igual',FormAltas.Fecha_acuerdo.value,0))
			{alert("La Fecha del Acuerdo no puede ser menor a la Fecha de Solicitud: "+'<%=FReC2%>')
			return false;}
	<% else %>
		if (!comparaFechas('<%=REQUEST.QUERYSTRING("FIniAP")%>','menor_igual',FormAltas.Fecha_acuerdo.value,0))
			{alert("La Fecha del Acuerdo no puede ser menor a la Fecha de Inicio de la AP: "+'<%=REQUEST.QUERYSTRING("FIniAP")%>')
			return false;}
	<% end if %>

	if (document.FormAltas.Id_SPGRcSubprocuradurias.value == 0)
		{alert("Seleccione una Subprocuraduria atrayente");
		return false;}

	if (document.FormAltas.Id_SPGRcDelegaciones.value == 0)
		{alert("Seleccione una Delegación atrayente");
		return false;}

	if (document.FormAltas.Id_SPGRcAgencias.value == 0)
		{alert("Seleccione una Agencia atrayente");
		return false;}
		
	if (document.FormAltas.Id_SPGRcMesas.value == 0)
		{alert("Seleccione una Mesa atrayente");
		return false;}
		
	FormAltas.B1.disabled = true	
 	document.FormAltas.submit();
  
 }
     </script>     