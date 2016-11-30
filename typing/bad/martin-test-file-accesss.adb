with Ada.Text_IO; use Ada.Text_IO;

procedure accesss is
   type r;
   type r is record a : boolean; end record;
   x : access r := new r;
   
   type t is access r;
   y : t := new r;
   
   b : boolean;

begin b := (x = y); End;
