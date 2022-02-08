<%
   SET Conectar = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")

   Conectar.PROVIDER="sqloledb"
  Conectar.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
   Perfil = REQUEST.FORM ("NombrePerfil")
   DesPerfil = REQUEST.FORM ("DesPerfil")
   
    Verifica_Nom = "SELECT * FROM CARcPantallas WHERE CARcPantallas =  '" & Perfil & "' AND Carrera = 1"
   
   Record.Open Verifica_Nom, Conectar, 3, 1 
		TotdeRegistros = Record.RECORDCOUNT
		
		If TotdeRegistros => 1 THEN  
		response.Clear%>
		
		<script Language="JavaScript"> 
		alert("El nombre de 'Perfil' ya existe, capture uno distinto por favor.");
       /*return false;*/
        history.back()
		</script>
		<%	Response.end 
		   END IF 
		
		Record.Close%>
		
		
   
   
   
 <%  
      '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  
   
   
   
   
   
   
   
   
    		'El valor 1 en el  campo Carrera es para diferenciar los registros de Personal Sustantivo		   
    Insert_CARcPantallas = "INSERT INTO CARcPantallas (CARcPantallas, Descripcion, Carrera) " & _
                       " VALUES ('"&Perfil&"', '"&DesPerfil&"', 1)"
    Conectar.Execute(Insert_CARcPantallas)
	SET var = Conectar.Execute("SELECT @@IDENTITY")
	Id_CARcPantallas = var(0)
	var.close
	SET var = NOTHING
	'''Response.Write(Id_CARcPantallas&"----")
	
	'El el valor 1 en el  campo Des_Esp es para diferenciar los registros de Personal Sustantivo
	Insert_CARcPerfilGrupo = "INSERT INTO CARcPerfilGrupo (CARcPerfilGrupo, CARcDescripcion, Des_Esp, Activo) " & _
                       " VALUES ('"&Perfil&"', '"&DesPerfil&"', 1, 1)"
    Conectar.Execute(Insert_CARcPerfilGrupo) 
	    
   Set varr = Conectar.Execute("SELECT @@IDENTITY")
    Id_CARcPerfilGrupo = varr(0)
	varr.close
	SET varr = NOTHING
	 '''  Response.Write(Id_CARcPerfilGrupo)
	 
	 
	 Insert_CARdPerfilGrpPantallas = "INSERT INTO CARdPerfilGrpPantallas (Id_CARcPerfilGrupo, Id_CARcPantallas) " & _
                       " VALUES ('"&Id_CARcPerfilGrupo&"', '"&Id_CARcPantallas&"')"
    Conectar.Execute(Insert_CARdPerfilGrpPantallas) 
	 
	 
	 
	 
	 
	 
	 
	 'Catalogos
	 CATA = TRIM(CINT (REQUEST("todos")))
		 IF CATA = 9999 THEN
		     CATAL = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
		             "SELECT " &Id_CARcPantallas& " AS ID__CARcPantallas, Id_CARcPaginas FROM CARcPaginas  WHERE Descripcion = 'Catalogos Personas'"
			Conectar.Execute(CATAL)
		 END IF	
		 
		 
		 
    'CARR_detalle_generales.asp 
	   K988 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '988')"
	   Conectar.Execute(K988) 
	    
	
	
	
	IF REQUEST("986") <> "" THEN
	   K986 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("986")&"')"
	   Conectar.Execute(K986) 
	    END IF 
		
		IF REQUEST("987") <> "" THEN
	   K987 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("987")&"')"
	   Conectar.Execute(K987) 
	    END IF 
	
	
	
	 IF REQUEST("544") <> "" THEN
	   K544 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("544")&"')"
	   Conectar.Execute(K544) 
	    END IF 
		
		
	IF REQUEST("817") <> "" THEN
	   K817 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("817")&"')"
	    Conectar.Execute(K817) 
	    END IF 
   
   IF REQUEST("834") <> "" THEN
	   K834 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("834")&"')"
	    Conectar.Execute(K834) 
	    END IF 
		
    IF REQUEST("545") <> "" THEN
	   K545 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("545")&"')"
	    Conectar.Execute(K545) 
	    END IF 
		
		IF REQUEST("801") <> "" THEN
	   K801 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("801")&"')"
	    Conectar.Execute(K801) 
	    END IF 
		
		IF REQUEST("818") <> "" THEN
	   K818 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("818")&"')"
	    Conectar.Execute(K818) 
	    END IF 
		
		IF REQUEST("546") <> "" THEN
	   K546 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("546")&"')"
	    Conectar.Execute(K546) 
	    END IF 
		
		IF REQUEST("802") <> "" THEN
	   K802 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("802")&"')"
	    Conectar.Execute(K802) 
	    END IF 
		
		IF REQUEST("819") <> "" THEN
	   K819 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("819")&"')"
	    Conectar.Execute(K819) 
	    END IF 
		
		
		IF REQUEST("547") <> "" THEN
	   K547 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("547")&"')"
	    Conectar.Execute(K547) 
	    END IF 
		
		IF REQUEST("803") <> "" THEN
	   K803 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("803")&"')"
	    Conectar.Execute(K803) 
	    END IF 
		
		IF REQUEST("820") <> "" THEN
	   K820 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("820")&"')"
	    Conectar.Execute(K820) 
	    END IF 
		
		IF REQUEST("548") <> "" THEN
	   K548 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("548")&"')"
	    Conectar.Execute(K548) 
	    END IF
		
		IF REQUEST("804") <> "" THEN
	   K804 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("804")&"')"
	    Conectar.Execute(K804) 
	    END IF
		
		IF REQUEST("821") <> "" THEN
	   K821 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("821")&"')"
	    Conectar.Execute(K821) 
	    END IF
		
		IF REQUEST("549") <> "" THEN
	   K549 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("549")&"')"
	    Conectar.Execute(K549) 
	    END IF
		
		IF REQUEST("805") <> "" THEN
	   K805 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("805")&"')"
	    Conectar.Execute(K805) 
	    END IF
		
		IF REQUEST("822") <> "" THEN
	   K822 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("822")&"')"
	    Conectar.Execute(K822) 
	    END IF
		
		IF REQUEST("710") <> "" THEN
	   K710 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("710")&"')"
	    Conectar.Execute(K710) 
	    END IF
		
		IF REQUEST("711") <> "" THEN
	   K711 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("711")&"')"
	    Conectar.Execute(K711) 
	    END IF
		
		IF REQUEST("712") <> "" THEN
	   K712 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("712")&"')"
	    Conectar.Execute(K712) 
	    END IF
		
		IF REQUEST("550") <> "" THEN
	   K550 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("550")&"')"
	    Conectar.Execute(K550) 
	    END IF
		
		IF REQUEST("806") <> "" THEN
	   K806 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("806")&"')"
	    Conectar.Execute(K806) 
	    END IF
		
		IF REQUEST("823") <> "" THEN
	   K823 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("823")&"')"
	    Conectar.Execute(K823) 
	    END IF
		
		IF REQUEST("551") <> "" THEN
	   K551 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("551")&"')"
	    Conectar.Execute(K551) 
	    END IF
		
		IF REQUEST("807") <> "" THEN
	   K807 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("807")&"')"
	    Conectar.Execute(K807) 
	    END IF
		
		IF REQUEST("824") <> "" THEN
	   K824 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("824")&"')"
	    Conectar.Execute(K824) 
	    END IF
		
		IF REQUEST("552") <> "" THEN
	   K552 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("552")&"')"
	    Conectar.Execute(K552) 
	    END IF
		
		IF REQUEST("808") <> "" THEN
	   K808 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("808")&"')"
	    Conectar.Execute(K808) 
	    END IF
		
		IF REQUEST("825") <> "" THEN
	   K825 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("825")&"')"
	    Conectar.Execute(K825) 
	    END IF
		
		IF REQUEST("553") <> "" THEN
	   K553 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("553")&"')"
	    Conectar.Execute(K553) 
	    END IF
		
		IF REQUEST("809") <> "" THEN
	   K809 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("809")&"')"
	    Conectar.Execute(K809) 
	    END IF
		
		IF REQUEST("826") <> "" THEN
	   K826 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("826")&"')"
	    Conectar.Execute(K826) 
	    END IF
		
		IF REQUEST("554") <> "" THEN
	   K554 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("554")&"')"
	    Conectar.Execute(K554) 
	    END IF
		
		IF REQUEST("810") <> "" THEN
	   K810 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("810")&"')"
	    Conectar.Execute(K810) 
	    END IF
		
		IF REQUEST("827") <> "" THEN
	   K827 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("827")&"')"
	    Conectar.Execute(K827) 
	    END IF
		
		IF REQUEST("555") <> "" THEN
	   K555 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("555")&"')"
	    Conectar.Execute(K555) 
	    END IF
		
		IF REQUEST("811") <> "" THEN
	   K811 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("811")&"')"
	    Conectar.Execute(K811) 
	    END IF
		
		IF REQUEST("828") <> "" THEN
	   K828 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("828")&"')"
	    Conectar.Execute(K828) 
	    END IF
		
		IF REQUEST("798") <> "" THEN
	   K798 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("798")&"')"
	    Conectar.Execute(K798) 
	    END IF
		
		IF REQUEST("799") <> "" THEN
	   K799 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("799")&"')"
	    Conectar.Execute(K799) 
	    END IF
		
		IF REQUEST("780") <> "" THEN
	   K780 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("780")&"')"
	    Conectar.Execute(K780) 
	    END IF
		
		IF REQUEST("557") <> "" THEN
	   K557 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("557")&"')"
	    Conectar.Execute(K557) 
	    END IF
		
		IF REQUEST("813") <> "" THEN
	   K813 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("813")&"')"
	    Conectar.Execute(K813) 
	    END IF
		
		IF REQUEST("830") <> "" THEN
	   K830 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("830")&"')"
	    Conectar.Execute(K830) 
	    END IF
		
		IF REQUEST("558") <> "" THEN
	   K558 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("558")&"')"
	    Conectar.Execute(K558) 
	    END IF
		
		IF REQUEST("814") <> "" THEN
	   K814 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("814")&"')"
	    Conectar.Execute(K814) 
	    END IF
		
		IF REQUEST("831") <> "" THEN
	   K831 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("831")&"')"
	    Conectar.Execute(K831) 
	    END IF
		
		IF REQUEST("556") <> "" THEN
	   K556 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("556")&"')"
	    Conectar.Execute(K556) 
	    END IF
		
		IF REQUEST("812") <> "" THEN
	   K812 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("812")&"')"
	    Conectar.Execute(K812) 
	    END IF
		
		IF REQUEST("829") <> "" THEN
	   K829 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("829")&"')"
	    Conectar.Execute(K829) 
	    END IF
		
		' Administración
		
		IF REQUEST("983") <> "" THEN
	   K983 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("983")&"')"
	    Conectar.Execute(K983) 
	    END IF
		
		IF REQUEST("984") <> "" THEN
	   K984 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("984")&"')"
	    Conectar.Execute(K984) 
	    END IF
		
		IF REQUEST("985") <> "" THEN
	   K985 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("985")&"')"
	    Conectar.Execute(K985) 
	    END IF
		
		
		
		
		
			
			
	%>
		
  	<!-- Include File = "catalogo.inc" -->
	
	
		
	
		<%
		'END IF
		
		
		
		
		
		
		
		
		
		
		
		
''--------------------------------------------------------------------------------------------------------------  <>}}}}*>   %>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css"> <HEAD>  <TITLE>   Grabado de Perfiles  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0"> 
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">
   <BR><BR>    <CENTER>    <H2>      <FONT COLOR= #3366CC>Perfil Generado Correctamente</FONT>    </H2>    </CENTER>

<%%>
 
 </FORM> </BODY></HTML>

