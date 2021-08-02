
<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET rs   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET rs2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")


    v_Tabla = "CARdAdscripciones"
	
    v_Tabla = UCase(TRIM(v_TABLA))
	
'''	RESPONSE.WRITE SESSION("V_ODBC")
'''	RESPONSE.END 

    ''''SESSION("V_ODBC")  = "SIP"
	
 ''RESPONSE.WRITE session("IP_DATOS")
 ' RESPONSE.WRITE SESSION("V_ODBC")
 'RESPONSE.END 


  
    Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+SESSION("V_ODBC")+";UID=" + Session("UserID") + ";PWD=" + Session("Password")
   

   
 
   
''''<>}}}}}}*>
consulta = "SELECT * FROM CARcDG_o_Delegaciones " 
rs.OPEN consulta, Ob_Conn,2, 3, 1
tbl_Combo2 = rs.getrows
Campos_Combo2 = UBound(tbl_Combo2,1) 
regs_Combo2 = UBound(tbl_Combo2,2)
rs.CLOSE 


'response.write "perfil>> "
xPerfil = SESSION("PERFIL")

Id_CARcSubprocuradurias = Session("Subprocuraduria")
Id_CARcDG_o_Delegaciones =  Session("Delegacion")


   consulta = "SELECT * FROM " + v_Tabla
   rs.OPEN consulta, Ob_Conn,2, 3, 1
   total_campos = rs.FIELDS.COUNT

    
%>


<HTML>
<link href="Estilo.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.Estilo1 {font-size: 9px}
-->
</style>
<HEAD>  <TITLE>   Pantalla Altas  </TITLE> </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY TOPMARGIN="0" LEFTMARGIN="0" background="softgri1.jpg">

  <CENTER>
  <FORM TARGET="BOTONES" METHOD="post" ACTION= "KARMAZONDERESULTADOSDEESTADOSDEFUERZA.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">
		

    
 <BR> 
 <TABLE class="SL"  border='0'   WIDTH='82%' ID='AutoNumber1' HEIGHT='0'>
     
     
     
     <TR>
	  <TD width="11%" rowspan="3" class="Encabezados"><em>Listado de personas por estatus laboral. </em></TD>
      <TD width="40%" class="Encabezados"> 
         Adscripción:      </TD>
      <TD width="36%" class="DATOS">
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY id_CARcSubprocuradurias ASC" %>
          <% rs2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")'>
	         <%DO UNTIL rs2.Eof%>
			    <%IF XPerfil = "PERFIL 1" THEN%>
                     <%IF rs2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>           </OPTION>
                     <% ELSE  %>
                     <OPTION VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>                     </OPTION>
                      <%END IF  %>
                <% ELSE  %>
                    <%IF rs2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>           </OPTION>
                    <%END IF  %>
                 <%END IF  %>
	         <%rs2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% rs2.CLOSE%>      </TD>
	  
	  	<TD width="13%" rowspan="2" class="Encabezados">
		<input type="button" value="M o s t r a r" name="B1" onClick="ValidaCampos()">
       <input type="reset" value="Restablecer" name="B2"></TD>
     </TR>
	 
	 <TR>
      <TD class="Encabezados">
        Delegación o Dirección:      </TD>  
	   <TD class="DATOS">
	   <%Sql ="SELECT * FROM CARcDG_o_Delegaciones" %>
          <% rs2.OPEN Sql, Ob_Conn %>
			    <%IF XPerfil <> "PERFIL 1" THEN%>
	                  <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1>
	                <%DO UNTIL rs2.Eof%>
                     <%IF rs2("Id_CARcDG_o_Delegaciones")= CINT(Id_CARcDG_o_Delegaciones) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcDG_o_Delegaciones")%>'> <%= rs2("CARcDG_o_Delegaciones")%>                      </OPTION>
                      <%END IF  %>
	                <%rs2.MOVENEXT %>
	                <%LOOP%>
                      </SELECT>
                     <% rs2.CLOSE%>
                <% ELSE  %>
                    <%''IF rs2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
	                  <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1>
	                  <OPTION VALUE='0'>SELECCIONE</OPTION>
                      </SELECT>
					  <% rs2.CLOSE%>
                    <%''END IF  %>
       <%END IF  %>	   </TD> </TR>
	 
	<TR>
	
	<TD class="Encabezados">Estatus: </TD>
	
	
	
		   <TD class="DATOS">
	   <%Sql ="SELECT * FROM CARcEstatusLaboral ORDER BY  Id_CARcEstatusLaboral DESC" %>
          <% rs2.OPEN Sql, Ob_Conn %>
	                  <SELECT NAME='Id_CARcEstatusLaboral' SIZE=1>
	                <%DO UNTIL rs2.Eof%>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcEstatusLaboral")%>'> <%= rs2("CARcEstatusLaboral")%> </OPTION>
	                <%rs2.MOVENEXT %>
	                <%LOOP%>
                      </SELECT>
                     <% rs2.CLOSE%>
                
                    
      	   </TD> 
	   
	   
	   
	   
	
	
	
	
    <TD class="Encabezados">	  	

	 <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> &nbsp; <img src="Multimedia/imagenes/EXCEL.jpg"> <span class="Estilo1">Excel</span>	 </TD>
 
	</TR> 
	 
     
     
     <% Id_CAPdCurso = REQUEST.QUERYSTRING("Id_CAPdCurso") %>
     <INPUT TYPE="HIDDEN" NAME="Id_CAPdCurso" VALUE="<%= Id_CAPdCurso %>" >  
</TABLE>
  <% rs.CLOSE %>
  <BR>


  </FORM> </BODY> </HTML>




  <%SET rs = NOTHING%>
  <%SET rs2 = NOTHING%>
  <%SET Ob_Conn = NOTHING%>

<!--- ================================================================================================================ --->

<script Language="JavaScript"> 
function ValidaCampos()
{

/* if (FormAltas.Id_CARcSubprocuradurias.value  == 0)
  {
       alert("El campo de Subprocuraduría, no puede estar vacio, verifique por favor");
	   FormAltas.Id_CARcSubprocuradurias.focus();
       return false;
  }
  */
  
 
  
  
/*  if (TOTAL_DE_LUGARES_REQUERIDOS > CUPO_MAX_REG)
	 {
	 alert("El cupo maximo del curso es de :"+CUPO_MAX_REG_S+", Con la cantidad que usted capturo sobrepasa el cupo maximo del curso, verifique por favor");
	 FormAltas.CUPO.focus();
	 return false;
	 }
    */
  
    // FormAltas.B1.disabled = true;  
     document.FormAltas.submit();	  
   /*=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Jaissiel VI <>}}}}}}*>=-=-=-=-=-=-=-=-=-=-=-=-*/
	
}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
				
function SeleCombo2(pas)
{
var xcont = 1 
var ycont = 0 
    
   <% FOR I = 0 to regs_Combo2 %>
	    if  (document.FormAltas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		    { xcont = xcont + 1   }
   <% next    %>   
          document.FormAltas.Id_CARcDG_o_Delegaciones.length= xcont;
    <% FOR I = 0 to regs_Combo2 %>
        if  (document.FormAltas.Id_CARcSubprocuradurias.value == <%= tbl_Combo2(2,I)%> )
		 {
		   ycont = ycont +1;
          document.FormAltas.Id_CARcDG_o_Delegaciones.options[ycont].text='<%= tbl_Combo2(1,I) %>'
          document.FormAltas.Id_CARcDG_o_Delegaciones.options[ycont].value='<%= tbl_Combo2(0,I) %>'
		  }
   <%  next    %>   
  //document.FormAltas.Id_CARcDG_o_Delegaciones.options[0].selected=true // Esta linea se agrega solo en Modificaciones
}

		
		
		
		
		
		
		
		
		
		
		
		
		
 
  
</script> 

