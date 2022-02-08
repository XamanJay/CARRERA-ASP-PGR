function window_open(formulario,objeto)
{
var formulario = formulario
var objeto = objeto

var newWindow;
var urlstring = "Calendario/Calendar.asp?forma="+ formulario +  "&objeto=" + objeto
newWindow = window.open(urlstring,'','height=200,width=280,toolbar=no,minimize=no,status=no,memubar=no,location=no,scrollbars=no')
}
