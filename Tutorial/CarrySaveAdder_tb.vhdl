library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CarrySaveAdder_tb is
end CarrySaveAdder_tb;

architecture test of CarrySaveAdder_tb is
    signal a, b, c, d : std_logic_vector(2 downto 0);
    signal s : std_logic_vector(4 downto 0);
    signal avec, bvec, cvec, dvec : std_logic_vector(11 downto 0);
    signal abcd : std_logic_vector(11 downto 0);
    signal svec : std_logic_vector(11 downto 0);
begin
    CarrySaveAdder: entity work.CarrySaveAdder port map (a, b, c, d, s);
    process is
    begin

	for I in 0 to 4095 loop
	    abcd <= std_logic_vector(to_unsigned(I, abcd'length));
	    wait for 10 ns;
	    
	    a <= abcd(11 downto 9);
	    b <= abcd(8 downto 6);
	    c <= abcd(5 downto 3);
	    d <= abcd(2 downto 0);
	    wait for 10 ns;

            avec <= "000000000" & a;
            bvec <= "000000000" & b;
            cvec <= "000000000" & c;
            dvec <= "000000000" & d;
	    wait for 10 ns;

	    svec <= std_logic_vector(unsigned(avec) + unsigned(bvec) + unsigned(cvec) + unsigned(dvec));
	    wait for 10 ns;

	    if (svec(4) /= s(4)) or (svec(3) /= s(3)) or (svec(2) /= s(2)) or (svec(1) /= s(1)) or (svec(0) /= s(0)) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0)) & " " & std_logic'image(c(2)) & std_logic'image(c(1)) & std_logic'image(c(0)) & " " & std_logic'image(d(2)) & std_logic'image(d(1)) & std_logic'image(d(0));
	        report "Expected: " & std_logic'image(svec(4)) & std_logic'image(svec(3)) & std_logic'image(svec(2)) & std_logic'image(svec(1)) & std_logic'image(svec(0));
	        report "Got: " & std_logic'image(s(4)) & std_logic'image(s(3)) & std_logic'image(s(2)) & std_logic'image(s(1)) & std_logic'image(s(0));
            end if;
        end loop;
        wait;
    end process;
end architecture test;
