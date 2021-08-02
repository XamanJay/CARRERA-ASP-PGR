<%
servidor = session("IP_SERVER")
usuario = Session("UserID")
password = Session("Password") 
namebd = "SIIFP"
	
Set Ob_Conn = Server.CreateObject("ADODB.CONNECTION")
Set Ob_RS = Server.CreateObject("ADODB.RECORDSET")

Ob_Conn.Provider="sqloledb"
Ob_Conn.Open="Server=" + servidor + ";Database="+ namebd + ";UID=" + usuario + ";PWD=" + password
SQL = "Select * From CARcMenuDinamico"
Ob_RS.Open SQL, Ob_Conn

'*** Contenido de los elementos del menú ***
Do until Ob_RS.Eof
	sElement = "var element_"& Ob_RS("CveElement") &" = new TPopMenu"
	sElement = sElement + "('"& Ob_RS("Titulo") &"','"& Ob_RS("ImagenIcono") &"','"& Ob_RS("TipoAccion") &"',"""& replace(Ob_RS("URL_Funcion"),"localhost",servidor) &""",'"& Ob_RS("TitBarraSta") &"');"
	'response.write sElement
	'response.write "<br>"	
	sElemContenido = sElemContenido & " " & sElement
	Ob_RS.MoveNext
Loop
'***

'*** Estructura padre/hijo de los elementos del menú ***
Ob_RS.MoveFirst
Do until Ob_RS.Eof
	if isNull(Ob_RS("CvePadre")) then
		sElement = "mm0.Add(element_"& Ob_RS("CveElement")&");"
	else
		sElement = "element_"& Ob_RS("CvePadre") &".Add(element_"& Ob_RS("CveElement") &");"
	end if
	'response.write sElement
	'response.write "<br>"	
	sElemEstructura = sElemEstructura & " " & sElement
	Ob_RS.MoveNext
Loop
'***

Set Ob_RS = Nothing
Set Ob_Conn = Nothing
%>
<script type="text/javascript" src="MenuDinamico/js/doiMenuDOM.js"></script>
<script type="text/javascript" src="MenuDinamico/js/functions.js"></script>
<script type="text/javascript">
	var mm0 = new TMainMenu('mm0','vertical');
	<%
	response.write sElemContenido
	response.write sElemEstructura
	%>	
</script>

<script language="JavaScript" type="text/JavaScript">
//xp style
	mm0.SetPosition('absolute',20,10);
	mm0.SetCorrection(0,0);
	mm0.SetCellSpacing(2);
	
	mm0.SetExpandIcon(true,'','6');
	mm0.SetType('free');
	
	//uncomment these lines to see the effect
	//mm0._header.SetBackground('red','','','');
	//mm0._header.SetFont('arial','10pt');
	//mm0._header.SetText('white','right','bold','','');
	//mm0.SetHeaderText('Click Here to get the idea');
	
	//pmHist00.SetType('h');
	//pmHome00.SetType('header');
	//mm0._pop._header.SetBackground('red','','','');
	//mm0._pop._header.SetFont('arial','10pt');
	//mm0._pop._header.SetText('white','right','bold','','');
	
	mm0.SetBackground('whitesmoke','../img/xp.gif','repeat-y','top left');		
	mm0.SetItemText('','center','','','');
	mm0.SetItemTextHL('','center','','','');
	mm0.SetItemTextClick('','center','','','');
	
	mm0.SetItemDimension(150,20);
	mm0.SetShadow(true,'#B0B0B0',6);
	mm0._pop.SetCorrection(0,0);
	mm0._pop.SetAlpha(90);
	mm0._pop.SetItemDimension(150,20);
	mm0._pop.SetPaddings(1);
	mm0._pop.SetBackground('whitesmoke','../img/xp.gif','repeat-y','top left');
	mm0._pop.SetSeparator(125,'right','gray','');
	mm0._pop.SetExpandIcon(true,'',6);
	mm0._pop.SetFont('tahoma,verdana,arial','8pt');
	mm0._pop.SetBorder(1,'gray','solid');
	mm0._pop.SetShadow(true,'#B0B0B0',6);
	mm0._pop.SetDelay(500);
	mm0.Build();
</script>