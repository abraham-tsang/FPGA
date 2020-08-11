library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder_tb is
end entity half_adder_tb;

architecture test of half_adder_tb is
    signal a, b, c, s : std_logic;
    signal avec, bvec : std_logic_vector(1 downto 0);
    signal ab, cs : std_logic_vector(1 downto 0);
begin
    half_adder : entity work.half_adder port map (a, b, c, s);
    process is
    begin

	for I in 0 to 3 loop
	    ab <= std_logic_vector(to_unsigned(I, ab'length));
	    wait for 10 ns;

	    a <= ab(1);
	    b <= ab(0);
	    wait for 10 ns;

	    avec <= "0" & a;
	    bvec <= "0" & b;
	    wait for 10 ns;

	    cs <= std_logic_vector(unsigned(avec) + unsigned(bvec));
	    wait for 10 ns;

	    if (cs(1) /= c) or (cs(0) /= s) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a) & std_logic'image(b);
	        report "Expected: " & std_logic'image(cs(1)) & std_logic'image(cs(0));
	        report "Got: " & std_logic'image(c) & std_logic'image(s);
	    end if;
	end loop;
	wait;
    end process;
end architecture test;


