<!-- Include File = "../Session/ActiveSession.inc" -->
<!-- Include File = "../Seguridad/Perfil.inc" -->
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")

    v_Tabla = "CARcUSR"
    v_Tabla = UCase(TRIM(v_TABLA))

    Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")

	
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

 'VCombo3  = Request("IDCombo3")
 'SET Ob_C4  = SERVER.CREATEOBJECT("ADODB.RECORDSET") ' agregado
 '  if VCombo3 = "" then
 '     vCombo3 = Id_CARcDir_o_subsede
 '  end if
 ' sqlC4 = "SELECT * FROM CARcUSR WHERE Id_CARcDir_o_subsede = "+CSTR(VCombo3)+" order by CARcUSR "
 ' Ob_C4.open sqlC4, Ob_Conn
 '  C4_EOF = Ob_C4.EOF 

%>

<script LANGUAGE="JavaScript">

	function Refresca_Combo1()
	{
      var VarC5= document.Usuarios.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.Usuarios.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.Usuarios.elements["Id_CARcDir_o_subsede"].value
    //  var VarC8= document.Usuarios.elements["Id_CARcUSR"].value
	//================ RECARGA DE BOTON ===================
	var IDCombo1 = document.Usuarios.Id_CARcSubprocuradurias.options(document.Usuarios.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = "0"
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="Definicion_Usuarios_Finales.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 +"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7
	}
	
	function Refresca_Combo2()
	
	{
	  
      var VarC5= document.Usuarios.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.Usuarios.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.Usuarios.elements["Id_CARcDir_o_subsede"].value
     // var VarC8= document.Usuarios.elements["Id_CARcUSR"].value
	//======================== RECERGA DE MI BOTON ===================

	var IDCombo1 = document.Usuarios.Id_CARcSubprocuradurias.options(document.Usuarios.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.Usuarios.Id_CARcDG_o_Delegaciones.options(document.Usuarios.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = "0"
	var IDCombo4 = "0"
	document.location="Definicion_Usuarios_Finales.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3 + "&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7
	}
	
		function Refresca_Combo3()
	{
      var VarC5= document.Usuarios.elements["Id_CARcSubprocuradurias"].value
      var VarC6= document.Usuarios.elements["Id_CARcDG_o_Delegaciones"].value
      var VarC7= document.Usuarios.elements["Id_CARcDir_o_subsede"].value
      var VarC8= document.Usuarios.elements["Id_CARcUSR"].value
	  	//=====================  RECARGA DE MI BOTON ======================

	var IDCombo1 = document.Usuarios.Id_CARcSubprocuradurias.options(document.Usuarios.Id_CARcSubprocuradurias.selectedIndex).value
	var IDCombo2 = document.Usuarios.Id_CARcDG_o_Delegaciones.options(document.Usuarios.Id_CARcDG_o_Delegaciones.selectedIndex).value
	var IDCombo3 = document.Usuarios.Id_CARcDir_o_subsede.options(document.Usuarios.Id_CARcDir_o_subsede.selectedIndex).value
	var IDCombo4 = "0"
	document.location="Definicion_Usuarios_Finales.asp?ActCBX=S&IDCombo1=" + IDCombo1 + "&IDCombo2=" + IDCombo2+"&IDCombo3=" + IDCombo3   +"&Id_CARcSubprocuradurias="+VarC5+"&Id_CARcSubprocuradurias="+VarC5 + "&Id_CARcDG_o_Delegaciones="+VarC6 + "&Id_CARcDir_o_subsede="+VarC7 + "&Id_CARcUSR="+VarC8     
	}
	
	
	
</script>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css">
<HEAD>  <TITLE>   Cambios de Usuario  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0">
  <FORM METHOD="post" ACTION= "Grabar_Usuarios_Finales.asp" NAME= "Usuarios">
  <BR>  <CENTER>    <H2>      <FONT COLOR= #3366CC>Definición de Usuarios Finales</FONT>    </H2>      
  </CENTER>
 
 <Center>
 <!--- ---JVI-------------------------------------------------------------------------->

    <TABLE  border='0'   ID='AutoNumber1' HEIGHT='349' width="531">
     <TR>
        <TD height="30" width="268"> 
          <%Sql ="SELECT * FROM CARcSubprocuradurias order by CARcSubprocuradurias" %>
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
          <strong>Subprocuraduría u homologa:</strong> </TD>
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
        <TD height="30" width="268"><strong>Dirección General o Delegación : </strong></TD>
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
        <TD height="30" width="268"><strong> Dirección o Subsede : </strong></TD>
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
     
          
	 
	 <TR> <BR>
	 <TD><strong> Usuario: </strong></TD>	 
	 <TD><Input type="text" name="Usuarioo" ></TD>
	 </TR>
	 	 <TR> 
		 	 <TD><strong>Password : </strong></TD>
		 	 <TD><Input type="text" name="Password" ></TD>
		 </TR>
		 
		 <TR>
      <TD> 
         <B>Perfil de permisos : </B>
      </TD>
      <TD>
	  <%' DES_ESP  = 1 quiere decir que solo se mostraran los registros de Personal Sustantivo
	    ' Activos = 1 Son los perfiles que se van a mostrar 
	  Sql ="SELECT * FROM CARcPerfilGrupo WHERE DES_ESP = 1 AND Activo = 1" %>
          
          <% Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcPerfilGrupo' SIZE= 1 >
          <% IF Id_CARcPerfilGrupo = "" OR Id_CARcPerfilGrupo = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <% END IF  %>
	         <%DO UNTIL Ob_RS2.Eof%>
                <%IF Ob_RS2("Id_CARcPerfilGrupo")= CINT(Id_CARcPerfilGrupo) THEN %>
                   <OPTION SELECTED VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
                   </OPTION>
             <% ELSE  %>
                <OPTION VALUE='<%=Ob_RS2("Id_CARcPerfilGrupo")%>'> <%= Ob_RS2("CARcPerfilGrupo")%>
                </OPTION>
             <%END IF  %>
	         <%Ob_RS2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% Ob_RS2.CLOSE%>
      </TD>
     </TR>
	 
	 
	 
	 
	 <!--<TR>
      <TD> 
         <B>Nivel de usuario : </B>
      </TD>
      <TD>
          <%'Sql ="SELECT * FROM CARcTipoUSR WHERE Id_CARcTipoUSR >= 5 " %>
          <%' Ob_RS2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcTipoUSR' SIZE=1 >
          <%' IF Id_CARcTipoUSR = "" OR Id_CARcTipoUSR = "0" THEN %>
	            <OPTION VALUE='0'>
                   Seleccione registro
              </OPTION>
           <%' END IF  %>
	         <%'DO UNTIL Ob_RS2.Eof%>
                <%'IF Ob_RS2("Id_CARcTipoUSR")= CINT(Id_CARcTipoUSR) THEN %>
                   <OPTION SELECTED VALUE='<%'=Ob_RS2("Id_CARcTipoUSR")%>'> <%'= Ob_RS2("CARcTipoUSR")%>
                   </OPTION>
             <% 'ELSE  %>
                <OPTION VALUE='<%'=Ob_RS2("Id_CARcTipoUSR")%>'> <%'= Ob_RS2("CARcTipoUSR")%>
                </OPTION>
             <%'END IF  %>
	         <%'Ob_RS2.MOVENEXT %>
	         <%'LOOP%>
       </SELECT>
    <%' Ob_RS2.CLOSE%>
      </TD>
     </TR>-->
	  <TR>
	 <TD><strong>Descripción del Usuario:</strong></TD>
	 <TD><Input type="text" name="Descripcion_Usuario" size="40" ></TD>
	 </TR>
	 
	 <TR>
	 <TD><strong>Nombre de la persona responsable del usuario:</strong></TD>
	 <TD><Input type="text" name="Responsable" ></TD>
	 </TR>
	 
	  <TR>
	 <TD><strong>Micro de la persona responsable del usuario:</strong></TD>
	 <TD><Input type="text" name="Micro" ></TD>
	 </TR>
	
	 
    </TABLE> </Center>
  
  <% Ob_Rs.CLOSE %>
  <p ALIGN="center">   <BR>
	<input type="submit" value="Guardar Usuario" name="B1" Onclick ="return ValidaCampos()" > 
    &nbsp;&nbsp;&nbsp; 
  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp; 
  </p>

  <%SET Ob_RS = NOTHING%>
  <%SET Ob_RS2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>
  </FORM> </BODY></HTML>

 <script Language="JavaScript"> 
function ValidaCampos()
{
  
  if (Usuarios.Usuarioo.value == "" ) 
  {
       alert("El campo 'Usuario' no debe de ir vacio, verifique por favor.  ");
       return false;
  }
  
  if (Usuarios.Password.value == "" ) 
  {
       alert("El campo 'Password' no debe de ir vacio, verifique por favor.  ");
       return false;
  }
  if (Usuarios.Id_CARcPerfilGrupo.value == 0 ) 
  {
       alert("debe seleccionar un tipo de 'Perfil', verifique por favor.  ");
       return false;
  }
  
  
  if (Usuarios.Descripcion_Usuario.value == "" ) 
  {
       alert("El campo 'La descripción del usuario' no debe de ir vacio, verifique por favor.  ");
       return false;
  }
  
  
  }
</script> 