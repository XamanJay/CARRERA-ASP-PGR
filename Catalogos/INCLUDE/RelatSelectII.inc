<%
SUB RelatSelectIIODBC(dsn,table)
	Set Ob_Conn = Server.CreateObject("ADODB.Connection")
	Set Ob_RS = Server.CreateObject("ADODB.RecordSet")
	Ob_Conn.Open dsn
	
	sql = "select IdElemento from "& table &" order by Elemento"
	Ob_RS.Open sql, Ob_Conn, adOpenStatic
	
	dim aElementos()
	Redim aElementos(nTotReg+1)
	
	i=1
	Do Until Ob_RS.Eof
		Redim Preserve aElementos(i+1)
		aElementos(i) = Ob_RS("IdElemento")
		i=i+1
		Ob_RS.MoveNext
	Loop
	
	nTotReg = i-1
	%>
	  <script language="JavaScript"> 
	
	   function addOpt(oCntrl, iPos, sTxt, sVal){ 
	     var selOpcion=new Option(sTxt, sVal); 
	     eval(oCntrl.options[iPos]=selOpcion); 
	   } 
	
	   function refresca(oCntrl_1,oCntrl_2,oCntrlEmpty,oCntrlEmpty2,oCntrlEmpty3,indice){ 
	   	if (oCntrlEmpty != 0)
		   	{
		   	while (oCntrlEmpty.length) 
		   		oCntrlEmpty.remove(0);
		   	}
	   	if (oCntrlEmpty2 != 0)
		   	{
		   	while (oCntrlEmpty2.length) 
		   		oCntrlEmpty2.remove(0);
		   	}
	   	if (oCntrlEmpty3 != 0)
		   	{
		   	while (oCntrlEmpty3.length) 
		   		oCntrlEmpty3.remove(0);
		   	}
		   		
	    while (oCntrl_2.length) 
	    	oCntrl_2.remove(0); 
	    	
	    switch (oCntrl_1.value){ 
	    <%
	    For i = 1 to nTotReg%>
	    	<%
	    	Ob_RS.Close
	    	sql = "select * from "& table &" where IdPadre = '"& aElementos(i) &"' order by Elemento"
			Ob_RS.Open sql, Ob_Conn
    		nPos = 1
	    	nCase = 0
	    	Do Until Ob_RS.Eof    			
				If nCase = 0 Then%>
	  				case '<%=aElementos(i)%>':
	  				    addOpt(oCntrl_2, "", "-seleccionar-", "0");
	   				<%nCase = 1
	   			End If%>
						addOpt(oCntrl_2, <%=nPos%>, "<%=replace(Ob_RS("Elemento"),"""","")%>", "<%=Ob_RS("IdElemento")%>");
	   				<%nPos = nPos + 1
	    		Ob_RS.MoveNext
				If Ob_RS.Eof and nCase = 1 Then%>
						break;
	   			<%End If 
	    	Loop
	    Next
	    Ob_RS.Close%>
	    } 
	   } 
	  </script> 
	<%
	Set Ob_RS = Nothing
	Set Ob_Conn = Nothing
	
END SUB


%>