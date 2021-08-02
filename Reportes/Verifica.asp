<HTML>
  <BODY BACKGROUND = "softgri1.jpg">
  <LINK HREF="CarreraPGR.css" REL="stylesheet" TYPE="text/css">
  
    <%
      vl_id_curso_seleccionado = REQUEST.FORM("hdnId_curso_seleccionado")
      vl_curso_seleccionado = REQUEST.FORM("hdnCurso_seleccionado")
      vl_Usuario = REQUEST.FORM("txtUsuario")
      vl_Contrasena = REQUEST.FORM("txtContrasena")      

      Set Ob_Conn = Server.CreateObject("ADODB.Connection")
      Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
      Set Ob_RS_2 = Server.CreateObject("ADODB.RecordSet")

      Ob_Conn.PROVIDER="sqloledb"
      Ob_Conn.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE=SIIFP;UID=cursos;PWD=cursos"

      consulta_autentica = "SELECT Count (Id_CARcUSR) AS Contador, Id_CARdDatosPersonales FROM CARcUSR WHERE CARcUSR = '" & vl_Usuario & "' AND PW = '" & vl_Contrasena & "' GROUP BY Id_CARdDatosPersonales"
      Ob_RS.OPEN consulta_autentica, Ob_Conn

      IF Ob_RS.EOF = True THEN
    %>
    
	<BR><BR><H3><CENTER> Usuario y/o Password no válidos, por favor vuelva a intentarlo </CENTER></H3>
	
    <%
      ELSE    
		consulta_nombre_usuario = "SELECT * FROM CARdDatosPersonales WHERE Id_CARdDatosPersonales = " & Ob_RS("Id_CARdDatosPersonales")
        Ob_RS_2.OPEN consulta_nombre_usuario, Ob_Conn
	
		vl_nombre_usuario = Ob_RS_2("ApellidoPaterno") & " " &Ob_RS_2("ApellidoMaterno") & " " &Ob_RS_2("Nombre")
	
		RESPONSE.REDIRECT ("Altas_CAPdSolicitud.asp?vp_curso_seleccionado="&vl_curso_seleccionado&"&vp_id_curso_seleccionado="&vl_id_curso_seleccionado&"&vp_nombre_usuario="&vl_nombre_usuario&"&vp_id_nombre_usuario="&Ob_RS("Id_CARdDatosPersonales"))
      END IF
    %> 
     
   </BODY>
</HTML>