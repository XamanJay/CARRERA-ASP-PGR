<% 
' =================================================================
'  
'  Upload Control Include File
'  
' =================================================================
' Dundas Upload Control
' Copyright © Dundas Software 2000, all rights reserved
' =================================================================

' User logon type used in the ImpersonateUser method

	const	LOGON_INTERACTIVE	= 2
	const	LOGON_NETWORK		= 3
	const	LOGON_BATCH			= 4
	const	LOGON_SERVICE		= 5


' File Attributes

	const	FILE_ATTRIBUTE_READONLY			= &H1  
	const	FILE_ATTRIBUTE_HIDDEN           = &H2  
	const	FILE_ATTRIBUTE_SYSTEM           = &H4  
	const	FILE_ATTRIBUTE_DIRECTORY        = &H10  
	const	FILE_ATTRIBUTE_ARCHIVE          = &H20  
	const	FILE_ATTRIBUTE_ENCRYPTED        = &H40  
	const	FILE_ATTRIBUTE_NORMAL           = &H80  
	const	FILE_ATTRIBUTE_TEMPORARY        = &H100  
	const	FILE_ATTRIBUTE_SPARSE_FILE      = &H200  
	const	FILE_ATTRIBUTE_REPARSE_POINT    = &H400  
	const	FILE_ATTRIBUTE_COMPRESSED       = &H800  
	const	FILE_ATTRIBUTE_OFFLINE          = &H1000  


' Generic Access Rights
	const	GENERIC_ALL				= &H10000000
	const	GENERIC_EXECUTE			= &H20000000
	const	GENERIC_WRITE			= &H40000000
	const	GENERIC_READ			= &H80000000

' Standard Access Rights
	const	DELETE					= &H00010000
	const	READ_CONTROL			= &H00020000
	const	WRITE_DAC				= &H00040000
	const	WRITE_OWNER				= &H00080000
	const	WRITE_SYNCHRONIZE		= &H00100000


' Specific Access Rights for Files
	const	FILE_GENERIC_READ		= &H120089
	const	FILE_GENERIC_WRITE		= &H120116
	const	FILE_GENERIC_EXECUTE	= &H1200A0
	
	const	FILE_READ_DATA			= &H0001
	const	FILE_WRITE_DATA			= &H0002
	const	FILE_APPEND_DATA		= &H0004
	const	FILE_READ_EA			= &H0008
	const	FILE_WRITE_EA			= &H0010
	const	FILE_EXECUTE			= &H0020
	const	FILE_READ_ATTRIBUTES	= &H0080
	const	FILE_WRITE_ATTRIBUTES	= &H0100
	const	FILE_ALL_ACCESS			= &H001f03ff
%>