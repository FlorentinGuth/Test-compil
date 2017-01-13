with Ada.Text_IO; use Ada.Text_IO;

procedure Rule110 is
   type Node;
   type List is access Node;
   type Node is record
      Val: Boolean;
      Next: List;
   end record;
   

   function Cat(Val: Boolean; Tail: List) return List is
      L: List := new Node;
   begin
      L.Val := Val;
      L.Next := Tail;
      return L;
   end;
   
   
   -- Reverse a list
   function Rev(L: List) return List is
      L0: List := L;
      L1: List := null;
   begin
      while L0 /= null loop
	 L1 := Cat(L0.Val, L1);
	 L0 := L0.Next;
      end loop;
      return L1;
   end;
   
   
   function Concat(A: List; B: List) return List is
      L1: List := A;
      L2: List := B;
      L3: List := Rev(L1);
   begin
      while L2 /= null loop
	 L3 := Cat(L2.Val,L3);
	 L2 := L2.Next;
      end loop;
      return Rev(L3);
   end;
   
   function Concat3(A,B,C: List) return List is
   begin
      return Concat(A,Concat(B,C));
   end;
   
   
   procedure PrintList(L: List) is
      L1: List;
   begin
      L1 := L;
      while L1 /= null loop
	 if L1.Val then
	    Put('@');
	 else
	    Put(' ');
	 end if;
	 L1 := L1.Next;
      end loop;
   end;
   
   
   function RepeatList(L: List; N: Integer) return List is
      L00: List := Rev(L);
      L0: List;
      L1: List := null;
   begin
      for I in 1..N loop
	 L0 := L00;
	 while L0 /= null loop
	    L1 := Cat(L0.Val,L1);
	    L0 := L0.Next;
	 end loop;
      end loop;
      return L1;
   end;
   
   -- Alias, parce que RepeatList c'est trop long
   function Rpt(L: List; N: Integer) return List is
   begin return RepeatList(L,N); end;
      
   
   
   -- Given a list L, computes the next generation of Rule 110
   -- Considers that any cell out of bounds is dead
   function Rule110(L: List) return List is
      
      -- Next state of one cell, given its neighborhood
      function NextState(N: Integer) return Boolean is
      begin
	 -- Put(Character'Val(N+48));
	 return (N /= 0 and N /= 4 and N /= 7);
      end;
      
      L0: List := L;
      L1: List := null;
      Neigh: Integer;
      PrevVal: Boolean := False;
      
   begin
      while L0 /= null loop
	 if PrevVal then Neigh := 4; else Neigh := 0; end if;
	 if L0.Val then Neigh := Neigh+2; end if;
	 if L0.Next /= null and then L0.Next.Val then Neigh := Neigh+1; end if;
	 PrevVal := L0.Val;
	 L0 := L0.Next;
	 L1 := Cat(NextState(Neigh),L1);
      end loop;
      
      return Rev(L1);
   end;
   
   
   
   -- 00010011011111
   -- This pattern produces a regular background on which particles can move
   Pattern: List := Cat(False,Cat(False,Cat(False,Cat(True,Cat(False,Cat(False,Cat(True,Cat(True,Cat(False,Cat(True,Cat(True,Cat(True,Cat(True,Cat(True,null))))))))))))));
   
   OneF: List := Cat(False,null);
   OneT: List := Cat(True,null);
   ThreeF: List := Rpt(Onef,3);
   ThreeT: List := Rpt(OneT,3);
   
   -- Rule 110 particles, as described in Cook 2004
   PatternA: List := Concat(threef,threet);
   PatternA4: List := Concat(threef,Concat(threet,Concat(Onef,Threet)));
   PatternEbar: List := Concat(Threef,Concat(Onet,Concat(Rpt(Onef,2),Concat(Rpt(Onet,2),Concat(Onef,Concat(Rpt(Onet,2),Concat(Rpt(Onef,5),Concat(Onet,Concat(Rpt(Onef,2),Rpt(Onet,2))))))))));
   
   -- Collision between A4 and Ebar
   L: List := Concat3(RepeatList(Pattern,4),PatternA4,Concat3(RepeatList(Pattern,4),PatternEbar,Rpt(Pattern,4)));
begin
   PrintList(L);
   New_Line;
   for I in 1..200 loop
      L := Rule110(L);
      PrintList(L);
      New_Line;
   end loop;
end;

      
-- Local Variables:
--   compile-command: "gnatmake alexis-rule110.adb && ./alexis-rule110"
-- End:
