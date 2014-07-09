with Bounded_String_Instance; use Bounded_String_Instance;

package Words
  with SPARK_Mode => On
is
   type String_Array is array (Positive range <>) of Bounded_String;

   Adjective : constant String_Array :=
     (1 => To_Bounded_String("Black"),
      2 => To_Bounded_String("Blue"));
end Words;
