with Ada.Text_IO; use Ada.Text_IO;

procedure presence_return is
   function f (x : boolean)return integer is
   	begin
   	for y in 0 .. 4 loop return 1; end loop;
        end;

begin new_line; End;
