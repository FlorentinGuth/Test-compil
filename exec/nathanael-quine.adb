with Ada.Text_IO; use Ada.Text_IO;

procedure Quine is
	type str;
	type u is access str;
	type str is record
		value : integer;
		tail : u;
	end record;
	procedure puts(s : u) is begin
		if s /= null then
			put(character'val(s.value)); 
			puts(s.tail);
		end if;
	end;
	procedure print_int(n : Integer) is
		c : integer := n rem 10;
	begin
		if n > 9 then print_int(n / 10); end if;
		put(character'val(48 + C));
	end;
	function o(c : integer; s : u) return u is
		result : u := new str;
	begin
		result.value := c; result.tail := s; return result;
	end;
	procedure def(s : u; n : character) is
		k : integer := 0;
		w : u := s;
	begin
		put(n);put(':');put('u');put(':');put('=');
		while w /= null loop
			put('o');put('(');print_int(w.value);put(',');
			k := k+1;
			w := w.tail;
		end loop;
		put('n');put('u');put('l');put('l');
		for i in 1..k loop put(')'); end loop;
		put(';');
		new_line;
	end;
s:u:=o(119,o(105,o(116,o(104,o(32,o(65,o(100,o(97,o(46,o(84,o(101,o(120,o(116,o(95,o(73,o(79,o(59,o(32,o(117,o(115,o(101,o(32,o(65,o(100,o(97,o(46,o(84,o(101,o(120,o(116,o(95,o(73,o(79,o(59,o(10,o(10,o(112,o(114,o(111,o(99,o(101,o(100,o(117,o(114,o(101,o(32,o(81,o(117,o(105,o(110,o(101,o(32,o(105,o(115,o(10,o(9,o(116,o(121,o(112,o(101,o(32,o(115,o(116,o(114,o(59,o(10,o(9,o(116,o(121,o(112,o(101,o(32,o(117,o(32,o(105,o(115,o(32,o(97,o(99,o(99,o(101,o(115,o(115,o(32,o(115,o(116,o(114,o(59,o(10,o(9,o(116,o(121,o(112,o(101,o(32,o(115,o(116,o(114,o(32,o(105,o(115,o(32,o(114,o(101,o(99,o(111,o(114,o(100,o(10,o(9,o(9,o(118,o(97,o(108,o(117,o(101,o(32,o(58,o(32,o(105,o(110,o(116,o(101,o(103,o(101,o(114,o(59,o(10,o(9,o(9,o(116,o(97,o(105,o(108,o(32,o(58,o(32,o(117,o(59,o(10,o(9,o(101,o(110,o(100,o(32,o(114,o(101,o(99,o(111,o(114,o(100,o(59,o(10,o(9,o(112,o(114,o(111,o(99,o(101,o(100,o(117,o(114,o(101,o(32,o(112,o(117,o(116,o(115,o(40,o(115,o(32,o(58,o(32,o(117,o(41,o(32,o(105,o(115,o(32,o(98,o(101,o(103,o(105,o(110,o(10,o(9,o(9,o(105,o(102,o(32,o(115,o(32,o(47,o(61,o(32,o(110,o(117,o(108,o(108,o(32,o(116,o(104,o(101,o(110,o(10,o(9,o(9,o(9,o(112,o(117,o(116,o(40,o(99,o(104,o(97,o(114,o(97,o(99,o(116,o(101,o(114,o(39,o(118,o(97,o(108,o(40,o(115,o(46,o(118,o(97,o(108,o(117,o(101,o(41,o(41,o(59,o(32,o(10,o(9,o(9,o(9,o(112,o(117,o(116,o(115,o(40,o(115,o(46,o(116,o(97,o(105,o(108,o(41,o(59,o(10,o(9,o(9,o(101,o(110,o(100,o(32,o(105,o(102,o(59,o(10,o(9,o(101,o(110,o(100,o(59,o(10,o(9,o(112,o(114,o(111,o(99,o(101,o(100,o(117,o(114,o(101,o(32,o(112,o(114,o(105,o(110,o(116,o(95,o(105,o(110,o(116,o(40,o(110,o(32,o(58,o(32,o(73,o(110,o(116,o(101,o(103,o(101,o(114,o(41,o(32,o(105,o(115,o(10,o(9,o(9,o(99,o(32,o(58,o(32,o(105,o(110,o(116,o(101,o(103,o(101,o(114,o(32,o(58,o(61,o(32,o(110,o(32,o(114,o(101,o(109,o(32,o(49,o(48,o(59,o(10,o(9,o(98,o(101,o(103,o(105,o(110,o(10,o(9,o(9,o(105,o(102,o(32,o(110,o(32,o(62,o(32,o(57,o(32,o(116,o(104,o(101,o(110,o(32,o(112,o(114,o(105,o(110,o(116,o(95,o(105,o(110,o(116,o(40,o(110,o(32,o(47,o(32,o(49,o(48,o(41,o(59,o(32,o(101,o(110,o(100,o(32,o(105,o(102,o(59,o(10,o(9,o(9,o(112,o(117,o(116,o(40,o(99,o(104,o(97,o(114,o(97,o(99,o(116,o(101,o(114,o(39,o(118,o(97,o(108,o(40,o(52,o(56,o(32,o(43,o(32,o(67,o(41,o(41,o(59,o(10,o(9,o(101,o(110,o(100,o(59,o(10,o(9,o(102,o(117,o(110,o(99,o(116,o(105,o(111,o(110,o(32,o(111,o(40,o(99,o(32,o(58,o(32,o(105,o(110,o(116,o(101,o(103,o(101,o(114,o(59,o(32,o(115,o(32,o(58,o(32,o(117,o(41,o(32,o(114,o(101,o(116,o(117,o(114,o(110,o(32,o(117,o(32,o(105,o(115,o(10,o(9,o(9,o(114,o(101,o(115,o(117,o(108,o(116,o(32,o(58,o(32,o(117,o(32,o(58,o(61,o(32,o(110,o(101,o(119,o(32,o(115,o(116,o(114,o(59,o(10,o(9,o(98,o(101,o(103,o(105,o(110,o(10,o(9,o(9,o(114,o(101,o(115,o(117,o(108,o(116,o(46,o(118,o(97,o(108,o(117,o(101,o(32,o(58,o(61,o(32,o(99,o(59,o(32,o(114,o(101,o(115,o(117,o(108,o(116,o(46,o(116,o(97,o(105,o(108,o(32,o(58,o(61,o(32,o(115,o(59,o(32,o(114,o(101,o(116,o(117,o(114,o(110,o(32,o(114,o(101,o(115,o(117,o(108,o(116,o(59,o(10,o(9,o(101,o(110,o(100,o(59,o(10,o(9,o(112,o(114,o(111,o(99,o(101,o(100,o(117,o(114,o(101,o(32,o(100,o(101,o(102,o(40,o(115,o(32,o(58,o(32,o(117,o(59,o(32,o(110,o(32,o(58,o(32,o(99,o(104,o(97,o(114,o(97,o(99,o(116,o(101,o(114,o(41,o(32,o(105,o(115,o(10,o(9,o(9,o(107,o(32,o(58,o(32,o(105,o(110,o(116,o(101,o(103,o(101,o(114,o(32,o(58,o(61,o(32,o(48,o(59,o(10,o(9,o(9,o(119,o(32,o(58,o(32,o(117,o(32,o(58,o(61,o(32,o(115,o(59,o(10,o(9,o(98,o(101,o(103,o(105,o(110,o(10,o(9,o(9,o(112,o(117,o(116,o(40,o(110,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(58,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(117,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(58,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(61,o(39,o(41,o(59,o(10,o(9,o(9,o(119,o(104,o(105,o(108,o(101,o(32,o(119,o(32,o(47,o(61,o(32,o(110,o(117,o(108,o(108,o(32,o(108,o(111,o(111,o(112,o(10,o(9,o(9,o(9,o(112,o(117,o(116,o(40,o(39,o(111,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(40,o(39,o(41,o(59,o(112,o(114,o(105,o(110,o(116,o(95,o(105,o(110,o(116,o(40,o(119,o(46,o(118,o(97,o(108,o(117,o(101,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(44,o(39,o(41,o(59,o(10,o(9,o(9,o(9,o(107,o(32,o(58,o(61,o(32,o(107,o(43,o(49,o(59,o(10,o(9,o(9,o(9,o(119,o(32,o(58,o(61,o(32,o(119,o(46,o(116,o(97,o(105,o(108,o(59,o(10,o(9,o(9,o(101,o(110,o(100,o(32,o(108,o(111,o(111,o(112,o(59,o(10,o(9,o(9,o(112,o(117,o(116,o(40,o(39,o(110,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(117,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(108,o(39,o(41,o(59,o(112,o(117,o(116,o(40,o(39,o(108,o(39,o(41,o(59,o(10,o(9,o(9,o(102,o(111,o(114,o(32,o(105,o(32,o(105,o(110,o(32,o(49,o(46,o(46,o(107,o(32,o(108,o(111,o(111,o(112,o(32,o(112,o(117,o(116,o(40,o(39,o(41,o(39,o(41,o(59,o(32,o(101,o(110,o(100,o(32,o(108,o(111,o(111,o(112,o(59,o(10,o(9,o(9,o(112,o(117,o(116,o(40,o(39,o(59,o(39,o(41,o(59,o(10,o(9,o(9,o(110,o(101,o(119,o(95,o(108,o(105,o(110,o(101,o(59,o(10,o(9,o(101,o(110,o(100,o(59,o(10,null))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
e:u:=o(98,o(101,o(103,o(105,o(110,o(10,o(9,o(112,o(117,o(116,o(115,o(40,o(115,o(41,o(59,o(10,o(9,o(100,o(101,o(102,o(40,o(115,o(44,o(32,o(39,o(115,o(39,o(41,o(59,o(10,o(9,o(100,o(101,o(102,o(40,o(101,o(44,o(32,o(39,o(101,o(39,o(41,o(59,o(10,o(9,o(112,o(117,o(116,o(115,o(40,o(101,o(41,o(59,o(10,o(9,o(110,o(101,o(119,o(95,o(108,o(105,o(110,o(101,o(59,o(10,o(101,o(110,o(100,o(32,o(81,o(117,o(105,o(110,o(101,o(59,null)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
begin
	puts(s);
	def(s, 's');
	def(e, 'e');
	puts(e);
	new_line;
end Quine;
