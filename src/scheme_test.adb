
package body Scheme_Test is
   
   function Hello_Ada(Num : Int) return Int is
	  Len : Int;
   begin
	  Len := Num;
	  Len := Len + 1;
	  Put_Line ("Hello Scheme, from Ada.");
	  Put_Line ("The number passed is: " & Num'Image);
	  -- Can we call Scheme directly here?
	  Len := Hello_Scheme("How is the weather in your interpreter?");
	  Put_Line("String length sent to Scheme, as computed by Scheme is: " & Len'Image);
	  return(Len);
   end Hello_Ada;
   
end Scheme_Test;
