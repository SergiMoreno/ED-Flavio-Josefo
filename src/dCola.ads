--------------------------------------------------------------------------------
-- COLA --> IMPLEMENTACI�N ENLAZADA CON PUNTEROS
-- N�mero de elementos no definidos.
-- Aprovecha las ventajas del uso de memoria din�mica.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ESPECIFICACIONES DEL PAQUETE
--------------------------------------------------------------------------------
generic
   --declaraci�n como gen�rico el tipo elemento. Ello posibilitar�, cuando
   --se instancie este paquete se podr� declarar el tipo de elementos contenidos
   --en la estructura cola.
   type elem is private;
package dCola is
------------------------------DECLARACIONES-------------------------------------
--------------------------------------------------------------------------------
--                            PARTE VISIBLE
--------------------------------------------------------------------------------
   --declaraci�n tipo cola como limited private. Con ello se consigue que su
   --definici�n sea no visible (se implementa en la parte privada del paquete.
   --Solo se podr� utilizar con las operaciones del paquete declaradas
   --en la parte p�blica.
   type cola is limited private;

   --declaraci�n de las excepciones no predefinidas del paquete.
   mal_uso: exception;
   espacio_desbordado: exception;

   --DECLARACI�N DE PROCEDIMIENTOS Y FUNCIONES
   --declaraci�n procedimiento cvacia. LLeva a cabo la inicializaci�n de la
   --estructura cola dada por par�metro.
   procedure cvacia(qu: out cola);
   --declaraci�n procedimiento poner. Lleva a cabo la inserci�n del elemento
   --dado en la cola dada.
   procedure poner(qu: in out cola; x: in elem);
   --declaraci�n procedimiento borrarprimero. LLeva a cabo la extracci�n del primer elemento
   --cima de la cola dada.
   procedure borrarprimero(qu: in out cola);
   --declaraci�n funci�n cogerprimero. LLeva a cabo la obtenci�n del primer elemento de la
   --cola dada.
   function cogerprimero(qu: in cola) return elem;
   --declaraci�n funci�n estavacia. LLeva  a cabo la verificaci�n de si la cola
   --dada est� vacia.
   function estavacia(qu: in cola) return boolean;
   --declaraci�n funci�n islastitem. LLeva  a cabo la verificaci�n de si en la cola dada
   --queda un �nico objeto.
   function islastitem(qu: in cola) return boolean;

 -------------------------------------------------------------------------------
 --                             PARTE PRIVADA
 -------------------------------------------------------------------------------
private
   --declaraci�n tipo nodo.
   type nodo;
   --declaraci�n tipo pnodo (puntero a un tipo nodo).
   type pnodo is access nodo;
   --defin�ci�n tipo nodo como registro con dos campos
   type nodo is record
      --campo elemento del nodo
      x: elem;
      --puntero al siguiente elemento de la pila
      sig: pnodo;
   end record;

   --definici�n tipo pila como registro con un �nico campo pnodo (puntero
   --al elemento cima de la pila).
   type cola is record
      p,q:pnodo; --q inicio cola (consulta), p final cola(inserci�n)
   end record;

end dCola;
