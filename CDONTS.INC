  <%
  ‘ Constantes CDONTS 
 
  ‘ CDONTS Attachment.Type values
  Const CdoFileData = 1
  Const CdoEmbeddedMessage = 4
 
  ‘ Valores CDONTS para Message.Importance.  También usados en NewMail.Importance
  Const CdoLow = 0
 Const CdoNormal = 1
 Const CdoHigh = 2
 
 ‘ Valores CDONTS para Message.MessageFormat y Session.MessageFormat 
 Const CdoMime = 0
 Const CdoText = 1
 
 ‘ Valores CDONTS para NewMail.AttachFile y NewMail.AttachURL EncodingMethod 
 Const CdoEncodingUUencode = 0
 Const CdoEncodingBase64 = 1
 
 ‘ Valores CDONTS para NewMail.BodyFormat 
 Const CdoBodyFormatHTML = 0
 Const CdoBodyFormatText = 1
 
 ‘ Valores CDONTS para NewMail.MailFormat
 Const CdoMailFormatMime = 0
 Const CdoMailFormatText = 1
 
 ‘ Valores CDONTS para Recipient.Type
 Const CdoTo = 1
 Const CdoCc = 2
 Const CdoBcc = 3
 
 ‘ Valores CDONTS para Session.GetDefaultFolder
 Const CdoDefaultFolderInbox = 1
 Const CdoDefaultFolderOutbox = 2
 
 %>
