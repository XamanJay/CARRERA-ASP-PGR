<%
	SET NuevoObjCorreo 	= CREATEObject("CDONTS.NewMail")
	NuevoObjCorreo.FROM 	= "cnavab@pgr.gob.mx"
	NuevoObjCorreo.TO 	= "cnavab@pgr.gob.mx"
	NuevoObjCorreo.SUBJECT	= "Prueba"
	NuevoObjCorreo.BODY	= "Este es solo un mensaje de prueba"
	NuevoObjCorreo.SEND	
	SET NuevoObjCorreo = NOTHING
%>