<%
CurrentPage = 1
TotalPages = 0	
strUrl =  Request.ServerVariables("URL")
'session("list")="ModGest"
'==============  termina variables son para la PAGINACION

SUB INICIAPAGINA
'	NumPerPage = 3

    If Request.QueryString("page") = "" then
		CurrentPage = 1		'We're on the first page
		NumPerPageOf = 1
    Else
		CurrentPage = CInt(Request.QueryString("page"))     '''Pagina Actual 1 de ó 2 de:
		NumPerPageOf = ((CurrentPage * NumPerPage) - NumPerPage) + 1
    End If
    
    Number = Ob_RS2.RecordCount  '''No. de registros
    
    If Not Ob_RS2.EOF Then
    	Ob_RS2.MoveFirst
    	Ob_RS2.PageSize = Int(NumPerPage)
		TotalPages = Ob_RS2.PageCount '''No. total de paginas

		NumPerPageTo = (NumPerPageOf + NumPerPage) - 1

		if NumPerPageOf = 1 then
			if Int(Number) < Int(NumPerPage) then
				NumPerPageTo = Number
			else
				NumPerPageTo = NumPerPage
			end if
		elseif NumPerPageTo > number then
			NumPerPageTo = Number
		else
			NumPerPageTo = NumPerPageTo  '''Nomero de registros visibles en una pagina
		end if
		Ob_RS2.AbsolutePage = CurrentPage
    End If
END SUB

SUB FINPAGINA
'response.write ">>>"
'response.write CurrentPage

    If Not CurrentPage = 1 Then
		response.write("<font face='Arial Narrow'><b>Páginas:</b> </font>")
 		response.write("<a class=previous href='"+strUrl+"?NumPerPage="+CSTr(NumPerPage)+"&page="+CSTR(CurrentPage - 1)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+" '>Anterior</a>&nbsp;&nbsp; ")
		if CurrentPage > 5 and TotalPages > 10 then 
		   response.write("<a class=EnActivePage href='"+strUrl+"?NumPerPage="+CSTr(NumPerPage)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+"&page=1'>1</a>&nbsp;&nbsp;")
	    end if

		if TotalPages > 10 then
			if CurrentPage > 5 then
				if TotalPages > (CurrentPage + 5) then
					ini = (CurrentPage - 4)
					fim = (CurrentPage + 5)
				else
					ini = (TotalPages - 9)
					fim = TotalPages
				end if 
			else
				ini = 1
				fim = 10
			end if
		else
			ini=1
			fim = TotalPages
		end if
    
		For a = ini to fim
			If a = Cint(request("page")) then 
	           response.write("<font class=ActivePage>"+CSTR(a)+"</font>&nbsp;&nbsp;")
			Else 
		       response.write("<a class=EnActivePage href='"+strUrl+"?NumPerPage="+CSTR(NumPerPage)+"&amp;page="+CSTR(a)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+"'>"+CSTR(a)+"</a>&nbsp;&nbsp;")
			End if
		Next
    
    Else
   		if TotalPages = 1 then 
   				Response.write ""
		Else 
	         response.write("<font  face='Arial Narrow'><b>Páginas :</b> </font>")
 	         response.write("<font class=ActivePage><b>1</b></font>&nbsp;&nbsp;")
    	End if

    	if TotalPages > 10 then
    		fim = 10
    	else
    		fim = TotalPages
    	end if

    	For a = 2 to fim
		If a = Cint(request("page")) then 
	         response.write("<font class=ActivePage>"+ CSTR(a) +"</font>&nbsp;&nbsp;")
		Else
            response.write("<a class=EnActivePage href='"+strUrl+"?NumPerPage="+CSTR(NumPerPage)+"&page="+CSTR(a)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+"'>"+ CSTR(a) +"</a>&nbsp;&nbsp;")
		End if
		Next
    End If
    
    if CurrentPage < TotalPages - 5 and TotalPages > 10 then 
       response.write("<font class=previous>...&nbsp;</font>")
       response.write("<a class=EnActivePage href='"+strUrl+"?NumPerPage="+CSTR(NumPerPage)+"&page="+CSTR(TotalPages)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+"'>"+ CSTR(TotalPages) +"</a>&nbsp;&nbsp;")
    end if
     'Despliega la liga Siguiente si es apropiado
    If Not CurrentPage = TotalPages Then 
       response.write("<a class=EnActivePage href='"+strUrl+"?NumPerPage="+CSTR(NumPerPage)+"&page="+CSTR(CurrentPage + 1)+"&tabla_original="+Tabla+"&ID="+CSTR(ID)+"'>Siguiente</a>&nbsp;&nbsp;")
    Else
       Response.Write ("")
    End If

END SUB
%>