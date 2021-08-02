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
<HEAD>  <TITLE>   Pantalla Altas  </TITLE> </HEAD>

 <SCRIPT LANGUAGE="JavaScript" SRC="calendario.js"></SCRIPT>
 <BODY TOPMARGIN="0" LEFTMARGIN="0" background="softgri1.jpg">

  <CENTER>
  <FORM TARGET="BOTONES" METHOD="post" ACTION= "ARMAZONDERESULTADOSDEESTADOSDEFUERZA.asp" NAME= "FormAltas">
        <input type="hidden" name="Agregar" value="S">
		
  <CENTER>    <H6>      <FONT COLOR= #3366CC>Seleccione la Adscripción y la delegación</FONT>    </H6>  </CENTER>

    
  
 <TABLE class="SL"  border='0'   WIDTH='80%' ID='AutoNumber1' HEIGHT='0'>
     
     
     
     <TR>
      <TD class="Encabezados"> 
         Adscripción
      </TD>
      <TD class="DATOS">
          <%Sql ="SELECT * FROM CARcSubprocuradurias ORDER BY id_CARcSubprocuradurias ASC" %>
          <% rs2.OPEN Sql, Ob_Conn %>
	     <SELECT NAME='Id_CARcSubprocuradurias' SIZE=1  onchange='SeleCombo2("C")'>
	         <%DO UNTIL rs2.Eof%>
			    <%IF XPerfil = "PERFIL 1" THEN%>
                     <%IF rs2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>
                      </OPTION>
                     <% ELSE  %>
                     <OPTION VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>
                     </OPTION>
                      <%END IF  %>
                <% ELSE  %>
                    <%IF rs2("Id_CARcSubprocuradurias")= CINT(Id_CARcSubprocuradurias) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcSubprocuradurias")%>'> <%= rs2("CARcSubprocuradurias")%>
                      </OPTION>
                    <%END IF  %>
                 <%END IF  %>
	         <%rs2.MOVENEXT %>
	         <%LOOP%>
       </SELECT>
    <% rs2.CLOSE%>
      </TD>
     </TR>
	 
	 <TR>
      <TD class="Encabezados">
        Delegación o Dirección
      </TD>  
	   <TD class="DATOS">
	   <%Sql ="SELECT * FROM CARcDG_o_Delegaciones" %>
          <% rs2.OPEN Sql, Ob_Conn %>
			    <%IF XPerfil <> "PERFIL 1" THEN%>
	                  <SELECT NAME='Id_CARcDG_o_Delegaciones' SIZE=1>
	                <%DO UNTIL rs2.Eof%>
                     <%IF rs2("Id_CARcDG_o_Delegaciones")= CINT(Id_CARcDG_o_Delegaciones) THEN %>
                     <OPTION SELECTED VALUE='<%=rs2("Id_CARcDG_o_Delegaciones")%>'> <%= rs2("CARcDG_o_Delegaciones")%>
                      </OPTION>
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
                    <%''END IF  %>
                 <%END IF  %>
	  
	   </TD> </TR>
	 
	 
	 
     
     
     <% Id_CAPdCurso = REQUEST.QUERYSTRING("Id_CAPdCurso") %>
     <INPUT TYPE="HIDDEN" NAME="Id_CAPdCurso" VALUE="<%= Id_CAPdCurso %>" >  
    	 
</TABLE>
  <% rs.CLOSE %>
  <BR>

  <p ALIGN="center"> &nbsp;
  <INPUT TYPE="button" VALUE="Mostrar Reporte de Estados de Fuerza" NAME="B1" onClick="ValidaCampos()"> &nbsp;&nbsp;&nbsp; 
    	      <INPUT TYPE="checkbox"  NAME="exxxcel" value="100"> Enviar a Excel <img src="Multimedia/imagenes/EXCEL.jpg">&nbsp;&nbsp;&nbsp;

  <INPUT TYPE="reset" VALUE="Restablecer" NAME="B2"> &nbsp;&nbsp;&nbsp;</p>

   </CENTER>
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

