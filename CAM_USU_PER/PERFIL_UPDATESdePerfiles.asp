
<%
   SET Conectar = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Record   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET INSTANCIA_RECORD_1        = SERVER.CREATEOBJECT("ADODB.RECORDSET")


   Conectar.PROVIDER="sqloledb"
  Conectar.OPEN="SERVER="+ session("IP_DATOS") +";DATABASE="+ SESSION("V_ODBC") +";UID="+ Session("UserID") +";PWD="+ Session("Password")
   
   Perfil = REQUEST.FORM ("NombrePerfil")
   DesPerfil = REQUEST.FORM ("DesPerfil")
   Id_CARcPerfilGrupo = REQUEST.FORM("Id_CARcPerfilGrupo")
   
 '''   Verifica_Nom = "SELECT * FROM CARcPantallas WHERE CARcPantallas =  '" & Perfil & "' AND Carrera = 1"
   
 '''  Record.Open Verifica_Nom, Conectar, 3, 1 
	'''	TotdeRegistros = Record.RECORDCOUNT
		
	'''	If TotdeRegistros => 1 THEN  
	'''	response.Clear%>
		
		<script Language="JavaScript"> 
		/* alert("El nombre de 'Perfil' ya existe, capture uno distinto por favor.");
       return false;
        history.back() */
		</script>
		<%	'''Response.end 
		 '''  END IF 
		
		'''Record.Close%>
		
		
   
   
   
 <%  
      '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  
   
   
   
   
   
   
   
   
   ' 		'El valor 1 en el  campo Carrera es para diferenciar los registros de Personal Sustantivo		   
'    Insert_CARcPantallas = "INSERT INTO CARcPantallas (CARcPantallas, Descripcion, Carrera) " & _
'                       " VALUES ('"&Perfil&"', '"&DesPerfil&"', 1)"
'    Conectar.Execute(Insert_CARcPantallas)
'	SET var = Conectar.Execute("SELECT @@IDENTITY")
'	Id_CARcPantallas = var(0)
'	var.close
'	SET var = NOTHING
'	'''Response.Write(Id_CARcPantallas&"----")
'	
'	'El el valor 1 en el  campo Des_Esp es para diferenciar los registros de Personal Sustantivo
'	Insert_CARcPerfilGrupo = "INSERT INTO CARcPerfilGrupo (CARcPerfilGrupo, CARcDescripcion, Des_Esp, Activo) " & _
'                       " VALUES ('"&Perfil&"', '"&DesPerfil&"', 1, 1)"
'    Conectar.Execute(Insert_CARcPerfilGrupo) 
'	    
'   Set varr = Conectar.Execute("SELECT @@IDENTITY")
'    Id_CARcPerfilGrupo = varr(0)
'	varr.close
'	SET varr = NOTHING
'	 '''  Response.Write(Id_CARcPerfilGrupo)
'	 
'	 
'	 Insert_CARdPerfilGrpPantallas = "INSERT INTO CARdPerfilGrpPantallas (Id_CARcPerfilGrupo, Id_CARcPantallas) " & _
'                       " VALUES ('"&Id_CARcPerfilGrupo&"', '"&Id_CARcPantallas&"')"
'    Conectar.Execute(Insert_CARdPerfilGrpPantallas) 
	 
	 
	 
	 
	 
	 
	 
	 ''Catalogos
'	 CATA = TRIM(CINT (REQUEST("todos")))
'		 IF CATA = 9999 THEN
'		     CATAL = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
'		             "SELECT " &Id_CARcPantallas& " AS ID__CARcPantallas, Id_CARcPaginas FROM CARcPaginas  WHERE Descripcion = 'Catalogos Personas'"
'			Conectar.Execute(CATAL)
'		 END IF	
		 
		 
		 
    ''CARR_detalle_generales.asp 
'	   K988 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
'                       " VALUES ('"&Id_CARcPantallas&"', '988')"
'	   Conectar.Execute(K988) 
	    
	
	
	
IF REQUEST("986") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 986 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K986 = ""
			 ELSE
		 	   K986 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("986")&"')"
					   
		'''RESPONSE.WRITE K986
		'''RESPONSE.END 
	         Conectar.Execute(K986)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 986 "
		'''RESPONSE.WRITE CKUEL
		'''RESPONSE.END 
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K986 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K986)
			 ELSE
		 	   K986 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
				
		'''PRUEBA = REQUEST("987")
''''		RESPONSE.Write PRUEBA & "<----es el name del objeto check---------"
			Id_CARcPerfilGrupo = REQUEST.FORM("Id_CARcPerfilGrupo")
''''		RESPONSE.WRITE Id_CARcPerfilGrupo & "<-----Id_CARcPerfilGrupo--------"
			Id_CARcPantallas = REQUEST.FORM("Id_CARcPantallas")
''''		RESPONSE.Write Id_CARcPantallas & "<--Id_CARcPantallas-----------"
			'''response.end 
		
	'ORIGINALLLLLLLLLLLLLLLLL	
	'	IF REQUEST("987") <> "" THEN
'	   K987 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
'                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("987")&"')"
'	   Conectar.Execute(K987) 
	  '  END IF 
		
	IF REQUEST("987") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 987 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K987 = ""
			 ELSE
		 	   K987 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("987")&"')"
	         Conectar.Execute(K987)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 987 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K987 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K987)
			 ELSE
		 	   K987 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
	
			
		
		
			
IF REQUEST("544") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 544 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K544 = ""
			 ELSE
		 	   K544 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("544")&"')"
	         Conectar.Execute(K544)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 544 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K544 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K544)
			 ELSE
		 	   K544 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
		
		
IF REQUEST("817") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 817 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K817 = ""
			 ELSE
		 	   K817 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("817")&"')"
	         Conectar.Execute(K817)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 817 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K817 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K817)
			 ELSE
		 	   K817 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'   
IF REQUEST("834") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 834 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K834 = ""
			 ELSE
		 	   K834 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("834")&"')"
	         Conectar.Execute(K834)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 834 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K834 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K834)
			 ELSE
		 	   K834 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("545") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 545 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K545 = ""
			 ELSE
		 	   K545 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("545")&"')"
	         Conectar.Execute(K545)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 545 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K545 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K545)
			 ELSE
		 	   K545 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("801") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 801 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K801 = ""
			 ELSE
		 	   K801 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("801")&"')"
	         Conectar.Execute(K801)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 801 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K801 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K801)
			 ELSE
		 	   K801 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("818") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 818 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K818 = ""
			 ELSE
		 	   K818 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("818")&"')"
	         Conectar.Execute(K818)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 818 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K818 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K818)
			 ELSE
		 	   K818 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF  
'		
IF REQUEST("546") <> "" THEN 
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 546 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K546 = ""
			 ELSE
		 	   K546 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("546")&"')"
	         Conectar.Execute(K546)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 546 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K546 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K546)
			 ELSE
		 	   K546 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF  
'		
IF REQUEST("802") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 802 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K802 = ""
			 ELSE
		 	   K802 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("802")&"')"
	         Conectar.Execute(K802)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 802 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K802 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K802)
			 ELSE
		 	   K802 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("819") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 819 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K819 = ""
			 ELSE
		 	   K819 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("819")&"')"
	         Conectar.Execute(K819)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 819 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K819 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K819)
			 ELSE
		 	   K819 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
'		
IF REQUEST("547") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 547 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K547 = ""
			 ELSE
		 	   K547 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("547")&"')"
	         Conectar.Execute(K547)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 547 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K547 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K547)
			 ELSE
		 	   K547 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("803") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 803 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K803 = ""
			 ELSE
		 	   K803 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("803")&"')"
	         Conectar.Execute(K803)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 803 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K803 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K803)
			 ELSE
		 	   K803 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("820") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 820 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K820 = ""
			 ELSE
		 	   K820 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("820")&"')"
	         Conectar.Execute(K820)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 820 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K820 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K820)
			 ELSE
		 	   K820 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF  
'		
IF REQUEST("548") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 548 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K548 = ""
			 ELSE
		 	   K548 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("548")&"')"
	         Conectar.Execute(K548)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 548 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K548 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K548)
			 ELSE
		 	   K548 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("804") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 804 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K804 = ""
			 ELSE
		 	   K804 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("804")&"')"
	         Conectar.Execute(K804)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 804 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K804 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K804)
			 ELSE
		 	   K804 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("821") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 821 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K821 = ""
			 ELSE
		 	   K821 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("821")&"')"
	         Conectar.Execute(K821)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 821 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K821 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K821)
			 ELSE
		 	   K821 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("549") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 549 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K549 = ""
			 ELSE
		 	   K549 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("549")&"')"
	         Conectar.Execute(K549)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 549 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K549 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K549)
			 ELSE
		 	   K549 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("805") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 805 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K805 = ""
			 ELSE
		 	   K805 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("805")&"')"
	         Conectar.Execute(K805)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 805 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K805 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K805)
			 ELSE
		 	   K805 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("822") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 822 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K822 = ""
			 ELSE
		 	   K822 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("822")&"')"
	         Conectar.Execute(K822)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 822 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K822 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K822)
			 ELSE
		 	   K822 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("710") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 710 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K710 = ""
			 ELSE
		 	   K710 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("710")&"')"
	         Conectar.Execute(K710)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 710 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K710 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K710)
			 ELSE
		 	   K710 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("711") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 711 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K711 = ""
			 ELSE
		 	   K711 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("711")&"')"
	         Conectar.Execute(K711)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 711 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K711 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K711)
			 ELSE
		 	   K711 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("712") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 712 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K712 = ""
			 ELSE
		 	   K712 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("712")&"')"
	         Conectar.Execute(K712)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 712 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K712 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K712)
			 ELSE
		 	   K712 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("550") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 550 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K550 = ""
			 ELSE
		 	   K550 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("550")&"')"
	         Conectar.Execute(K550)   
			 END IF
			 INSTANCIA_RECORD_1.CLOSE 
		
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 550 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K550 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K550)
			 ELSE
		 	   K550 = ""
			 END IF
		 INSTANCIA_RECORD_1.CLOSE
	END IF 
'		
IF REQUEST("806") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 806 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K806 = ""
			 ELSE
		 	   K806 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("806")&"')"
	         Conectar.Execute(K806)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 806 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K806 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K806)
			 ELSE
		 	   K806 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("823") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 823 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K823 = ""
			 ELSE
		 	   K823 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("823")&"')"
	         Conectar.Execute(K823)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 823 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K823 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K823)
			 ELSE
		 	   K823 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("551") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 551 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K551 = ""
			 ELSE
		 	   K551 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("551")&"')"
	         Conectar.Execute(K551)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 551 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K551 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K551)
			 ELSE
		 	   K551 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("807") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 807 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K807 = ""
			 ELSE
		 	   K807 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("807")&"')"
	         Conectar.Execute(K807)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 807 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K807 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K807)
			 ELSE
		 	   K807 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("824") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 824 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K824 = ""
			 ELSE
		 	   K824 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("824")&"')"
	         Conectar.Execute(K824)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 824 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K824 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K824)
			 ELSE
		 	   K824 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("552") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 552 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K552 = ""
			 ELSE
		 	   K552 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("552")&"')"
	         Conectar.Execute(K552)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 552 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K552 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K552)
			 ELSE
		 	   K552 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("808") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 808 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K808 = ""
			 ELSE
		 	   K808 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("808")&"')"
	         Conectar.Execute(K808)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 808 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K808 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K808)
			 ELSE
		 	   K808 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("825") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 825 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K825 = ""
			 ELSE
		 	   K825 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("825")&"')"
	         Conectar.Execute(K825)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 825 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K825 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K825)
			 ELSE
		 	   K825 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("553") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 553 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K553 = ""
			 ELSE
		 	   K553 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("553")&"')"
	         Conectar.Execute(K553)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 553 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K553 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K553)
			 ELSE
		 	   K553 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("809") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 809 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K809 = ""
			 ELSE
		 	   K809 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("809")&"')"
	         Conectar.Execute(K809)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 809 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K809 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K809)
			 ELSE
		 	   K809 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("826") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 826 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K826 = ""
			 ELSE
		 	   K826 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("826")&"')"
	         Conectar.Execute(K826)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 826 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K826 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K826)
			 ELSE
		 	   K826 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("554") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 554 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K554 = ""
			 ELSE
		 	   K554 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("554")&"')"
	         Conectar.Execute(K554)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 554 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K554 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K554)
			 ELSE
		 	   K554 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("810") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 810 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K810 = ""
			 ELSE
		 	   K810 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("810")&"')"
	         Conectar.Execute(K810)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 810 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K810 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K810)
			 ELSE
		 	   K810 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("827") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 827 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K827 = ""
			 ELSE
		 	   K827 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("827")&"')"
	         Conectar.Execute(K827)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 827 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K827 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K827)
			 ELSE
		 	   K827 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("555") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 555 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K555 = ""
			 ELSE
		 	   K555 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("555")&"')"
	         Conectar.Execute(K555)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 555 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K555 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K555)
			 ELSE
		 	   K555 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("811") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 811 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K811 = ""
			 ELSE
		 	   K811 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("811")&"')"
	         Conectar.Execute(K811)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 811 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K811 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K811)
			 ELSE
		 	   K811 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("828") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 828 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K828 = ""
			 ELSE
		 	   K828 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("828")&"')"
	         Conectar.Execute(K828)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 828 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K828 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K828)
			 ELSE
		 	   K828 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("798") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 798 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K798 = ""
			 ELSE
		 	   K798 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("798")&"')"
	         Conectar.Execute(K798)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 798 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K798 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K798)
			 ELSE
		 	   K798 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("799") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 799 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K799 = ""
			 ELSE
		 	   K799 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("799")&"')"
	         Conectar.Execute(K799)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 799 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K799 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K799)
			 ELSE
		 	   K799 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("780") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 780 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K780 = ""
			 ELSE
		 	   K780 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("780")&"')"
	         Conectar.Execute(K780)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 780 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K780 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K780)
			 ELSE
		 	   K780 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("557") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 557 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K557 = ""
			 ELSE
		 	   K557 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("557")&"')"
	         Conectar.Execute(K557)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 557 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K557 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K557)
			 ELSE
		 	   K557 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("813") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 813 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K813 = ""
			 ELSE
		 	   K813 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("813")&"')"
	         Conectar.Execute(K813)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 813 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K813 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K813)
			 ELSE
		 	   K813 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("830") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 830 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K830 = ""
			 ELSE
		 	   K830 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("830")&"')"
	         Conectar.Execute(K830)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 830 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K830 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K830)
			 ELSE
		 	   K830 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("558") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 558 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K558 = ""
			 ELSE
		 	   K558 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("558")&"')"
	         Conectar.Execute(K558)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 558 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K558 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K558)
			 ELSE
		 	   K558 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
'		
IF REQUEST("814") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 814 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K814 = ""
			 ELSE
		 	   K814 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("814")&"')"
	         Conectar.Execute(K814)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 814 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K814 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K814)
			 ELSE
		 	   K814 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("831") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 831 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K831 = ""
			 ELSE
		 	   K831 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("831")&"')"
	         Conectar.Execute(K831)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 831 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K831 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K831)
			 ELSE
		 	   K831 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("556") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 556 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K556 = ""
			 ELSE
		 	   K556 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("556")&"')"
	         Conectar.Execute(K556)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 556 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K556 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K556)
			 ELSE
		 	   K556 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("812") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 812 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K812 = ""
			 ELSE
		 	   K812 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("812")&"')"
	         Conectar.Execute(K812)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 812 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K812 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K812)
			 ELSE
		 	   K812 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("829") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 829 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K829 = ""
			 ELSE
		 	   K829 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("829")&"')"
	         Conectar.Execute(K829)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 829 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K829 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K829)
			 ELSE
		 	   K829 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
'		' Administración
'		
IF REQUEST("983") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 983 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K983 = ""
			 ELSE
		 	   K983 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("983")&"')"
	         Conectar.Execute(K983)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 983 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K983 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K983)
			 ELSE
		 	   K983 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("984") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 984 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K984 = ""
			 ELSE
		 	   K984 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("984")&"')"
	         Conectar.Execute(K984)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 984 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K984 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K984)
			 ELSE
		 	   K984 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
'		
IF REQUEST("985") <> "" THEN '''si viene con datos osea si sigue palomeado o es uno k acaban de palomear
	     CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 985 "
	     INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	 TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 K985 = ""
			 ELSE
		 	   K985 = "INSERT INTO CARdPantallasPaginas (Id_CARcPantallas, Id_CARcPaginas) " & _
                       " VALUES ('"&Id_CARcPantallas&"', '"&REQUEST("985")&"')"
	         Conectar.Execute(K985)   
			 END IF
			 
		 INSTANCIA_RECORD_1.CLOSE
	ELSE
	    CKUEL ="SELECT * FROM VISTA_MOD_PERFIL WHERE Id_CARcPerfilGrupo = "&Id_CARcPerfilGrupo&" AND Id_CARcPaginas = 985 "
	    INSTANCIA_RECORD_1.OPEN CKUEL, Conectar, 3, 1 
     	TotdeRegistros = INSTANCIA_RECORD_1.RECORDCOUNT
		     IF TotdeRegistros => 1 THEN
			 Id_CARdPantallasPaginas = INSTANCIA_RECORD_1("Id_CARdPantallasPaginas")
		       K985 = "DELETE CARdPantallasPaginas WHERE Id_CARdPantallasPaginas = " & Id_CARdPantallasPaginas
			   Conectar.Execute(K985)
			 ELSE
		 	   K985 = ""
			 END IF
	INSTANCIA_RECORD_1.CLOSE	 
	END IF 
	
	
		

			
			
	%>
		
  	<!-- Include File = "catalogo.inc" -->

		<%
		'END IF
	
''--------------------------------------------------------------------------------------------------------------  <>}}}}*>   %>

<HTML><link href="../Estilo.css" rel="stylesheet" type="text/css"> <HEAD>  <TITLE>   Grabado de Perfiles  </TITLE> </HEAD>
 <BODY BGPROPERTIES="fixed" BACKGROUND="../softgri1.jpg" TOPMARGIN="0" LEFTMARGIN="0"> 
  <FORM METHOD="post" ACTION= "Altas_CARdNombramientos.asp" NAME= "FormAltas">
   <BR><BR>    <CENTER>    <H2>      <FONT COLOR= #3366CC>Perfil Actualizado Correctamente</FONT>    </H2>    </CENTER>

<%%>
 
 </FORM> </BODY></HTML>

