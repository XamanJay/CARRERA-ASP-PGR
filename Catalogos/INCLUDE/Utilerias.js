<SCRIPT>
//******************************************
//*** Validación del formato de las Fechas 	***
//*** en E=Español o I=Ingles			***
//******************************************

   fnumeros="0123456789";
   var separadorfecha="/";
   ferror= new creaferror();  
   ferrores= new Array();
  
   ferrores[1]="El  campo fecha  no contiene ningún valor ";
   ferrores[2]="Carácter ilegal en uno de los campos fecha";
   ferrores[3]="Faltan separadores en uno de los campos campo fecha";
   ferrores[4]="Año incorrecto en campo uno de los campos fecha";
   ferrores[5]="Mes incorrecto en campo uno de los campos fecha";
   ferrores[6]="Día incorrecto en campo uno de los campos fecha";
   ferrores[7]="Carácter ilegal en una hora";
   ferrores[8]="Faltan separadores en una hora";
   ferrores[9]="Hora incorrecta en una hora";
   ferrores[10]="Minutos incorrectos en una hora";
   ferrores[11]="Segundos incorrectos en una hora";
  
   // Crea un objeto que guarda un indice a la posición y al mensaje de ferror
   function creaferror()
   {
   this.valor=0;
   this.posicion=0;
   return this
   }
  
   // Determina si un caracter es un número
   function fnumero(car)
   {
   return (fnumeros.indexOf(car)>=0)
   }
   
   // Determina si un año es bisiesto
   function bisiesto(anio) 
   {
   if (((anio % 4 == 0) && anio % 100 != 0) || anio % 400 == 0) 
      return true;
   return false;
   }

   // Comprueba si una fecha es correcta
  function esFecha(contenido,tipo)
  {
   
 	  if (tipo == 'I' || tipo == 'E')
	   {
	   		//***
	   }
	   else
	   {
	   		alert("Introducir correctamente el tipo de fecha (I: Ingles ó E: Español)")
	   		return false;
	   }
   
  var nsep=0;
   // Comprobación de la sintáxis de una fecha 
   for (var i=0; i<contenido.length; ++i)
      {
      var car=contenido.charAt(i);
      if (!fnumero(car)&&car!=separadorfecha)
         {
         ferror.valor=2;
         ferror.posicion=i+1; 
         return false;
         } 
      if (car==separadorfecha)
        nsep++ 
      }
   if (nsep!=2)
      {
      ferror.valor=3;
      ferror.posicion=i+1; 
      return false;
      }
   // Comprobación de la semántica de una fecha
   var pos1=contenido.indexOf(separadorfecha);
   
   if (tipo == 'E')
   	var dia=contenido.substring(0,pos1);
   if (tipo == 'I')
    var mes=contenido.substring(0,pos1);
    
   var pos2=contenido.indexOf(separadorfecha,pos1+1);
   
   if (tipo == 'E')
   	var mes=contenido.substring(pos1+1,pos2); 
   if (tipo == 'I')
    var dia=contenido.substring(pos1+1,pos2); 
    
   var anio=contenido.substring(pos2+1,10);
   if (anio<999||anio>=3000)
      {
      ferror.valor=4;
      ferror.posicion=6; 
      return false;
      } 
     if (mes<1||mes>12)
      {
      ferror.valor=5;
      ferror.posicion=4;
      return false;
      }
   if ((mes==04&&dia>30)||(mes==06&&dia>30)||(dia<1 || dia>31)
         ||(mes==09&&dia>30)||(mes==11&&dia>30)
         ||(mes==02&&bisiesto(anio)&&dia>29)
         ||(mes==02&&!bisiesto(anio)&&dia>28)
         )
      {
      ferror.valor=6;
      ferror.posicion=2;
      return false;
      } 
   return true 
   }
</SCRIPT>

<SCRIPT>
//********************************************************** 
//*** Validación entre 2 fechas (F1=Fecha 1 y F2=Fecha 2)		***
//*** El criterio a validar es: 					***
//*** F1 <= F2 (Fecha 1 es menor igual a la Fecha 2) 			***
//*** F1 < F2 (Fecha 1 es menor a la Fecha 2) 			***
//*** F1 = F2 (Fecha 1 es igual a la Fecha 2) 			***
//*** Nota: Solo aplica para fechas en Español		 	***
//**********************************************************
function comparaFechas(F1,criterio,F2,msg)
{ 
	flag = false
	
	if (criterio == 'menor_igual' || criterio == 'menor' || criterio == 'igual')
	{
		//**
	}	
	else
	{
		alert("¡¡Criterio incorrecto. (menor_igual, menor, igual)!!")
		return flag
	}
	if (msg == '1' || msg == '0' )
	{
		//**
	}	
	else
	{
		alert("¡¡Introduca correctamente el parametro para el despliegue de mensajes (1 ó 0)!!")
		return flag
	}	

// -----------   ESTRAIGO LOS INDICES Y SECCIONES DE LA FECHA UNO  --------------
// ... Extraigo Indices de la Fecha Uno  ...
	var LongitudUno = F1.length;
	var Indice1Uno = F1.indexOf("/");
	var Indice2Uno = F1.lastIndexOf("/");
// ... Extraigo cada sección de la Fecha Uno ...
	var DiaUno = Number(F1.substring(0, Indice1Uno));  
	var MesUno = Number(F1.substring(Indice1Uno+1, Indice2Uno));  
	var AnioUno = Number(F1.substring(Indice2Uno+1, LongitudUno));  

// -----------   ESTRAIGO LOS INDICES Y SECCIONES DE LA FECHA DOS  --------------
// ... Extraigo Indices de la Fecha Dos  ...
	var LongitudDos = F2.length;
	var Indice1Dos = F2.indexOf("/");
	var Indice2Dos = F2.lastIndexOf("/");
// ... Extraigo cada sección de la Fecha Dos ...	
	var DiaDos = Number(F2.substring(0, Indice1Dos));  
	var MesDos = Number(F2.substring(Indice1Dos+1, Indice2Dos));  
	var AnioDos = Number(F2.substring(Indice2Dos+1, LongitudDos));  
	
	if (criterio == 'menor_igual' || criterio == 'menor')
	{
		if (AnioUno > AnioDos)
		{
			if (msg == 1) {alert("El año " + AnioUno + " es mayor al año"+ AnioDos);}
			flag = false;
		}
		else
		{
			if(AnioUno == AnioDos)
			{
				if(MesUno > MesDos)
				{
					if (msg == 1) {alert("El mes "+ MesUno +" es mayor al mes "+ MesDos );}
					flag = false;
				}
				else
				{
					if(MesUno == MesDos)
					{
						//*** Criterios ***
						if (criterio == 'menor_igual')
						{
							if(DiaUno > DiaDos)
							{
								if (msg == 1) {alert("El dia "+ DiaUno +" es mayor al dia "+DiaDos);}					
								flag = false;
							}
							else
							{
							flag=true;
							}
						}
						if (criterio == 'menor')
						{
							if(DiaUno >= DiaDos)
							{
							if (msg == 1) {alert("El dia "+ DiaUno +" es igual al día "+DiaDos);}					
								flag = false;
							}
							else
							{
								flag=true;
							}
						}					
						//*** Fin de Criterios ***
					}
					else
					{
						flag = true
					}
				}
			}
			else
			{
				flag = true
			}
		}
	}
	
	if (criterio == 'igual')
	{
		if (AnioUno != AnioDos)
		{
			if (msg == 1) {alert("El año " + AnioUno + " es diferente al año "+ AnioDos);}
			flag = false;
		}
		else
		{
			if(AnioUno == AnioDos)
			{
				if(MesUno != MesDos)
				{
					if (msg == 1) {alert("El mes "+ MesUno +" es diferente al mes "+ MesDos );}
					flag = false;
				}
				else
				{
					if(MesUno == MesDos)
					{
						if(DiaUno != DiaDos)
						{
							if (msg == 1) {alert("El dia "+ DiaUno +" es diferente al dia "+DiaDos);}					
							flag = false;
						}
						else
						{
							flag=true;
						}					
					}
					else
					{
						flag = true
					}
				}
			}
			else
			{
				flag = true
			}
		}
	
	}

return flag;
} 
</SCRIPT> 

<SCRIPT> 
//**************************************************
//*** Validación de datos númericos			***
//**************************************************
	function esNumerico(dato)
	{ 
		var flag = !isNaN(dato)
		return flag;
	}
</SCRIPT> 


<SCRIPT> 
//*********************************************
//*** Validación de cadenas vacías 		       ***
//*********************************************
	function esVacio(C1)
	{ 
		var flag = true
		if (C1.length==0)
		{
			flag = true
		}
		else
		{
		
			var longitudCadena = C1.length;
			for (i=0;i<longitudCadena;i++)
			{ 
				if(C1.charAt(i) !=' ') 
				{ 
					flag = false
				} 
			}
		}
	
		return flag;
	}
</SCRIPT> 

<SCRIPT> 
//******************************************
//*** Validación de espacios en blanco		***
//******************************************
	function tieneEspacios(C1)
	{ 
		var flag = false
		var longitudCadena = C1.length;
		for (i=0;i<longitudCadena;i++)
		{ 
			if(C1.charAt(i) ==' ') 
			{ 
				flag = true
				return flag;
			} 
		}
		return flag;
	}

</SCRIPT> 

<SCRIPT> 
//*********************************************
//*** Validación de números en la cadena	***
//*********************************************
	function tieneNumeros(Cadena)
	{ 
		var flag = false;
		var C1
	//*** Elimina espacios en la cadena ***
	for (x=0; x < Cadena.length; x++) 
	{
	  if (Cadena.charAt(x) != ' ')
	    C1 = C1 + Cadena.charAt(x);
	}
	//***

		var longitudCadena = C1.length;
		for (i=0;i<longitudCadena;i++)
		{ 
			if(!isNaN(C1.charAt(i))) 
			{ 
				flag = true
				return flag;
			} 
		}
		return flag;
	}
</SCRIPT>  

<SCRIPT> 
//******************************************
//*** Validación de entero contra fecha	***
//******************************************
	function enteroFecha(entero,fecha)
	{ 
		//var entero = Number(en)
		//var fecha = Number(fe)
		var flag = false
		
		var longitud = fecha.length;
		var indiceDos = fecha.lastIndexOf("/");
		var anio = Number(fecha.substring(indiceDos+1, longitud));  

		if (entero <= anio)
		{
			flag = true
			return flag;
		} 
	}

</SCRIPT> 
