<%
'//-----------------------------------JVI


'**************************************************
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RSV   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcUSR"
    v_Tabla = UCase(TRIM(v_TABLA))
    v_ODBC  = SESSION("ODBC")
	ParamID = request.querystring("ParamID") 
	

    ruta = Server.MapPath(Request.ServerVariables("PATH_INFO"))
    pos = InStrRev(ruta, "\") +1 
    Nombre_Archivo_Original = MID(ruta, pos)

     if Session("Contador")<>0 then

		 b= Session("Elementos")(Session("Contador"))
		
	end if
	''''   CONECCION
   
   
      Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ V_ODBC +";UID="+ Session("UserID") +";PWD="+ Session("Password")

    ''''   CONECCION
	
   consulta = "SELECT * FROM " + v_Tabla
   Ob_RS.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = Ob_RS.FIELDS.COUNT

  
'========== Combos
%>

<%

'==== Recupera Campos Cuando ya capturaton y despues Modifican COMBOS

SPGRdFacultad_atraccion= REQUEST("SPGRdFacultad_atraccion")
Fecha_acuerdo= REQUEST("Fecha_acuerdo")
Id_SPGRdAveriguacionPrevia= REQUEST("Id_SPGRdAveriguacionPrevia")
 if Id_SPGRdAveriguacionPrevia = "" then Id_SPGRdAveriguacionPrevia = 0 end if
No_Oficio= REQUEST("No_Oficio")
Id_CARcSubprocuradurias= REQUEST("Id_CARcSubprocuradurias")
 if Id_CARcSubprocuradurias = "" then Id_CARcSubprocuradurias = 0 end if
Id_CARcDG_o_Delegaciones= REQUEST("Id_CARcDG_o_Delegaciones")
 if Id_CARcDG_o_Delegaciones = "" then Id_CARcDG_o_Delegaciones = 0 end if
Id_CARcDir_o_subsede= REQUEST("Id_CARcDir_o_subsede")
 if Id_CARcDir_o_subsede = "" then Id_CARcDir_o_subsede = 0 end if
Id_CARcUSR= REQUEST("Id_CARcUSR")
 if Id_CARcUSR = "" then Id_CARcUSR = 0 end if
'========== Recarga del Boton ============================
 Edo_Destino=request.querystring("Edo_Destino") 
 FIniAP = REQUEST.QUERYSTRING("FIniAP")
'========== COMBOS ============================
 VCombo4  = Request.querystring("IDCombo4")


response.write VCombo3

'==== caso 2/3
 VCombo1  = Request.querystring("IDCombo1")
 if vcombo = "" then 
    SupInc = Id_CARcSubprocuradurias
	DelInc = Id_CARcDG_o_Delegaciones
	AgeInc = Id_CARcDir_o_subsede
	MesInc = Id_CARcUSR
 end if 
 SET Ob_C2  = SERVER.CREATEOBJECT("ADODB.RECORDSET") 

    if VCombo1 = "" then
       vCombo1 = Id_CARcSubprocuradurias
    end if
    sqlC2= "SELECT * FROM CARcDG_o_Delegaciones WHERE Id_CARcSubprocuradurias = "+CSTR(vCombo1)+ "or Id_CARcSubprocuradurias = 0 order by CARcDG_o_Delegaciones" 
    Ob_C2.open sqlC2, Ob_Conn
    C2_EOF = Ob_C2.EOF 

'====== caso 2/2 3/3

 VCombo2  = Request.querystring("IDCombo2")
 SET Ob_C3  = SERVER.CREATEOBJECT("ADODB.RECORDSET") ' agregado
   if VCombo2 = "" then
      vCombo2 = Id_CARcDG_o_Delegaciones
   end if
   sqlC3= "SELECT * FROM CARcDir_o_subsede WHERE Id_CARcDG_o_Delegaciones = "+CSTR(vCombo2) + "or Id_CARcDG_o_Delegaciones = 0 order by CARcDir_o_subsede"
   Ob_C3.open sqlC3, Ob_Conn
   C3_EOF = Ob_C3.EOF 

'====== caso 3/3 4/4

 VCombo3  = Request("IDCombo3")
 SET Ob_C4  = SERVER.CREATEOBJECT("ADODB.RECORDSET") ' agregado
   if VCombo3 = "" then
      vCombo3 = Id_CARcDir_o_subsede
   end if
  sqlC4 = "SELECT * FROM CARcUSR WHERE Id_CARcDir_o_subsede = "+CSTR(VCombo3)+" order by CARcUSR "
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
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	//================ RECARGA DE BOTON ===================
	  var Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'
	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = "0"
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 +"&IDCombo4=" + IDCombo4 +  "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3 +"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0
	}
	
	function Refresca_Combo2()
	
	{
	  var VArC0= document.FormAltas.elements["AnioAP_Reasignada"].value	
	  var VarId= document.FormAltas.elements["ParamID"].value
      var VarC1= document.FormAltas.elements["SPGRdFacultad_atraccion"].value
      var VarC2= document.FormAltas.elements["Fecha_acuerdo"].value
      var VarC3= document.FormAltas.elements["Id_SPGRdAveriguacionPrevia"].value
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	//======================== RECERGA DE MI BOTON ===================
	  var Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
  	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'

	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_CARcDG_o_Delegaciones.options(document.FormAltas.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4 + "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3+"&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0
	}
	
		function Refresca_Combo3()
	{
	  var VArC0= document.FormAltas.elements["AnioAP_Reasignada"].value	
	  var VarId= document.FormAltas.elements["ParamID"].value
      var VarC1= document.FormAltas.elements["SPGRdFacultad_atraccion"].value
      var VarC2= document.FormAltas.elements["Fecha_acuerdo"].value
      var VarC3= document.FormAltas.elements["Id_SPGRdAveriguacionPrevia"].value
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	  	//=====================  RECARGA DE MI BOTON ======================
	  var  Edo_Destino = '<%=request.QueryString("Edo_Destino")%>'
	  var FIniAP = '<%=REQUEST.QUERYSTRING("FIniAP")%>'

	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_CARcDG_o_Delegaciones.options(document.FormAltas.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = document.FormAltas.Id_CARcDir_o_subsede.options(document.FormAltas.Id_CARcDir_o_subsede.selectedIndex).value
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&ParamID="+VarId+"&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4 + "&SPGRdFacultad_atraccion="+VarC1 + "&Fecha_acuerdo="+VarC2 + "&Id_SPGRdAveriguacionPrevia="+VarC3+"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7 + "&Id_CARcUSR="+VarC8+"&Edo_Destino="+Edo_Destino+"&FIniAP="+FIniAP+"&AnioAP_Reasignada="+ VArC0     
	}
	
	
	
</script>




<% '========== Inicia HTML %>


<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css"> <HEAD>  <TITLE>   Cambios de Usuario  </TITLE> </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">


  <FORM METHOD="post" ACTION= "cam_usu.asp?Edo_Destino=<%=Request.QueryString("Edo_Destino")%>" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">
     
       
  <CENTER>
   <HR >
    <H2> 
     <FONT COLOR= #3366CC>Cambios de Usuarios </FONT>
    </H2>
    <HR >
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
	Id_CARcSubprocuradurias_Atray =request("Id_CARcSubprocuradurias")
	Id_CARcDG_o_Delegaciones_Atray =request("Id_CARcDG_o_Delegaciones")
	Id_CARcDir_o_subsede_Atray =request("Id_CARcDir_o_subsede") 
	Id_CARcUSR_Atray = request("Id_CARcUSR")
	Num_AP = request("AP_Reasignada")
	FIniAP = cdateformat(request ("FIniAP"),9)
	AnioAp  = request("AnioAP_Reasignada")

    	   Ob_RS.Addnew 
        if request("SPGRdFacultad_atraccion") <> "" then  Ob_RS("SPGRdFacultad_atraccion")=ucase(request("SPGRdFacultad_atraccion")) end if
        if request("Fecha_acuerdo")  <> "" then  Ob_RS("Fecha_acuerdo")=cDateFormat(request("Fecha_acuerdo"),9) end if

        if request("Id_SPGRdAveriguacionPrevia")  <> "" then  Ob_RS("Id_SPGRdAveriguacionPrevia")=request("Id_SPGRdAveriguacionPrevia") end if
        if request("AP_Reasignada")  <> "" then  Ob_RS("AP_Reasignada")=request("AP_Reasignada") end if
        if request("AnioAP_Reasignada")  <> "" then  Ob_RS("AnioAP_Reasignada")=request("AnioAP_Reasignada") end if
     
        Ob_RS("Id_CARcSubprocuradurias")= Session("UserSub")
        Ob_RS("Id_CARcDG_o_Delegaciones")    = Session("UserDel")
        Ob_RS("Id_CARcDir_o_subsede")        = Session("UserAgen") 
        Ob_RS("Id_CARcUSR")           = Session("UserMesa")
        Ob_RS("Id_SPGRcUsuarios")        = Session("IdUsuario")
        Ob_RS("IdSPGRcResponsable")      = Session("IdResponsable")
      
        if request("Id_CARcSubprocuradurias")  <> "" then  Ob_RS("Subprocuraduria_atrayente")=request("Id_CARcSubprocuradurias") end if
        if request("Id_CARcDG_o_Delegaciones")  <> "" then  Ob_RS("Delegacion_atrayente")=request("Id_CARcDG_o_Delegaciones") end if
        if request("Id_CARcDir_o_subsede")  <> "" then  Ob_RS("Agencia_atrayente")=request("Id_CARcDir_o_subsede") end if
        if request("Id_CARcUSR")  <> "" then  Ob_RS("Mesa_atrayente")=request("Id_CARcUSR") end if
        
        
        Ob_RS.update
		'--------------------------------- duplica expediente -------------------------
par_usu = 0
par_resp = 0
 	Set Ob_RS_dupli = Server.CreateObject("ADODB.RecordSet")
	 var_sp = "exec SP_TP_CopiaExpediente_reasignacion_AP " & Id_SPGRdAveriguacionPrevia & ", '" & Num_AP &_
			  "', '" & FIniAP  &"', '"&AnioAp &"'" &_
			  ", " & Id_CARcSubprocuradurias_Atray & ", " & Id_CARcDG_o_Delegaciones_Atray & ", " & Id_CARcDir_o_subsede_Atray & ", " & Id_CARcUSR_Atray &_
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
 <!--- ---JVI-------------------------------------------------------------------------->
	   <!--- ----------------------------------------------------------------------------->

    <TABLE  border='0'   ID='AutoNumber1' HEIGHT='154' width="429">
     <TR>
        <TD height="29" width="221"></TD>
        <TD height="29" width="198"></TD>
     </TR><TR>
        <TD height="30" width="221"> 
          <%Sql ="SELECT * FROM CARcSubprocuradurias order by CARcSubprocuradurias" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          Subprocuraduría u homologa: </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1 onchange='Refresca_Combo1()'>
	   		 
	         <%DO UNTIL Ob_RS2.Eof%>
                <% IF Ob_RS2("Id_CARcSubprocuradurias")= CLNG(VCombo1) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcSubprocuradurias")%>'> <%= Ob_RS2("CARcSubprocuradurias")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_RS2.CLOSE%>
     </TR>
     <TR>
        <TD height="30" width="221">Dirección General o Delegación : </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1 onchange='Refresca_Combo2()'>
	  		 
	         <%DO UNTIL Ob_C2.Eof%>
                <% IF Ob_C2("Id_CARcDG_o_Delegaciones")= CLNG(VCombo2) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_C2("CARcDG_o_Delegaciones")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C2("Id_CARcDG_o_Delegaciones")%>'> <%= Ob_C2("CARcDG_o_Delegaciones")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_C2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
      </TD>
    <% Ob_C2.CLOSE%>
     </TR>

     <TR>
        <TD height="30" width="221"> Dirección o Subsede : </TD>
        <TD height="30" width="198"> 
          <SELECT NAME='Id_CARcDir_o_subsede' SIZE=1 onchange='Refresca_Combo3()'>
	   
	         <%DO UNTIL Ob_C3.Eof%>
                <% IF Ob_C3("Id_CARcDir_o_subsede")= CLNG(VCombo3) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C3("Id_CARcDir_o_subsede")%>'> <%= Ob_C3("CARcDir_o_subsede")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C3("Id_CARcDir_o_subsede")%>'> <%= Ob_C3("CARcDir_o_subsede")%>
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
         Usuario :
      </TD>
      <TD height="23" width="198">
       <SELECT NAME='Id_CARcUSR' SIZE=1 >
	   
	         <%DO UNTIL Ob_C4.Eof%>
                <% IF Ob_C4("Id_CARcUSR")= CLNG(VCombo4) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_C4("Id_CARcUSR")%>'> <%= Ob_C4("CARcUSR")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_C4("Id_CARcUSR")%>'> <%= Ob_C4("CARcUSR")%>
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

