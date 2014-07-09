with Bounded_String_Instance; use Bounded_String_Instance;

package Words
  with SPARK_Mode => On
is
   type String_Array is array (Positive range <>) of Bounded_String;

   Adjective : constant String_Array :=
     (1 => To_Bounded_String("black"),
      2 => To_Bounded_String("blue"));

   Noun : constant String_Array :=
     (1 => To_Bounded_String("screen"),
      2 => To_Bounded_String("computer"),
      3 => To_Bounded_String("scenario"));

   Verb : constant String_Array :=
     (1 => To_Bounded_String("eats"),
      2 => To_Bounded_String("drinks"),
      3 => To_Bounded_String("walks"),
      4 => To_Bounded_String("runs"));

end Words;
