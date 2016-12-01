-- Les types mutuellement récursifs passent
-- En Mini-Ada, on ne peut faire un access que d'un record

with Ada.Text_IO; use Ada.Text_IO;

procedure P is
   type A;
   type B is access A;
   type A is access B;
   
   X, Y : A;
begin
   X := Y;
   Y := X;
   if X = Y then New_Line; end if;
end;
