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
//Calcula y devuelve el dÃ­gito verificador de una cadena de cÃ³digo de barras EAN13
//o EAN8 .Devcuelve -1 en caso de ser incorrecto.
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
   DeCodeDate (Date,YY,MM,DD);
   formateado := (format('%d%d%d',[dd,mm,yy]));
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
//Procedimiento para Obtener el Codigo de Barras
procedure obtenerCodigo();
var
   ndec: integer;
   wh: Char;
   nbin: String;
   codigo: String;
   fecha:string;
   aux:string;
   dverif: integer;

          begin
               nbin:='';
               codigo:='';
               writeln('Ingrese el N. de Legajo(4 digitos)');
               readln(ndec);
               // Bucle principal
               fecha:=obtenerFecha();
               writeln('Fecha:',fecha);
               aux:=Concat(IntToStr(ndec), fecha );
               writeln(aux);
               dverif:= obtenerDigitoVerificador(aux);
               aux:=Concat(aux, IntToStr(dverif));
               ndec:=StrToInt(aux);
               repeat
                     begin
                          if ndec mod 2 = 0 then
                             begin
                                  wh:='0';
                             end
                          else
                              begin
                                   wh:='1';
                              end;
                          nbin:= nbin + wh ;
                          ndec:= ndec div 2 ;
                     end;
               until ndec = 0;
               // genero el codigo de barras
               codigo:= generarCodigo(nbin);
               writeln('Codigo de Barras:  ');
               writeln(codigo);
               writeln(codigo);
end;
procedure generadorCodigoBarras();
var opcion: integer;
         begin
           repeat
                 opcion:=0;
                 clrscr;
                 writeln('╔═══════════════════════════════════════════════════════════╗');
                 writeln('║Generador de Codigo de Barras para legajos de 4 Digitos    ║');
                 writeln('║Opciones:                                                  ║');
                 writeln('║            1 - Generar Nuevo Codigo                       ║');
                 writeln('║            2 - Para Volver al menu Principal presione S   ║');
                 writeln('╚═══════════════════════════════════════════════════════════╝');
                 readln(opcion);
                 if opcion=1 then
                    begin
                         obtenerCodigo();
                         readln(opcion);
                    end;
           until opcion=2;
         end;
// Aqui terminalel generador de codigo de barras  -------------------------------

//Aqui Comienza el Indocumentado Codigo QR
procedure generarCodigoQR();
var
        z: char;
        i: integer;
        k: integer;
        q: integer;
        r: integer;
        a: integer;
        t: integer;
        c: array [1..21, 1..21] of integer;
        n: array [1..4] of integer;
        b: array [1..9, 1..4] of integer;
        g: array [1..21, 1..21] of char;

begin
          for i:=1 to 9 do
           for k:=1 to 4 do
             begin
              b[i,k]:=0;
             end;
          b[1,4]:=1;
          b[2,3]:=1;
          b[3,3]:=1;
          b[3,4]:=1;
          b[4,2]:=1;
          b[5,2]:=1;
          b[5,4]:=1;
          b[6,2]:=1;
          b[6,3]:=1;
          b[7,2]:=1;
          b[7,3]:=1;
          b[7,4]:=1;
          b[8,1]:=1;
          b[9,1]:=1;
          b[9,4]:=1;
          for q:= 1 to 21 do
            for r:= 1 to 21 do
              c[q,r]:=0;
          for a:= 1 to 8 do
           begin
            c[1,a]:=1;
            c[a,1]:=1;
            c[8,a]:=1;
            c[a,8]:=1;
            c[14,a]:=1;
            c[a,14]:=1;
            c[21,a]:=1;
            c[a,21]:=1;
            c[1,a+13]:=1;
            c[a+13,1]:=1;
            c[8,a+13]:=1;
            c[a+13,8]:=1;
           end;
          for a:= 1 to 5 do
           begin
            c[a+8,7]:=1;
            c[7,a+8]:=1;
           end;
          for a:= 3 to 6 do
           begin
            c[a,3]:=1;
            c[a,4]:=1;
            c[a,5]:=1;
            c[a,6]:=1;
            c[a+13,3]:=1;
            c[a+13,4]:=1;
            c[a+13,5]:=1;
            c[a+13,6]:=1;
            c[a,16]:=1;
            c[a,17]:=1;
            c[a,18]:=1;
            c[a,19]:=1;
           end;
          for a:= 20 to 21 do
           begin
            c[19,a]:=1;
            c[15,a]:=1;
            c[11,a]:=1;
            c[11,a-2]:=1;
           end;
          for k:= 1 to 4 do
           begin
            writeln('Ingrese un digito del legajo y presione enter');
            readln(n[k]);
           end;
          for k:= 1 to 4 do
           begin
            t:=n[k];
            if t<>0 then
             begin
              case k of
               1: begin
                   c[20,20]:=b[t,2];
                   c[20,21]:=b[t,1];
                   c[21,20]:=b[t,4];
                   c[21,21]:=b[t,3];
                  end;
               2: begin
                   c[16,20]:=b[t,2];
                   c[16,21]:=b[t,1];
                   c[17,20]:=b[t,4];
                   c[17,21]:=b[t,3];
                  end;
               3: begin
                   c[12,20]:=b[t,2];
                   c[12,21]:=b[t,1];
                   c[13,20]:=b[t,4];
                   c[13,21]:=b[t,3];
                  end;
               4: begin
                   c[12,18]:=b[t,2];
                   c[12,19]:=b[t,1];
                   c[13,18]:=b[t,4];
                   c[13,19]:=b[t,3];
                  end;
              end;
             end;
           end;
          for q:= 1 to 21 do
           begin
            for r:= 1 to 21 do
              write(c[q,r]:2);
              writeln;
           end;
          writeln;
          for q:= 1 to 21 do
           begin
            for r:= 1 to 21 do
             if c[q,r]=0 then write(chr(255)) else write(chr(219));
             writeln;
           end;
          writeln ('Para finalizar presione enter');
          readln (z);
          clrscr;

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
     writeln('║             2) Generar Codigo de Barras       ║');
     writeln('║             3) Generar Codigo QR              ║');
     writeln('║             4) Salir                          ║');
     writeln('╚═══════════════════════════════════════════════╝');
end;
// Aqui comienza la aplicación principal con el menu de opciones.
begin

     repeat
          menu();
          readln(opcionmenu);
          case opcionmenu of
                   1: tateti();
                   2: generadorCodigoBarras();
                   3: generarCodigoQR();
          end;
     until opcionmenu = 4;
          presentacionAutores();
end.
