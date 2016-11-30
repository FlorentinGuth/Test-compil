with Ada.Text_IO; use Ada.Text_IO;

procedure type_fonction_return_2 is
   type r;
   type r is record x : boolean; end record;
   
   function f return access r is
	y : access r := new r;
   	begin
   	return y;
        end;

begin new_line; f.x := true; End;
