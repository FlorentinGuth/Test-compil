with Ada.Teat_IO; use Ada.Teat_IO;

procedure Rbpfather is
    a : Character := 'A';
    procedure toto4 is begin
        Put(a);
    end;
    procedure toto3 is begin
        Put(a);
        toto4;
    end;
    procedure toto2 is begin
        Put(a);
        toto3;
    end;
    procedure toto1 is
        b : Character := 'B';
        procedure tata4 is begin
            Put(a); Put(b);
        end;
        procedure tata3 is begin
            Put(a); Put(b);
            tata4;
        end;
        procedure tata2 is begin
            Put(a); Put(b);
            tata3;
        end;
        procedure tata1 is
            c : Character := 'C';
            procedure tutu4 is begin
                Put(a); Put(b); Put(c);
            end;
            procedure tutu3 is begin
                Put(a); Put(b); Put(c);
                tutu4;
            end;
            procedure tutu2 is begin
                Put(a); Put(b); Put(c);
                tutu3;
            end;
            procedure tutu1 is
                d : Character := 'D';
                procedure titi4 is begin
                    Put(a); Put(b); Put(c); Put(d);
                end;
                procedure titi3 is begin
                    Put(a); Put(b); Put(c); Put(d);
                    titi4;
                end;
                procedure titi2 is begin
                    Put(a); Put(b); Put(c); Put(d);
                    titi3;
                end;
                procedure titi1 is begin
                    Put(a); Put(b); Put(c); Put(d);
                    titi2;
                end;
            begin
                Put(a); Put(b); Put(c);
                tutu2;
                titi1;
            end;
        begin
            Put(a); Put(b); Put(c);
            tata2;
            tutu1;
        end;
    begin
        Put(a);
        Put(b);
        toto2;
        tata1;
    end;
begin
    toto1;
    New_Line;
end Rbpfather;
