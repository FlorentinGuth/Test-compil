with Ada.Text_IO; use Ada.Text_IO;
procedure Test is
   I: Integer;
begin
for I in I .. I+2 loop --Le I shadow la variable avant de typer les bornes
   New_Line;
end loop;
end;
