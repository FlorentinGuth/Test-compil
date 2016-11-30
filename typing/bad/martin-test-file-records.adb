with Ada.Text_IO; use Ada.Text_IO;

procedure records is
   type r;
   type r is record a : boolean; end record;
   type t;
   type t is record a : boolean; end record;
   x :t;
   y :r;
   b : boolean;

begin b := x = y; End;
