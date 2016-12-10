with Ada.Text_IO; use Ada.Text_IO;

procedure Pi is
	base : integer := 32768;
	hb : integer := 16384;
	type Node;
	type List is access Node;
	type Node is record
		value : integer;
		next : List;
	end record;
	function cons(v : integer; L : List) return List is
		R : List;
	begin
		R := new Node;
		R.value := v;
		R.next := L;
		return R;
	end;
	function add(L1, L2 : List; carry : integer) return List is
		u : integer;
	begin
		if L1 = null and L2 = null then
			if carry = 0 then
				return null;
			end if;
			return cons(carry, null);
		elsif L1 = null then
			u := L2.value + carry;
			return cons(u rem base, add(null, L2.next, u / base));
		elsif L2 = null then
			u := L1.value + carry;
			return cons(u rem base, add(L1.next, null, u / base));
		end if;
		u := L1.value + L2.value + carry;
		return cons(u rem base, add(L1.next, L2.next, u / base));
	end;
	function sub(L1, L2 : List; carry : integer) return List is
		u : integer;
	begin
		if L1 = null and L2 = null then
			return null;
		elsif L1 = null then
			u := - L2.value + carry + base;
			return cons(u rem base, sub(null, L2.next, (u / base) - 1));
		elsif L2 = null then
			u := L1.value + carry + base;
			return cons(u rem base, sub(L1.next, null, (u / base) - 1));
		end if;
		u := L1.value - L2.value + carry + base;
		return cons(u rem base, sub(L1.next, L2.next, (u / base) - 1));
	end;
	function muli(L1 : List; i, carry : integer) return List is
		u : integer;
	begin
		if L1 = null then
			if carry = 0 then
				return null;
			end if;
			return cons(carry, null);
		end if;
		u := L1.value * i + carry;
		return cons(u rem base, muli(L1.next, i, u / base));
	end;
	function mul(L1, L2 : List) return List is
	begin
		if L2 = null then
			return null;
		end if;
		return add(muli(L1, L2.value, 0), cons(0, mul(L1, L2.next)), 0);
	end;
	function eq(L1, L2 : List) return boolean is
	begin
		if L1 = null and L2 = null then
			return true;
		elsif L1 = null then
			return L2.value = 0 and then eq(null, L2.next);
		elsif L2 = null then
			return L1.value = 0 and then eq(null, L1.next);
		end if;
		return L1.value = L2.value and then eq(L1.next, L2.next);
	end;
	function lesseq(L1, L2 : List) return boolean is
	begin
		if L1 = null then
			return true;
		elsif L2 = null then
			return eq(L1, null);
		end if;
		if L1.value <= L2.value then
			return lesseq(L1.next, L2.next);
		else
			return not lesseq(L2.next, L1.next);
		end if;
	end;
	function div2(L : List) return List is
	begin
		if L = null then
			return null;
		end if;
		if L.next = null then
			if L.value <= 1 then
				return null;
			end if;
			return cons(L.value / 2, null);
		end if;
		if L.next.value rem 2 = 1 then
			return cons(L.value / 2 + hb, div2(L.next));
		else
			return cons(L.value / 2, div2(L.next));
		end if;
	end;
	procedure pInt(N: Integer) is
		C: Integer := N rem 10;
	begin
		if N > 9 then pInt(N / 10); end if;
		put(character'val(48 + C));
	end;
	procedure ddmp(L : List) is
		procedure dmp(L : List) is begin
			if L /= null then
				pInt(L.value);
				put(',');
				dmp(L.next);
			end if;
		end;
	begin
		put('['); dmp(L); put(']'); new_line;
	end;
	procedure divmod(L1, L2 : List; Q, R : in out List) is
	begin
		if L1 = null then
			Q := null;
			R := null;
			return;
		end if;
		divmod(div2(L1), L2, Q, R);
		R := add(R, R, L1.value rem 2);
		Q := add(Q, Q, 0);
		if lesseq(L2, R) then
			R := sub(R, L2, 0);
			Q := add(Q, null, 1);
		end if;
		--put('A'); ddmp(L1); put('B'); ddmp(L2);
		--put('Q'); ddmp(Q);
		--put('R'); ddmp(R);
	end;
	procedure printInt(L1 : List) is
		Q, R : List;
	begin
		if L1 = null then
			put('0');
			return;
		elsif lesseq(L1, cons(9, null)) then
			put(character'val(48 + L1.value));
			return;
		end if;
		divmod(L1, cons(10, null), Q, R);
		printInt(Q);
		put(character'val(48 + R.value));
	end;
	procedure dump(L : List) is
		procedure dmp(L : List) is begin
			if L /= null then
				pInt(L.value);
				put(',');
				dmp(L.next);
			end if;
		end;
	begin
		put('['); dmp(L); put(']'); new_line;
		printInt(L); new_line;
	end;
	function div(L1, L2 : List) return List is
		Q, R : List;
	begin
		divmod(L1, L2, Q, R);
		return Q;
	end;
	function mmod(L1, L2 : List) return List is
		Q, R : List;
	begin
		divmod(L1, L2, Q, R);
		return R;
	end;
	procedure pi(N : integer) is
		k : List := cons(2, null);
		a : List := cons(4, null);
		b : List := cons(1, null);
		a1 : List := cons(12, null);
		b1 : List := cons(4, null);
		w : integer := 0;
		d, d1, p, q, tmp : List;
	begin
		while true loop
			p := mul(k, k);
			q := add(k, k, 1);
			k := add(k, null, 1);
			tmp := a1;
			a1 := add(mul(p, a), mul(q, a1), 0);
			a := tmp;
			tmp := b1;
			b1 := add(mul(p, b), mul(q, b1), 0);
			b := tmp;
			d := div(a, b);
			d1 := div(a1, b1);
			while eq(d, d1) loop
				printInt(d);
				if w = 0 then
					put('.');
				end if;
				w := w + 1;
				if w = N then
					return;
				end if;
				a := muli(mmod(a, b), 10, 0);
				a1 := muli(mmod(a1, b1), 10, 0);
				d := div(a, b);
				d1 := div(a1, b1);
			end loop;
		end loop;
	end;
begin
	pi(100);
	new_line;
end Pi;
