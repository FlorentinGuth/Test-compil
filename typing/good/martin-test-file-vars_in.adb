with Ada.Text_IO; use Ada.Text_IO;

procedure fonctions_args_2 is
	type r is record x : integer; end record;
	type t is record x : r; end record;
	type s is record x : access t; end record;
   	function f (a: In s) return integer is
   		begin
		a.x.x.x := 5;
		return 4;
		end;

begin New_Line; End;
