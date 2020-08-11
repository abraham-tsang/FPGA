library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_tb is
end entity mux_tb;

architecture test of mux_tb is
    signal a, b, c, d : std_logic_vector(7 downto 0);
    signal sel0, sel1 : std_logic;
    signal z : std_logic_vector(7 downto 0);
    --signal avec, bvec, cvec, dvec : std_logic_vector(16 downto 0);
    --signal sel0vec, sel1vec : std_logic_vector(16 downto 0);
    signal absel0, cdsel1 : std_logic_vector(16 downto 0);
    signal zvec : std_logic_vector(7 downto 0);
begin
    mux: entity work.mux port map (a, b, c, d, sel0, sel1, z);
    process is
    begin
	for I in 0 to 131071 loop
	    absel0 <= std_logic_vector(to_unsigned(I, absel0'length));
	    wait for 10 ns;

	    a <= absel0(16 downto 9);
            b <= absel0(8 downto 1);
            sel0 <= absel0(0);
	    wait for 10 ns;

	    for J in 0 to 131071 loop
		cdsel1 <= std_logic_vector(to_unsigned(J, cdsel1'length));
		wait for 10 ns;

		c <= cdsel1(16 downto 9);
		d <= cdsel1(8 downto 1);
		sel1 <= cdsel1(0);
		wait for 10 ns;

	        if sel0 = '0' then
	            if sel1 = '0' then
	                zvec <= a;
	            else
	                zvec <= c;
	            end if;
	        else
	            if sel1 = '0' then
	                zvec <= b;
	            else
	                zvec <= d;
	            end if;
	        end if;
	        wait for 10 ns;

	        if zvec /= z then
	            report "FAILURE";
	        --end if;
	            report "Input: " & std_logic'image(a(7)) & std_logic'image(a(6)) & std_logic'image(a(5)) & std_logic'image(a(4)) & std_logic'image(a(3)) & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(7)) & std_logic'image(b(6)) & std_logic'image(b(5)) & std_logic'image(b(4)) & std_logic'image(b(3)) & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0)) & " " & std_logic'image(c(7)) & std_logic'image(c(6)) & std_logic'image(c(5)) & std_logic'image(c(4)) & std_logic'image(c(3)) & std_logic'image(c(2)) & std_logic'image(c(1)) & std_logic'image(c(0)) & " " & std_logic'image(d(7)) & std_logic'image(d(6)) & std_logic'image(d(5)) & std_logic'image(d(4)) & std_logic'image(d(3)) & std_logic'image(d(2)) & std_logic'image(d(1)) & std_logic'image(d(0)) & " " & std_logic'image(sel0) & " " & std_logic'image(sel1);
	            report "Expected: " & std_logic'image(zvec(7)) & std_logic'image(zvec(6)) & std_logic'image(zvec(5)) & std_logic'image(zvec(4)) & std_logic'image(zvec(3)) & std_logic'image(zvec(2)) & std_logic'image(zvec(1)) & std_logic'image(zvec(0));
	            report "Got: " & std_logic'image(z(7)) & std_logic'image(z(6)) & std_logic'image(z(5)) & std_logic'image(z(4)) & std_logic'image(z(3)) & std_logic'image(z(2)) & std_logic'image(z(1)) & std_logic'image(z(0));
                end if;
            end loop;
        end loop;
        wait;
    end process;
end architecture test;
