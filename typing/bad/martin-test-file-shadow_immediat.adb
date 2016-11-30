with Ada.Text_IO; use Ada.Text_IO;

procedure types is
   type r;
   type r is record a : boolean; end record;
   
   procedure f is
   	type r is access r;

   	begin
   	new_line; 
    end;

begin New_Line; End;
