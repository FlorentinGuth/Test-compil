with Ada.Text_IO; use Ada.Text_IO;

procedure fonctions_args_2 is
	type r is record x : integer; end record;

	procedure g is
        function r (a: r) return r is
   			begin
			return a;
			end;
	begin new_line; end;

begin New_Line; End;
