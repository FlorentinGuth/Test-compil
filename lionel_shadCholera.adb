with Ada.Text_IO; use Ada.Text_IO;

procedure Test is
   type R is record int : integer ; char : character ; bool : boolean ; end record;
   type integer;
   type character;
   type boolean   is record i : access integer  ; end record;
   type integer   is record c : access character; end record;
   type character is record b : boolean         ; end record;
   x : r; bo : boolean ; inte : integer ; ch : character;
begin
   x.int := 0 ; x.char := 'a' ; x.bool := false;
   ch.b := bo ; 
   inte.c.b := bo ; 
   bo.i.c := new character;
end;
