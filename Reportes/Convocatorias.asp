<HTML><BODY background="Multimedia/imagenes/softgri1.jpg">

<div align="center">   <label><strong><font size="4">CONVOCATORIAS </font></strong></label></div>
<form action="" method="post">
  <blockquote>
    <p>
      <%
      Set Ob_Conn_pre = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_pre = Server.CreateObject ("ADODB.RecordSet")
	  
      Ob_Conn_pre.Provider="sqloledb"
	  		  IP_Servidor = session("IP_Servidor")
		  Ob_Conn_pre.Open="Server="&IP_Servidor&";Database=SIIFP;UID=cursos;PWD=cursos"		  

  
 var_query = "select * from CAPdConvocatoria "
            
	  
	  
	  Ob_RS_pre.Open var_query, ob_conn_pre  %>
      <font color="#996600"> 
      
      </font>&nbsp;&nbsp; 
      
 
      <BR>
      <label><strong><font color="#996600"></font></strong></label>
     </p>
  </blockquote>
  <table border="1" align="center" >
    <tr> 
      <th>Cursos</th>
	  <th >Fecha de la convocatoria</th>
      <th >Fecha de inicio</th>
      <th>Fecha de termino</th>
	  <th>Fecha de publicación</th>
	  <th>Correo electronico de conctacto</th>
	  <th>Cupo</th>
	  <th>Activo</th>
	  <th>Periodo de inscripcion</th>
    </tr>
    <% do until Ob_RS_pre.Eof %>
    <tr> 
      <td></td>
	  <td> <%= Ob_RS_pre("CAPdConvocatoria") %></td>
      <td> <%= Ob_RS_pre ("CAP_Fecha_inicio") %> </td>
      <td> <%= Ob_RS_pre ("CAP_Fecha_fin") %> </td>
	  <td> <%= Ob_RS_pre ("CAP_Fecha_publicacion") %> </td>
	  <td> <%= Ob_RS_pre ("ML_CAP_Contacto") %> </td>
	  <td> <%= Ob_RS_pre ("CAP_Cupo") %> </td>
	  <td> <%= Ob_RS_pre ("Activo") %> </td>
	  <td> <%= Ob_RS_pre ("CAP_Periodo_inscripcion") %> </td>
    </tr>
    <% Ob_RS_pre.MoveNext
  LOOP
  Ob_RS_pre.Close
  Ob_Conn_pre.Close %>
  </table>
  <br> <center>
  </center> <br> <div align="center"></div>
  
  
  
</form> </BODY></HTML>