<%
Function cDateFormat(strNow,intDateFormat)
	'|Formats Available
	'|
	'| Format_1: 12 April 2001
	'| Format_2: 12/04/2001
	'| Format_3: 14:38:11
	'| Format_4: 14:38
	'| Format_5: Twelve/April/2001 14:38:11
	'| Format_6: Twelve of April 2001
	'| Format_7: 20010412143811
	'| Format_8: 04/12/2001 14:38:11
	'| Format_9: 04/12/2001	
'---------------------------[Date Format Process]--------------------------
	Dim strTimeNow
	Dim strDay
	Dim strMonth
	Dim strYear
	
	Dim strHour
	Dim strMinute
	Dim strSecond
	Dim arrMonth(12)
	Dim arrDay(31)
	
	' Array Of Months
	arrMonth(1) = "Ene"
	arrMonth(2) = "Feb"
	arrMonth(3) = "Mar"
	arrMonth(4) = "Abr"
	arrMonth(5) = "May"
	arrMonth(6) = "Jun"
	arrMonth(7) = "Jul"
	arrMonth(8) = "Ago"
	arrMonth(9) = "Sep"
	arrMonth(10) = "Oct"
	arrMonth(11) = "Nov"
	arrMonth(12) = "Dic"
	
	' Array Of Days
	arrDay(1) = "1"
	arrDay(2) = "2"
	arrDay(3) = "3"
	arrDay(4) = "4"
	arrDay(5) = "5"
	arrDay(6) = "6"
	arrDay(7) = "7"
	arrDay(8) = "8"
	arrDay(9) = "9"
	arrDay(10) = "10"
	arrDay(11) = "11"
	arrDay(12) = "12"
	arrDay(13) = "13"
	arrDay(14) = "14"
	arrDay(15) = "15"
	arrDay(16) = "16"
	arrDay(17) = "17"
	arrDay(18) = "18"
	arrDay(19) = "19"
	arrDay(20) = "20"
	arrDay(21) = "21"
	arrDay(22) = "22"
	arrDay(23) = "23"
	arrDay(24) = "24"
	arrDay(25) = "25"
	arrDay(26) = "26"
	arrDay(27) = "27"
	arrDay(28) = "28"
	arrDay(29) = "29"
	arrDay(30) = "30"
	arrDay(31) = "31"
	
	strTimeNow  = strNow

	If Day(strTimeNow) < 10 Then
		 strDay = "0" & Day(strTimeNow)
	Else
		 strDay = Day(strTimeNow)
	End If

	If Month(strTimeNow) < 10 Then
	 strMonth = "0" & Month(strTimeNow)
	Else
	 strMonth = Month(strTimeNow)
	End If
	
	strYear = Year(strTimeNow)
	
	If Hour(strTimeNow) < 10 Then
	 strHour = "0" & Hour(strTimeNow)
	Else
	 strHour = Hour(strTimeNow)
	End If
	
	If Minute(strTimeNow) < 10 Then
	 strMinute = "0" & Minute(strTimeNow)
	Else
	 strMinute = Minute(strTimeNow)
	End If
	
	If Second(strTimeNow) < 10 Then
	 strSecond = "0" & Second(strTimeNow)
	Else
	 strSecond = Second(strTimeNow)
	End If
	
	'-----------------------------------------------[Date Formats Standard + Extra]-------------------------------
	IF intDateFormat = 0 Then
	 cDateFormat = strDay & "/" & strMonth & "/" & strYear & " " &  strHour & strMinute & strSecond
	Elseif intDateFormat = 1 Then
	 cDateFormat = strDay & " " & arrMonth(strMonth) & " " & strYear
	Elseif intDateFormat = 2 Then
	 cDateFormat = strDay & "/" &  strMonth & "/" &  strYear
	Elseif intDateFormat = 3 Then
	 cDateFormat = strHour & ":" & strMinute & ":" & strSecond
	Elseif intDateFormat = 4 Then
	 cDateFormat = strHour & ":" & strMinute
	Elseif intDateFormat = 5 Then
	 cDateFormat = arrDay(strDay) & "/" &  arrMonth(strMonth)  & "/" & strYear & " " & strHour & ":" & strMinute & ":" & strSecond
	Elseif intDateFormat = 6 Then
	 cDateFormat = arrDay(strDay) & " de " &  arrMonth(strMonth)  & " de " & strYear
	Elseif intDateFormat = 7 Then
	 cDateFormat = strYear & strMonth & strDay & strHour & strMinute & strSecond
	Elseif intDateFormat = 8 Then
	 cDateFormat = strMonth & "/" & strDay & "/" & strYear & " "  & strHour & ":" & strMinute & ":" & strSecond
	Elseif intDateFormat = 9 Then
	 cDateFormat = strMonth & "/" & strDay & "/" & strYear
	End If
	'-----------------------------------------------[/Date Formats Standard + Extra]-------------------------------
	
	'---------------------------[/Date Format Process]--------------------------
End Function

FUNCTION CFecha (sDate)
	'*** Esta rutina cambia la posición de los
	'*** días y meses
	Dim sF
	Dim lnFecha
	Dim nDiag1, nDiag2
	sF = sDate
	lnFecha = len(sF)
	nDiag1 = InStr(sF,"/")
	nDiag2 = InStrRev(sF,"/")
	Dim d,m,y
	d = mid(sF,1,nDiag1-1)
	m = mid(sF,nDiag1+1,(nDiag2-nDiag1)-1)
	y = mid(sF,nDiag2+1,lnFecha)
		CFecha = m &"/"& d &"/"& y
END FUNCTION

FUNCTION LCadena(sCad)
	Dim sCadena
	'sCadena = replace(sCad,"'","''")
	'sCadena = replace(sCadena,""","""")
	'sCadena = trim(sCadena)
	'LCadena =sCadena
END FUNCTION
%>
	