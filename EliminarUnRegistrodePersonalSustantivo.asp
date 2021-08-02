<html><head><title>Borrar un registro de personal sustantivo</title></head><body>

<%

    QUITAR           =  request("Borrar")
	Id_CardDatosPersonales = TRIM(REQUEST.QUERYSTRING("Id_CardDatosPersonales")) 


IF QUITAR = "SI" THEN  %>

 <%SET Conectar     = SERVER.CREATEOBJECT("ADODB.CONNECTION")
   SET Record       = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET rs_VALIDA = SERVER.CREATEOBJECT("ADODB.RECORDSET")
   SET rs_SUB_DEL= SERVER.CREATEOBJECT("ADODB.RECORDSET")
   
   Conectar.PROVIDER="sqloledb"
   Conectar.OPEN= "SERVER="+ session("IP_DATOS") +";DATABASE="+ODBC+";UID=" + Session("UserID") + ";PWD=" + Session("Password")

%>
  
  <%
EliminarPersonaSus = "DELETE CardDatosPersonales WHERE Id_CardDatosPersonales = "&Id_CardDatosPersonales
Conectar.Execute(EliminarPersonaSus)

ELSE  %>

<script type="text/javascript">

     

     {
     var r=confirm("ELIMINACIÓN DEL REGISTRO DE PERSONAL SUSTANTIVO,                            SI OPRIME --Aceptar-- SE ELIMINARA DEFINITIVAMENTE EL REGISTRO DE ESTA PERSONA,      ¿ESTA USTED SEGURO DE ELIMINAR ESTE REGISTRO...? - ")
     if (r==true)
     {
	 document.location="EliminarUnRegistrodePersonalSustantivo.asp?Id_CardDatosPersonales=<%= Id_CardDatosPersonales%>&borrar=SI"
     }
     }
   </script>



<%END IF   %>

</body></html>

<script>
document.location="CONFIRMACIONBORRADOS.asp?QUITAR=<%=QUITAR%>"
</script>