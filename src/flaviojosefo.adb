with dCola;
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Flaviojosefo is

   subtype tnom is String (1..50);
   --Definición del tipo jugador
   type tjugador is
      record
         nom: tnom;
         l:natural;
      end record;

   package dCola_Element is new dCola(tjugador);
   use dCola_Element;

   --procedimiento que lleva a cabo la introducción en la cola dada de los
   --nombres del jugadores.txt
   procedure lectura(qu: out cola;nombreFichero: in String) is
      jugador: tjugador;
      numCaracteres: positive;
      fichero:File_Type;
      linea: String(1..50);
   begin

      --mensaje usuario para introducir los nombres del fichero.txt
      --lectura e introducción a la cola de los caracteres de la secuencia
      open(fichero,in_file,nombreFichero);
      while not End_Of_Line(fichero) loop
         --lectura linea del fichero
         get_line(fichero,linea,numCaracteres);
         --asignación del nombre leido al campo nombre del jugador
         jugador.nom:=linea;
         jugador.l:=numCaracteres;
         --introducir la persona leida en la cola
         poner(qu,jugador);

      end loop;
      close(fichero);
   end lectura;

   --declaración procedimiento pasada. Mueve el primer elemento de la cola al
   --final de la misma
   procedure pasada (qu: out cola) is
   begin
      poner(qu,cogerprimero(qu));
      borrarprimero(qu);
   end pasada;

   --declaración procedimiento jugar. LLeva a cabo la eliminación de la cola
   --del jugador que haya perdido
   procedure jugar(qu: out cola; rep: Integer) is
      n:Integer;
   begin
      n:=0;
      while n<rep loop
         pasada(qu);
         n:=n+1;
      end loop;
      borrarprimero(qu);
   end jugar;

   c1:cola;
   n:Integer;
begin
   lectura(c1,"jugadores.txt");
   Put_Line("Pon el numero con el que vas a jugar");
   n:=-1;
   --Se le pide al usuario que escriba un numero. Si es menor que 0 se le vuelve
   --a pedir.
   while n<0 loop
      new_line;
      get(n);
      if n<0 then
         new_line;
         Put_Line("El número que has puesto es menor que 0");
      end if;
   end loop;
   new_line;
   --Se comprueba cada vez que eliminemos a un jugador si solo queda uno en la
   --cola. Si es así, se sale del bucle y se imprime por pantalla al ganador.
   while islastitem(c1)=False loop
      jugar(c1,n);
   end loop;
   Put_Line("El ganador ha sido "&cogerprimero(c1).nom(1..cogerprimero(c1).l));
end Flaviojosefo;
