 <%@ Language=VBScript %>
  <%Dim sRTF, sFileName, sConn, varTexto

   Dim fso, MyFile
   Set fso = server.CreateObject("Scripting.FileSystemObject")
   
                    sFileName = "GRECA_M"+cstr(Request("par_Id_aplicacion"))+"_"+trim(request("par_Id_menupadre"))+".asp"
   
   
      Set utilities=Server.CreateObject("MSWC.Tools")
if        utilities.FileExists(sFileName) = -1 then
    
	      Response.Redirect(sFileName)
else
 
 
 
  Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
  Set Ob_RS = Server.CreateObject ("ADODB.RecordSet")
  Set Ob_RSInd = Server.CreateObject ("ADODB.RecordSet")
  Ob_Conn.Provider="sqloledb"
 Ob_Conn.Open="SERVER="+ session("IP_DATOS") +";Database=GCAgreca;UID="&session("UserID")&";PWD="&session("Password")

  
   
   Response.Buffer = True

   Set MyFile = fso.createTextFile(Server.MapPath(".") & "\" & sFileName, True)

   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Server.MapPath("GRECA_menu3.asp"), 1)
  

   
    Set rs = Server.CreateObject("ADODB.Recordset")   
	
		rs.Open "select * from gcdmenus where id_menu_padre = '" & request("var_Id_gcdmenus") & "'"& " order by gcdorden ", ob_conn, 3
		                                                        
  varTexto = f.ReadAll
  rs.movefirst
  cad_sustitucion=""
   
 
 cad_titulo=cad_titulo+"<img src='Multimedia/imagenes/menus/circulo01.gif'>"+request("par_Id_menupadre")+chr(13)
 do until rs.Eof
 cad_sustitucion=cad_sustitucion+"<p style='margin-left: -1; margin-right: -1'>"+chr(13)
 cad_sustitucion=cad_sustitucion+"<div class='look'>"
  response.write rs("gcdtipo").value
 if rs("gcdtipo").value=true then                                                                                                                                                                                                                                                                                                                                                                                                                                                                               '
	 cad_sustitucion=cad_sustitucion+"<img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='mainFrame' href='" + rs("gcdservidorapp").value + rs("gcddirvirtapp").value+ rs("gcdnombrearchapp").value+"?"+ "var_Id_gcdmenus=" + cstr(rs("Id_gcdmenus")) +"&"+"par_Id_menupadre=" + cstr(rs("gcdmenus"))+"&"+"par_Id_aplicacion="+Request("par_Id_aplicacion")+"'>" + rs("gcdmenus").Value+"</a></td><hr></div>"'+chr(13)
 else
  	 cad_sustitucion=cad_sustitucion+"<img src='Multimedia/imagenes/menus/circulo.gif' class='folding' width='10' height='10'><a target='leftFrame' href='" + rs("gcdservidorapp").value + rs("gcddirvirtapp").value+ rs("gcdnombrearchapp").value+"?"+ "var_Id_gcdmenus=" + cstr(rs("Id_gcdmenus")) +"&"+"par_Id_menupadre=" + cstr(rs("gcdmenus"))+"&"+"par_Id_aplicacion="+Request("par_Id_aplicacion")+"'>" + rs("gcdmenus").Value+"</a></td><hr></div>"'+chr(13)
 end if
  rs.MoveNext
	loop
   cad_sustitucion=cad_titulo+cad_sustitucion+"</ul> </div><br>"
   varTexto = replace(varTexto,"<opcion>",cad_sustitucion)
  
	
    MyFile.WriteLine(varTexto) 


    f.Close
    Set f=Nothing
    Set fs=Nothing
  

   rs.Close
   OB_conn.Close
   Set rs = Nothing
   Set Ob_conn = Nothing
   


   MyFile.WriteLine("")
   MyFile.Close

   Response.Write _
       "<META https-EQUIV=""REFRESH"" Content=""0;URL=" & sFileName & """>"
end if
%>