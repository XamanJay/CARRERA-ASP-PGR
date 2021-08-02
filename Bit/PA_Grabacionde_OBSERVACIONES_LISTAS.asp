<html><head><title>En esta pagina solo voy a ejecutar el store procedure de PA_OBSERVACIONES_LISTAS</title>
<style type="text/css">
<!--
.Estilo1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head><body bgproperties="fixed" background = "../Multimedia/imagenes/softgri1.jpg">
<link  rel="stylesheet" type="text/css" href="../Estilo.css" >

<%    Set Ob_Conn_po = Server.CreateObject ("ADODB.Connection")
      Set Ob_RS_po = Server.CreateObject ("ADODB.RecordSet")
	  Set Ob_RS_sp = Server.CreateObject("ADODB.RecordSet")
	   Set Ob_RS_sp_1 = Server.CreateObject("ADODB.RecordSet")
	 Ob_Conn_po.PROVIDER="sqloledb"
     Ob_Conn_po.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE=EVALUA;UID=" + Session("UserID") + ";PWD=" + Session("Password")
	 
  FechaEvaluacion    = TRIM (REQUEST.FORM("FechaEvaluacion"))
  NoRegistro_FOLIO   = TRIM (REQUEST.FORM("NoRegistro_FOLIO"))
  GrupoEspecial      = TRIM (REQUEST.FORM("GrupoEspecial"))
  Nombre             = TRIM (REQUEST.FORM("Nombre"))
  Paterno            = TRIM (REQUEST.FORM("Paterno"))
  Materno            = TRIM (REQUEST.FORM("Materno"))
  TipoExamen         = TRIM (REQUEST.FORM("TipoExamen"))
  OpcionDesdemenu_1  = TRIM (REQUEST.FORM("OpcionDesdemenu_1"))
  
              subb  = CSTR (TRIM (REQUEST.FORM("sub"))) '' Este ya recibe el Id_PLAdPersonas   Correcto
				 Lista = "Id_PLAdListas_"&subb
				     Asistencia = "Asistencia_"&subb
				        Observa = "Id_PLAdPersonas_"&subb
				         
	'''response.write(Asistencia)
	'''response.write(Observa)
	'''response.write(subb&"<-----")
	'''response.end 
IF subb <> ""  THEN
        var_sp_1 = "exec PA_OBSERVACIONES_LISTAS " & subb &", " & request.form(Lista) & _
                   ", '" & request.form(Observa) & "', " & request.form(Asistencia)
				  ''' response.write(var_sp_1)
				   '''response.end 
	   Ob_RS_sp_1.Open var_sp_1, ob_conn_po 
	   Ob_Conn_po.Close  
	   
ELSEIF subb = "" THEN
  
  
  IF OpcionDesdemenu_1 = 1 THEN  
    
			'var_query = "SELECT * FROM VISTA_LISTAS " & _
           '  " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
           '  " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
           '  " AND Id_PLAcTipoEvaluacion = "&TipoExamen   
			 
			 var_query = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
             " AND FechaProg = '"&FechaEvaluacion&"'" & _
			 " AND Id_PLAcTipoEvaluacion = "&TipoExamen '''hasta aqui voy bien
			
  ELSEIF OpcionDesdemenu_1 = 2 THEN
  var_query = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
             " AND Id_PLAcGrupoEspecial = "&GrupoEspecial& " AND Id_PLAcTipoEvaluacion = "& TipoExamen
  
  
  
  
  ELSE
            var_query = "SELECT * FROM VISTA_LISTAS " & _
             " WHERE NO_Registro  LIKE '%"&NoRegistro_FOLIO&"%' AND Paterno LIKE '%"&Paterno&"%' " & _ 
             " AND Materno LIKE '%"&Materno&"%' AND Nombre LIKE '%"&Nombre&"%' " & _
              " AND Id_PLAcGrupoEspecial = "&GrupoEspecial& " AND FechaProg = '"&FechaEvaluacion&"'" & _
			 " AND Id_PLAcTipoEvaluacion = "&TipoExamen   '''hasta aqui voy bien
			 
			 
			 
  
  END IF   ''''' T E R M I N A
			''' response.write(var_query)
			 '''response.end 
			     
	
 
		Ob_RS_po.Open var_query, ob_conn_po %>
	     <% do until Ob_RS_po.Eof %>  
		 <%  '''ejempl:: var_x1=rtrim(ltrim(Ob_RS_po("Id_C")))'''con esto y con el do until se cuantos van a SER 
                                                                  	 '' por el query que esta arriba
   	     var_x1=TRIM(Ob_RS_po("Id_PLAdPersonas"))
		 var_x1="Id_PLAdPersonas_"&var_x1      '''Las observaciones si se grabaron
		
		 var_x2=TRIM(Ob_RS_po("Id_PLAdPersonas"))   '''con esto obtengo los mismo nombres pra que en el exec que esta dentro de un do until el request form obtenga los valores de la pagina anterior
		 var_x2="Asistencia_"&var_x2   '''Un bit de asistencia
		 '''var_x2= cstr(var_x2)
          IF request.form(var_x2) = 1 THEN
		    var_x2 = 1
			
		  ELSEIF request.form(var_x2) = 0 THEN ' si se guarda un cero es que ya tenia un uno y entonces hay que regresarlo
		   '''' var_x2 = "NULL"
		   var_x2 = 1
		   
		   ELSE 
		   var_x2 = "NULL"
		  END IF 

	      var_sp = "exec PA_OBSERVACIONES_LISTAS " & Ob_RS_po("Id_PLAdPersonas_Listas")&", " & Ob_RS_po("Id_PLAdListas") & _
	               ", '" & request.form(var_x1) & "', " & var_x2
			 
			  
           'con este request.form(var_x1)y var_x2 obtengo los ""VALUES"" de los distintos imput y checks selects de de la pagina...rel_concurso_e_instructores
			 
			''' response.Write(var_sp+chr(13)) 'para revisar la impresión de los exec por pantalla
			''' response.end 
			
           Ob_RS_sp.Open var_sp, ob_conn_po 
	        Ob_RS_po.MoveNext

            LOOP
          Ob_RS_po.Close
         Ob_Conn_po.Close 
		 
 END IF  %>
  
  <br><br><br><br>
         <hr>	  
<center>
  <p class="Estilo1">
    <label><font size="4">Registro(s) Grabado(s) Correctamente</font> 
    </label>
  </p>
</center>
      <hr>
	  <br>
	  <br><br> 
</body></html>


