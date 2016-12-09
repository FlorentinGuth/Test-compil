with Ada.Text_IO; use Ada.Text_IO;

procedure Test is
A : Integer;

procedure T(B: in out Integer; C: in Integer) is
begin
   New_Line;
end;

begin
  T(A,A); --ici, il n'y a pas de problèmes
end;
