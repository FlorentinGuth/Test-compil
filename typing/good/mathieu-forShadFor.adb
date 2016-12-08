with Ada.Text_IO; use Ada.Text_IO;
procedure Test is
begin
   for I in 0 .. 10 loop
      for I in 0 .. 10 loop --On peut shadow la variable déclarée par for
            Put('N');
      end loop;
   end loop;
   New_Line;
end;
