--------------------------------------------------------------------------------
-- COLA --> IMPLEMENTACI�N ENLAZADA CON PUNTEROS
-- N�mero de elementos no definidos.
-- Aprovecha las ventajas del uso de memoria din�mica.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- CUERPO DEL PAQUETE
--------------------------------------------------------------------------------

package body dCola is

   -----------------------------------------------------------------------------
   --procedimiento cvacia. LLeva a cabo la inicializaci�n de la
   --estructura cola dada por par�metro.
   procedure cvacia(qu: out cola) is
      --declaraciones
      p: pnodo renames qu.p;
      q: pnodo renames qu.q;
   begin
      --asignaci�n al campo puntero p y q de la cola dada el valor null. Con ello
      --se consigue a efectos pr�cticos que la cola no contiene ning�n elemento
      p:= null; q:= null;
   end cvacia;
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --procedimiento poner. Lleva a cabo la inserci�n del elemento
   --dado en la cola dada.
   procedure poner(qu: in out cola; x: in elem) is
      --declaraciones
      p: pnodo renames qu.p;
      q: pnodo renames qu.q;
      r: pnodo;
   begin
      --reserva memoria para un tipo nodo y asigna la direcci�n de la misma
      --al puntero r
      r := new nodo;
      --almacena en la posici�n de memoria a la que apunta el puntero r los
      --valores nodo correspondiente al elemento dado y el puntero al primer
      --elemento de la cola dada
      r.all:= (x, null);
      --asigna al campo p de la cola el puntero r. Con ello se consigue que
      --el elemento p a�adido es el ultimo elemento del nuevo nodo de la cola y
      --q a�adido es el primer elemento del nodo de la cola
      if p=null then -- la cola esta vacia
         p:= r; q:= r;
      else
         p.sig:= r; p:= r;
      end if ;
   exception
         --si se produce un desbordamiento de memoria al introducir un nuevo
         --elemento en la pila (excepci�n predefinida Storage_Error) se lleva
         --a cabo la invocaci�n de la excepci�n no predefinida del paquete
         --dcola espacio_desbordado.
         when Storage_Error => raise espacio_desbordado;
   end poner;
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --procedimiento borrarprimero. LLeva a cabo la extracci�n del primer elemento
   --de la cola dada.
   procedure borrarprimero(qu: in out cola) is
      --declaraciones
      p: pnodo renames qu.p;
      q: pnodo renames qu.q;
   begin
      q:= q.sig;
      if q=null then p:= null; end if ;
      --asignamos al campo top de la cola (puntero al primer nodo de la cola)
      --el puntero del siguiente nodo de la cola, con ello, se consigue que
      --el primer nodo de la cola salga de la estructura de punteros enlazados
      --que definen la estructura cola.

   exception
         --si se produce un error que invoque la excepci�n predefinida
         --Constraint_Error se invocar� la excepci�n no predefinida del
         --paque dcola mal_uso.
         when Constraint_Error => raise mal_uso;
   end borrarprimero;
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --funci�n cogerprimero. LLeva a cabo la obtenci�n del primer elemento de la
   --cola dada.
   function cogerprimero(qu: in cola) return elem is
      --declaraciones
      q: pnodo renames qu.q;
   begin
      --devuelve el elemento del primer nodo de la cola dada
      return q.x;
   exception
         --si se produce un error que invoque la excepci�n predefinida
         --Constraint_Error se invocar� la excepci�n no predefinida del
         --paquete dcola mal_uso.
         when Constraint_Error => raise mal_uso;
   end cogerprimero;
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --funci�n estavacia. LLeva  a cabo la verificaci�n de si la cola
   --dada est� vacia.
   function estavacia(qu: in cola) return boolean is
      q: pnodo renames qu.q;
   begin
      --devuelve el resultado de verificar si la cola dada est� vacia o no.
      return q = null;
   end estavacia;
   -----------------------------------------------------------------------------


   -----------------------------------------------------------------------------
   --funci�n islastitem. LLeva  a cabo la verificaci�n de si queda un solo item
   --en la cola.
   function islastitem(qu: in cola) return boolean is
      q: pnodo renames qu.q;
      p: pnodo renames qu.p;
   begin
      --devuelve el resultado de verificar si la cola dada est� vacia o no.
      return q = p;
   end islastitem;
   -----------------------------------------------------------------------------

end dCola;
