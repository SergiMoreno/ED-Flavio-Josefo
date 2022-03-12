--------------------------------------------------------------------------------
-- COLA --> IMPLEMENTACIÓN ENLAZADA CON PUNTEROS
-- Número de elementos no definidos.
-- Aprovecha las ventajas del uso de memoria dinámica.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ESPECIFICACIONES DEL PAQUETE
--------------------------------------------------------------------------------
generic
   --declaración como genérico el tipo elemento. Ello posibilitará, cuando
   --se instancie este paquete se podrá declarar el tipo de elementos contenidos
   --en la estructura cola.
   type elem is private;
package dCola is
------------------------------DECLARACIONES-------------------------------------
--------------------------------------------------------------------------------
--                            PARTE VISIBLE
--------------------------------------------------------------------------------
   --declaración tipo cola como limited private. Con ello se consigue que su
   --definición sea no visible (se implementa en la parte privada del paquete.
   --Solo se podrá utilizar con las operaciones del paquete declaradas
   --en la parte pública.
   type cola is limited private;

   --declaración de las excepciones no predefinidas del paquete.
   mal_uso: exception;
   espacio_desbordado: exception;

   --DECLARACIÓN DE PROCEDIMIENTOS Y FUNCIONES
   --declaración procedimiento cvacia. LLeva a cabo la inicialización de la
   --estructura cola dada por parámetro.
   procedure cvacia(qu: out cola);
   --declaración procedimiento poner. Lleva a cabo la inserción del elemento
   --dado en la cola dada.
   procedure poner(qu: in out cola; x: in elem);
   --declaración procedimiento borrarprimero. LLeva a cabo la extracción del primer elemento
   --cima de la cola dada.
   procedure borrarprimero(qu: in out cola);
   --declaración función cogerprimero. LLeva a cabo la obtención del primer elemento de la
   --cola dada.
   function cogerprimero(qu: in cola) return elem;
   --declaración función estavacia. LLeva  a cabo la verificación de si la cola
   --dada está vacia.
   function estavacia(qu: in cola) return boolean;
   --declaración función islastitem. LLeva  a cabo la verificación de si en la cola dada
   --queda un único objeto.
   function islastitem(qu: in cola) return boolean;

 -------------------------------------------------------------------------------
 --                             PARTE PRIVADA
 -------------------------------------------------------------------------------
private
   --declaración tipo nodo.
   type nodo;
   --declaración tipo pnodo (puntero a un tipo nodo).
   type pnodo is access nodo;
   --definíción tipo nodo como registro con dos campos
   type nodo is record
      --campo elemento del nodo
      x: elem;
      --puntero al siguiente elemento de la pila
      sig: pnodo;
   end record;

   --definición tipo pila como registro con un único campo pnodo (puntero
   --al elemento cima de la pila).
   type cola is record
      p,q:pnodo; --q inicio cola (consulta), p final cola(inserción)
   end record;

end dCola;
