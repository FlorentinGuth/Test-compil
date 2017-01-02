with ada.text_io; use ada.text_io;

procedure main is
    type r is record x:integer; end record;
    type a is access r;
    procedure foo is
        type r is record x:character; end record;
        type b is access r;
        u : a;
        v : b;
    begin
        u := v; -- u and v have different types
    end;
begin
    new_line;
end main;
	
