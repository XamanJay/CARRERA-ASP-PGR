<%
SUB VALBD(sPantalla,sWhereR,sDatoValidar,sIdentificadorReg,sAnioReg,sSub,sDel,sAge,sMes,sUsu,sResp)

			vd_Subpro = sSub 
			vd_Deleg = sDel
			vd_Agen = sAge
			vd_Mesa = sMes
			vd_Usu = sUsu
			vd_Resp = sResp
		
			SET sxOb_Conn= SERVER.CREATEOBJECT("ADODB.CONNECTION")
			SET sxOb_RS = SERVER.CREATEOBJECT("ADODB.RECORDSET")
			SET sxOb_Resultado = SERVER.CREATEOBJECT("ADODB.RECORDSET")
			
			v_ODBC  = SESSION("VARDNS")
			sxOb_Conn.Open v_ODBC
			
			vd_Pantalla = sPantalla
			query = "SELECT * FROM SPGRsValidaciones WHERE pantalla = '"+vd_Pantalla+"'"

			sxOb_RS.open query,sxOb_Conn
			Do While Not sxOb_RS.EOF
		
			'------------Validación de fechas-------------------'
			vd_CadenaSelect = sxOb_RS("dato_para_buscar")
			vd_Tabla = sxOb_RS("SPGRsTabla")
			vd_CadenaWhereL=sxOb_RS("cadena_Where_L")
			vd_CadenaWhereR=sWhereR
			vd_FechaPorValidar=sDatoValidar
			vd_procedimiento=sxOb_RS("procedimiento")
			vd_operador_validacion=sxOb_RS("operador_validacion")
			vd_error_message=sxOb_RS("error_message")
			vd_noerror_message=sxOb_RS("noerror_message")
			'-------Existencia de Averiguación Previa------------'
			vd_AP=sIdentificadorReg
			vd_Anio_AP=sAnioReg
			
			Select Case vd_procedimiento
				Case "sp_Existe_AP":
					Query ="exec "+vd_Procedimiento+" '"+vd_AP+"',"+vd_Subpro+","+vd_Deleg+","+vd_Agen+","+vd_Mesa+","+vd_Usu+","+vd_Resp+","+vd_Anio_AP
				Case "sp_ValidaFecha":
					Query ="exec "+vd_Procedimiento+" '"+vd_CadenaSelect+"','"+vd_Tabla+"','"+vd_CadenaWhereL+"','"+vd_CadenaWhereR+"',"+"'"+vd_FechaPorValidar+"','"+vd_operador_validacion+"'"
			End Select
			
			sxOb_Resultado.Open Query, sxOb_Conn    
			vd_TipoRespuesta=sxOb_Resultado("vl_TipoRespuesta")
			sxOb_Resultado.Close
	
			Select Case cint(vd_TipoRespuesta)
				Case 0:
					response.Clear 
					%>
					<script>
						{alert('<%=vd_error_message%>');
						history.back();
						}
					</script>
					<% 
					sxOb_RS.close
					sxOb_Conn.close			
					response.end
				Case 1:
					%><script>
						{alert("TABLA: "+'<%=vd_Tabla%>'+", DATO: "+'<%=vd_FechaPorValidar%>'+"correcto");}
					</script><%
			End Select

		sxOb_RS.movenext
		loop 
	
		sxOb_RS.close
		sxOb_Conn.close 

END SUB %>
