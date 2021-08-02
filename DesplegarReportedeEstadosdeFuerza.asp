<%reportname    = "EstadodeFuerza.rpt"%>
<!-- #include file="AlwaysRequiredSteps.asp" --> 
<%
Set mainReportTableCollection = Session("oRpt").Database.Tables

For Each mnTable in mainReportTableCollection
  With mnTable.ConnectionProperties
   .Item("user ID") = "UserCarreraSql"
   .Item("Password") = "b7b592504f95b4dab4a3d7225bb9655f"
   .Item("DSN") = "CarreraPGR"
   .Item("Database") ="SIIFP"
  End With
Next

Id_CARcSubprocuradurias    = REQUEST.QUERYSTRING("Id_CARcSubprocuradurias") 
Id_CARcDG_o_Delegaciones       = REQUEST.QUERYSTRING("Id_CARcDG_o_Delegaciones")

IF NOT (Id_CARcSubprocuradurias = "" )  THEN Session("oRpt").ParameterFields.GetItemByName("Id_CARcSubprocuradurias").AddCurrentValue(CInt(Id_CARcSubprocuradurias)) END IF
IF NOT (Id_CARcDG_o_Delegaciones = "" )  THEN Session("oRpt").ParameterFields.GetItemByName("Id_CARcDG_o_Delegaciones").AddCurrentValue(CInt(Id_CARcDG_o_Delegaciones)) END IF

%>
<!-- #include file="MoreRequiredSteps.asp" -->
<!-- #include file="SmartViewerActiveX.asp" --> 