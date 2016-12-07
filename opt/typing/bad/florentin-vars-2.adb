-- Les variables shadow aussi leur type

with Ada.Text_IO; use Ada.Text_IO;

procedure P is
   Integer : Integer := 2; -- "Integer" cannot be used before end of its declaration
begin
   New_Line;
end;
