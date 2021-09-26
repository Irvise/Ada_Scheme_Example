with Ada.Text_IO; use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

package Scheme_Test is
   
   procedure Adainit;
   pragma Import (C, AdaInit);
   procedure Adafinal;
   pragma Import (C, AdaFinal);
   
   function Hello_Ada(Num : Int) return Int
   with
     Export => True,
     Convention => C,
     External_Name => "hello_ada";
   
   function Hello_Scheme (String : Char_Array) return Int
   with
	 Import => True,
	 Convention => C,
	 External_Name => "hello_scheme";
   
end Scheme_Test;
