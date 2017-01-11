with ada.text_io; use ada.text_io;

procedure main is
	type r is record a:integer; end record;
	type t is access r;
	x : t;
begin
	x := new t; -- should be new r
end main;
