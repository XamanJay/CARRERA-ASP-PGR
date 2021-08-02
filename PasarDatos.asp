<%
   SET Ob_Conn = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Ob_RS   = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS2  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET Ob_RS3  = SERVER.CREATEOBJECT("ADODB.RECORDSET")
    v_ODBC  = "SIIFP_CARRERA"
	
   Ob_Conn.PROVIDER="sqloledb"
   Ob_Conn.OPEN="SERVER=10.3.194.244;DATABASE="+ V_ODBC +";UID=olugo;PWD=lugito"


SQL1 = "select * from A_Actual"

Ob_Rs.Open SQL1, Ob_Conn
OB_RS.MoveNext
DO WHILE not OB_RS.EOF
   Qry2 = "Select Id_CardDatosPersonales from CARdNombramientos where Id_CardDatosPersonales ="
   Qry2 = Qry2 +CSTR(OB_RS("Id_CardDatosPersonales"))
   Ob_Rs3.Open Qry2, Ob_Conn
   
   if OB_RS3.eof THEN 
    QryIns = "insert into CARdNombramientos (Id_CarCAdscripciones,Id_CARcTipoNombramiento,Id_CARdDatosPersonales,"
    QryIns = "Id_CarcCategoria,Id_CARcEntidadFederativa) values("
    QryIns = QryIns + CSTR(OB_RS("Id_CarCAdscripcion"))+","+CSTR(OB_RS("Id_CARcTipoNombramiento"))+","+CSTR(OB_RS("Id_CARdDatosPersonales"))
    QryIns = QryIns + CSTR(OB_RS("Id_CarcCategoria"))+","+CSTR(OB_RS("Id_CARcEntidadFederativa"))
    QryIns = QryIns + ")"
    response.write QryIns
''    response.write "<BR>"
''  response.end
''    OB_RS2.OPEN QryIns, Ob_Conn
   END IF 
   Ob_Rs3.close
  OB_RS.MOVENEXT  
  loop
response.write "A todas Madres"

Set Ob_Rs= Nothing
Set Ob_Conn= Nothing

%>
