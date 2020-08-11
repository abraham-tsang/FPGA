library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_adder_v1_tb is
end entity ripple_adder_v1_tb;

architecture test of ripple_adder_v1_tb is
    signal a, b, s : std_logic_vector(7 downto 0);
    signal ci, co : std_logic;
    signal avec, bvec, civec : std_logic_vector(16 downto 0);
    signal abci : std_logic_vector(16 downto 0);
    signal cos: std_logic_vector(16 downto 0);
begin
    ripple_adder_v1: entity work.ripple_adder_v1 port map (a, b, ci, co, s);
    process is
    begin
	for I in 0 to 131071 loop
	    abci <= std_logic_vector(to_unsigned(I, abci'length));
	    wait for 10 ns;

	    a <= abci(16 downto 9);
	    b <= abci(8 downto 1);
	    ci <= abci(0);
	    wait for 10 ns;

	    avec <= "000000000" & a;
	    bvec <= "000000000" & b;
	    civec <= "0000000000000000" & ci;
	    wait for 10 ns;

	    cos <= std_logic_vector(unsigned(avec) + unsigned(bvec) + unsigned(civec));
	    wait for 10 ns;

	    if cos(8) /= co or cos(7) /= s(7) or cos(6) /= s(6) or cos(5) /= s(5) or cos(4) /= s(4) or cos(3) /= s(3) or cos(2) /= s(2) or cos(1) /= s(1) or cos(0) /= s(0) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a(7)) & std_logic'image(a(6)) & std_logic'image(a(5)) & std_logic'image(a(4)) & std_logic'image(a(3)) & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(7)) & std_logic'image(b(6)) & std_logic'image(b(5)) & std_logic'image(b(4)) & std_logic'image(b(3)) & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0)) & " " & std_logic'image(ci);
	        report "Expected: " & std_logic'image(cos(8)) & " " & std_logic'image(cos(7)) & std_logic'image(cos(6)) & std_logic'image(cos(5)) & std_logic'image(cos(4)) & std_logic'image(cos(3)) & std_logic'image(cos(2)) & std_logic'image(cos(1)) & std_logic'image(cos(0));
	        report "Got: " & std_logic'image(co) & " " & std_logic'image(s(7)) & std_logic'image(s(6)) & std_logic'image(s(5)) & std_logic'image(s(4)) & std_logic'image(s(3)) & std_logic'image(s(2)) & std_logic'image(s(1)) & std_logic'image(s(0));

	    end if;
	end loop;
        wait;
    end process;
end architecture test;
