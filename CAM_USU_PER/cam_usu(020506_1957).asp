<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

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
'==== Recupera Campos Cuando ya capturaton y despues Modifican COMBOS

Id_CARcSubprocuradurias= REQUEST("Id_CARcSubprocuradurias")
 if Id_CARcSubprocuradurias = "" then Id_CARcSubprocuradurias = 0 end if
Id_CARcDG_o_Delegaciones= REQUEST("Id_CARcDG_o_Delegaciones")
 if Id_CARcDG_o_Delegaciones = "" then Id_CARcDG_o_Delegaciones = 0 end if
Id_CARcDir_o_subsede= REQUEST("Id_CARcDir_o_subsede")
 if Id_CARcDir_o_subsede = "" then Id_CARcDir_o_subsede = 0 end if
Id_CARcUSR= REQUEST("Id_CARcUSR")
 if Id_CARcUSR = "" then Id_CARcUSR = 0 end if
'========== Recarga del Boton ============================
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
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	//================ RECARGA DE BOTON ===================
	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = "0"
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 +"&IDCombo4=" + IDCombo4  +"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7
	}
	
	function Refresca_Combo2()
	
	{
	  
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	//======================== RECERGA DE MI BOTON ===================

	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_CARcDG_o_Delegaciones.options(document.FormAltas.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4   +"&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7
	}
	
		function Refresca_Combo3()
	{
      var VarC5= document.FormAltas.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.FormAltas.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.FormAltas.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.FormAltas.elements["Id_CARcUSR"].value
	  	//=====================  RECARGA DE MI BOTON ======================

	var IDCombo1 = document.FormAltas.Id_CARcSubprocuradurias.options(document.FormAltas.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.FormAltas.Id_CARcDG_o_Delegaciones.options(document.FormAltas.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = document.FormAltas.Id_CARcDir_o_subsede.options(document.FormAltas.Id_CARcDir_o_subsede.selectedIndex).value
	var IDCombo4 = "0"
	document.location="cam_usu.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&IDCombo4=" + IDCombo4  +"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7 + "&Id_CARcUSR="+VarC8     
	}
	
	
	
</script>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css"> <HEAD>  <TITLE>   Cambios de Usuario  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
  <FORM METHOD="post" ACTION= "cam_usu_cambio_var_de_session.asp" NAME= "FormAltas">
  <BR><BR>  <CENTER>    <H2>      <FONT COLOR= #3366CC>Cambios de Usuarios </FONT>    </H2>      </CENTER>
 
 <Center>
 <!--- ---JVI-------------------------------------------------------------------------->

    <TABLE  border='0'   ID='AutoNumber1' HEIGHT='154' width="531">
     <TR>
        <TD height="29" width="268"></TD>
        <TD height="29" width="151"></TD>
     </TR><TR>
        <TD height="30" width="268"> 
          <%Sql ="SELECT * FROM CARcSubprocuradurias order by CARcSubprocuradurias" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          Subprocuraduría u homologa: </TD>
        <TD height="30" width="151"> 
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
        <TD height="30" width="268">Dirección General o Delegación : </TD>
        <TD height="30" width="151"> 
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
        <TD height="30" width="268"> Dirección o Subsede : </TD>
        <TD height="30" width="151"> 
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
      <TD height="23" width="268"> 
         Usuario :
      </TD>
      <TD height="23" width="151">
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
  <BR><BR><BR><BR>
  
  <INPUT TYPE="button" <%=sBtnHab%> VALUE="Enviar" NAME="B1" > &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

   </CENTER>



  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>
  </FORM>
 </BODY>

</HTML>

