program trabajoPractico2;
uses crt, sysutils; //Se agregan las librerias para tener acceso a funciones utiles que por
                    //defecto no estan accesibles directamente o no son nativas de pascal.

var
   //variables del menu
   opcionmenu: integer;
   //estas variables corresponden al tateti
   nombre1,nombre2: string;
   turnos,i,j,fila,columna,cont1,cont2,band: integer;
   tablero:array[1..3,1..3]of char;
   //Fin de variables del tateti

// Aqui empiezan las funciones y procedimientos correspondientes al TATETI
procedure bienvenida;
          begin
               clrscr;
               for i:=1 to 3 do
               for j:=1 to 3 do
               tablero[i,j]:='-';
                Textbackground(7);
                if (turnos=1) then begin
                TextColor(blue);
                write('2');
                end
                else begin
                TextColor(red);
                write('1');
                end;
               writeln('╔══════════════════════════════════════════════════════╗');
               writeln('║Bienvenidos al Ta-te-Ti                               ║');
               writeln('╚══════════════════════════════════════════════════════╝');
               writeln('╔══════════════════════════════════════════════════════╗');
               writeln('║Ingrese el nombre del jugador 1 y luego oprima enter  ║');
               writeln('╚══════════════════════════════════════════════════════╝');
               readln (nombre1);
               writeln('╔══════════════════════════════════════════════════════╗');
               writeln('║Ingrese el nombre del jugador 2 y luego oprima enter  ║');
               writeln('╚══════════════════════════════════════════════════════╝');
               readln (nombre2);
               clrscr;
          end;

procedure dibuja;
             begin
                  ClrScr;
                  writeln;
                  writeln('   1   2   3');
                  writeln(' +------------+');
                  for i:=1 to 3 do
                  begin
                       for j:=1 to 3 do
                       begin
                            if (j=1) then
                            write(' ',i,'| ',tablero[i,j],' |')
                            else
                            write(tablero[i,j],' | ');
                       end;
                       writeln;
                       if (i=3) then
                       writeln(' +------------+')
                       else
                       writeln(' |---+---+---|');
                  end;
             end;

procedure jugador1;
          begin

               band:=0;
               repeat
               writeln (nombre1,'  elija fila para ubicar su ficha y oprima la tecla enter');
               readln (fila);
               writeln ('elija la columna para ubicar su ficha y oprima la tecla enter');
               readln (columna);
               if (tablero[fila,columna]='-') then begin tablero[fila,columna]:='X';
                                                         band:=1
                                                   end
               else writeln ('esa ubicación esta ocupada');
               until (band=1);
               dibuja;
               readln ()
          end;

procedure jugador2;
          begin

               band:=0;
               repeat
               writeln (nombre2,'  elija fila para ubicar su ficha');
               readln (fila);
               writeln ('elija la columna para ubicar su ficha');
               readln (columna);
               if (tablero[fila,columna]='-') then begin tablero[fila,columna]:='O';
                                                         band:=1
                                                   end
               else writeln ('esa ubicación esta ocupada');
               until (band=1);
               dibuja;
               readln ()
          end;

procedure valida;
          begin

               cont1:=0;
               cont2:=0;
               for i:=1 to 3 do
               begin
                    for j:=1 to 3 do
                    begin
                         if (tablero[i,j]='X') then cont1:=cont1+1
                                               else if (tablero[i,j]='O') then cont2:=cont2+1
                    end;
               if (cont1=3) then writeln (nombre1, '  Haz hecho tateti')
                            else if (cont2=3) then writeln (nombre2, '  Haz hecho tateti');
               cont1:=0;
               cont2:=0;
               end;
               cont1:=0;
               cont2:=0;
               for j:=1 to 3 do
               begin
                    for i:=1 to 3 do
                    begin
                         if (tablero[i,j]='X') then cont1:=cont1+1
                                               else if (tablero[i,j]='O') then cont2:=cont2+1
                    end;
               if (cont1=3) then writeln (nombre1, '  Haz hecho tateti')
                            else if (cont2=3) then writeln (nombre2, '  Haz hecho tateti');
               cont1:=0;
               cont2:=0;
               end;
               cont1:=0;
               cont2:=0;
               for i:=1 to 3 do
               begin
                    if (tablero[i,i]='X') then cont1:=cont1+1
                                          else if (tablero[i,i]='O') then cont2:=cont2+1;
               if (cont1=3) then writeln (nombre1, '  Haz hecho tateti')
                            else if (cont2=3) then writeln (nombre2, '  Haz hecho tateti')
               end;
               cont1:=0;
               cont2:=0;
               if (tablero[1,3]='X') and (tablero[2,2]='X') and (tablero[3,1]='X') then writeln (nombre1, '  Haz hecho tateti')
                                                                                   else if (tablero[1,3]='O') and (tablero[2,2]='O') and (tablero[3,1]='O') then writeln (nombre2, '  Haz hecho tateti')
          end;
procedure tateti;
begin

     bienvenida;
     turnos:=1;
     while (turnos<7) and (turnos>=1) do
     begin
          if ((turnos mod 2)=0) then jugador2
          else jugador1;
          turnos:=turnos+1;

     end;
     if (turnos=7) then valida;
     readln ()
end;
// Aqui terminan las funciones y procedimientos correspondientes al TATETI
//------------------------------------------------------------------------------

//procedimiento Presentacion: Muestra los datos de los participantes del proyecto
procedure presentacionAutores();
begin
               writeln ('╔═══════════════════════════════════════════════╗');
               writeln ('║Trabajo realizado por: Ferracuti, Cecilia      ║');
               writeln ('║                       Sorribas, Maximiliano   ║');
               writeln ('║                       Reinna, Nandi           ║');
               writeln ('╚═══════════════════════════════════════════════╝');
end;

//Aqui comienza el generador de codigo de barras
//Funcion que genera el Codigo de Barras
function generarCodigo(nbin:String):String;
var   x: integer;
      aux: String;
begin
  aux:='';
  for x:= length(nbin) downto 1 do
         begin

              if nbin[x]='0' then
                  begin
                       aux:=aux+ ' ';
                  end
              else
                  begin
                       aux:=aux+ chr(124);
                  end;
         end;
  generarCodigo:=aux;
end;

//funcion para calcular el Digito de Control EAN (numero):integer;
function obtenerDigitoVerificador (Ean: String): Integer; overload;
//Calcula y devuelve el di­gito verificador de una cadena de codigo de barras EAN13
//o EAN8 .Devuelve -1 en caso de ser incorrecto.
var
  SP, SI, I, L:Integer;
  Impar: Boolean;
begin
  L := Length(Ean);
  if (L = 8) or (L = 13) then
  begin
    SI := 0;
    SP := 0;
    I := L - 1;
    Impar := True;
    repeat
      if Impar then
        SI := SI + StrToInt(Ean[I])
      else
        SP := SP + StrToInt(Ean[I]);
      Impar := not Impar;
      I := I - 1;
    until I =0;
    if Impar then
      SI := SI*3
    else
     SP := SP*3;
    Result := 10-(SI+SP) mod 10;
  end
  else
    Result:= -1;
end;
//Funcion que devuelve la fecha actual en formato string
function obtenerFecha():String;
var YY,MM,DD : Word;
     formateado : string;
begin
   DeCodeDate (Date,YY,MM,DD); // este metodo permite desglosar una fecha
   formateado := (format('%d%d%d',[dd,mm,yy])); // con este metodo formateamos la fecha como queremos
   //agrego las condiciones para evitar que la fecha tenga menos digitos y le
   //agrego un 0 extra para validar los 13 de ean 13
   if (length(formateado)= 8) then
             formateado:= Concat(formateado,'0');
   if (length(formateado)= 7) then
             formateado:= Concat(formateado,'00');
   if (length(formateado)= 6) then
             formateado:= Concat(formateado,'000');

   obtenerFecha:=  formateado;
end;
//funcion que obtiene el numero binario de un numero decimal
function n2bin(numero:Integer):String;
var
   wh: Char;
   nbinario: String;
begin
     nbinario:='';
     repeat
           begin
                if numero mod 2 = 0 then
                    begin
                         wh:='0';
                    end
                else
                    begin
                         wh:='1';
                    end;
                         nbinario:= nbinario + wh ;
                         numero:= numero div 2 ;
           end;
     until numero = 0;
     n2bin:=nbinario;
end;

//Procedimiento para Obtener el Codigo de Barras
procedure obtenerCodigoBarras(legajo:Integer);
var
   nbin: String;
   codigo: String;
   fecha:string;
   aux:string;
   dverif: integer;
   ndec: integer;

          begin
               nbin:='';
               codigo:='';
               ndec:=legajo;
               // Incio el proceso para obtener el codigo de barras
               fecha:=obtenerFecha();   //obtengo la fecha como un string fomateado ddmmyyyy
               aux:=Concat(IntToStr(ndec), fecha ); //concateno las variables

               dverif:= obtenerDigitoVerificador(aux); //obtengo el codigo verificador
               aux:=Concat(aux, IntToStr(dverif)); // concateno las variables en un string
               ndec:=StrToInt(aux); //convierto el dato auxiliar String en Integer
               nbin:=n2bin(ndec);//genero el numero binario del decimal
               // genero el codigo de barras
               codigo:= generarCodigo(nbin); //genero el codigo y lo guardo en variable
               gotoxy(31,7);
               write(aux);
               gotoxy(2,9);
               writeln('Codigo de Barras:  ');
               gotoxy(3,10);
               writeln(codigo); //muestro el codigo
               gotoxy(3,11);
               writeln(codigo); //muestro el codigo x segunda vez para que sea + grande
end;
//Este procedimiento se encarga de dibujar en la pantalla un rectangulo donde
// aparecera el codigo de barras y ademas obtendra en codigo.
procedure generadorCodigoBarras(legajo:Integer);
         begin
                 writeln('╔═══════════════════════════════════════════════╗');
                 writeln('║Codigo de Barras del Legajo:                   ║');
                 writeln('║                                               ║ ');
                 writeln('║                                               ║ ');
                 writeln('║                                               ║ ');
                 writeln('║                                               ║ ');
                 writeln('║                                               ║ ');
                 writeln('╚═══════════════════════════════════════════════╝');
                 obtenerCodigoBarras(legajo);
         end;
// Funcion que convierte numeros decimales enteros a binario para qr
function decimal_a_binario ( numero : longint ):string;
var
   aux1,aux2 : longint;
   contador, contadorAux: byte;
   V_escritura: array [0..30] of integer;
   binario:string;
begin
	contador:= 1;
        binario:='';
        // Inicio el bucle que convertira el numero a binario
        while numero > 0 do

	begin
		aux1 := numero div 2;
		aux2 := numero mod 2;
		numero := aux1;
		V_escritura[contador] := aux2;
		contador:=contador+1;
	end;

	contadorAux := contador-1;
        //inicio el bucle que concatenara los numeros obtenidos
	repeat
		begin
			binario:= concat(binario,(InttoStr(V_escritura[contadorAux])));
			contadorAux:= contadorAux-1;
		end;
	until contadorAux=0;
        decimal_a_binario:=  binario;
end;

//Aqui Comienza el Indocumentado Codigo QR
procedure obtenerCodigoQr(legajo:Integer);
var
        ndec: integer;
        aux: string;
        x: integer; //posicion X
        y: integer; // posicion Y
        I:integer; //para el primer for
        Z:integer; // para el segundo for
        datos: string;
        //posicion:array[1..21,1..21]of Integer;
        auxch: integer;
        contadorY: integer;
        contadorX: integer;
begin
     ndec := legajo; //cargo el legajo en otra variable para procesarlo luego
     aux:= IntToStr(ndec); //cnvierto el legajo en String
     y:= 39;   //seteo la poscion y en la pantalla para iniciar la carga de datos
     I:=1;     // seteo en 1 el contador I
     contadorY:=0;  // seteo en 0 el contador de Posicion Y-me da cuantos renglones subo
     contadorY:= 1; // seteo en 1 el contador de Posicion X -me da cuantas filas me muevo al costado izq
     //inicio el bucle que leera todos los digitos, los convertira a binario y los colocara en pantalla en la posicion correspondiente.
     repeat
         begin
              x:= 24;
              Z:=8;
              auxch:=StrToInt(aux[I]);
              datos:= decimal_a_binario(auxch); //convierto los datos de decimal a binario
              //chequeo que tenga todos los ceros el binario y si no se los agrego para completar
              if length(datos)=1 then datos:=concat('000',datos);
              if length(datos)=2 then datos:=concat('00',datos);
              if length(datos)=3 then datos:=concat('0',datos);
              //le agrego el 3 en binario adelante de cada numero para llenar los 8bits
              datos:=concat('0011',datos) ;
              //le asigno 1 al contadorX
              contadorX:=1;
              // inicio el bucle que recorrera los 8 caracteres del numero binario en forma invertida
              for Z:=8 downto 0 do
              begin
                       //Si el contador Y es mayor o igual a 12 la posX es 22.Exclusvo para el 4 numero o D4.
                       if(contadorY >= 12) then
                          begin
                               x:= 22;
                               if(Z=8)then y:= 31;
                          end;
                       //Si el contador Y es menor o igual a 11 la posX es 24
                       if(contadorY <= 11) then x:= 24;
                       //Si el contadorX es mayor a 2 lo reseteamos a 1 y le sumamos 1 al contador Y.
                       if(contadorX > 2) then
                          begin
                               y:= y - 1; //subimos la pos y una posicion hacia arriba
                               contadorX:= 1;
                               contadorY:= contadorY + 1 ;
                          end;
                       if(contadorX = 1) then
                           begin
                                x:=x-1;   //movemos pos x a la izquierda
                           end;
                       // fix para posiciones 1 de cada digito.
                       if(contadorY =5) then x:=x+1;
                       if(contadorY =9) then x:=x+1;
                       if(contadorY =12) then x:=x+1;
                       //fin fix
                       // muevo la posicion x para mostrar correctamente el dato
                       x:=x-1;
                       gotoxy(x,y);  //Nos posicionamos donde queremos mostrar el N
                       write(datos[Z]);    // mostramos en pantalla el dato correspondiente
                       if(Z>=1)then contadorX:= contadorX + 1 ;//le sumamos 1 al contador X

              end;

              I:= I + 1; //le sumamos 1 al contador
         end;
     until I = 5;
end;
//procedimiento simple para dibujar donde ira el QR
procedure generadorCodigoQr(legajo:Integer);
          begin
               gotoxy(1,15);
               writeln('╔═══════════════════════╗');
               writeln('║CODIGO QR :',legajo,'        ║');
               writeln('║═══════════════════════║');
               writeln('║ #######       ####### ║');
               writeln('║ #     #       #     # ║');
               writeln('║ # ### #       # ### # ║');
               writeln('║ # ### #       # ### # ║');
               writeln('║ # ### #       # ### # ║');
               writeln('║ # ### #       # ### # ║');
               writeln('║ #     #       #     # ║');
               writeln('║ #######       ####### ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║                       ║');
               writeln('║ #######               ║');
               writeln('║ #     #               ║');
               writeln('║ # ### #               ║');
               writeln('║ # ### #               ║');
               writeln('║ # ### #               ║');
               writeln('║ #     #               ║');
               writeln('║ #######               ║');
               writeln('╚═══════════════════════╝');
               obtenerCodigoQr(legajo);
end;


// Aqui terminalel generador de codigo de barras  -------------------------------
procedure generadorCodigodeLegajos();
var
   legajo:Integer;
   opcion:integer;
   begin
     repeat
           clrscr;
           writeln('╔═══════════════════════════════════════════════╗');
           writeln('║ Ingrese el N. de Legajo(4 digitos)            ║');
           write('║Legajo: ');
           gotoxy(51,3);write('║');
           gotoxy(1,4);
           writeln('╚═══════════════════════════════════════════════╝');
           gotoxy(10,3);
           read(legajo);
           gotoxy(1,6);
           //genero el codigo de barras
           generadorCodigoBarras(legajo);
           //genero el codigo qr
           gotoxy(1,14);
           generadorCodigoQr(legajo);
           gotoxy(30,33);
           write('╔════════════════════════════════════╗');
           gotoxy(30,34);
           write('║Menu de Opciones                    ║');
           gotoxy(30,35);
           write('║1- Generar Otro Codigo de Legajo    ║');
           gotoxy(30,36);
           write('║2- Volver al Menu Principal         ║');
           gotoxy(30,37);
           write('╚════════════════════════════════════╝');
           gotoxy(30,38);
           write('╔════════════════════════════════════╗');
           gotoxy(30,39);
           write('║Ingrese el numero de Opcion:        ║');
           gotoxy(30,40);
           write('╚════════════════════════════════════╝');
           gotoxy(60,39);
           read(opcion);
     until opcion = 2;
   end;
//------------------------------------------------------------------------------
//procedimiento que muestra el menu
procedure menu();
begin
     clrscr;
     writeln('╔═══════════════════════════════════════════════╗');
     writeln('║             Bienvenido al TP 2                ║');
     writeln('║                                               ║');
     writeln('║             1) Jugar Tateti                   ║');
     writeln('║             2) Generar Codigo de Legajos      ║');
     writeln('║             3) Salir                          ║');
     writeln('╚═══════════════════════════════════════════════╝');
end;
// Aqui comienza la aplicación principal con el menu de opciones.
begin

     repeat
          menu();
          writeln('╔═══════════════════════════════════════════════╗');
          writeln('║Ingrese el numero de Opcion:                   ║');
          writeln('╚═══════════════════════════════════════════════╝');
          gotoxy(31,9);
          read(opcionmenu);
          case opcionmenu of
                   1: tateti();
                   2: generadorCodigodeLegajos();
          end;
     until opcionmenu = 3;
           gotoxy(1,13);
           presentacionAutores();
end.
