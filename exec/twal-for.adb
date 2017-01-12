with Ada.Text_IO; use Ada.Text_IO;

procedure TwalFor is
	function get(i : Integer) return Integer is
	begin
        Put('a'); New_Line;
        return i;
	end;
begin
    for i in 0 .. get(10) loop
        Put(Character'Val(65 + i));
    end loop;
    New_Line;
end TwalFor;

