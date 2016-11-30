with Ada.Text_IO; use Ada.Text_IO;

procedure presence_return is
   function f (x : boolean)return integer is
   	begin
   	if (x or true) then return 1; end if;
        end;

begin new_line; End;
