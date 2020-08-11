library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FastAdder_tb is
end FastAdder_tb;

architecture test of FastAdder_tb is
    signal a, b, s : std_logic_vector(3 downto 0);
    signal ci, co : std_logic;
    signal avec, bvec, civec : std_logic_vector(8 downto 0);
    signal abci : std_logic_vector(8 downto 0);
    signal cos : std_logic_vector(8 downto 0);

begin
    FastAdder: entity work.FastAdder port map (a, b, ci, s, co);
    process is
    begin

	for I in 0 to 511 loop
	    abci <= std_logic_vector(to_unsigned(I, abci'length));
	    wait for 10 ns;

	    a <= abci(8 downto 5);
	    b <= abci(4 downto 1);
	    ci <= abci(0);
            wait for 10 ns;

	    avec <= "00000" & a;
	    bvec <= "00000" & b;
	    civec <= "00000000" & ci;
	    wait for 10 ns;

	    cos <= std_logic_vector(unsigned(avec) + unsigned(bvec) + unsigned(civec));
	    wait for 10 ns;

	    if (cos(4) /= co) or (cos(3) /= s(3)) or (cos(2) /= s(2)) or (cos(1) /= s(1)) or (cos(0) /= s(0)) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a(3)) & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(3)) & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0)) & " " & std_logic'image(ci);
                report "Expected: " & std_logic'image(cos(4)) & std_logic'image(cos(3)) & std_logic'image(cos(2)) & std_logic'image(cos(1)) & std_logic'image(cos(0));
                report "Got: " & std_logic'image(co) & std_logic'image(s(3)) & std_logic'image(s(2)) & std_logic'image(s(1)) & std_logic'image(s(0));
	        report "";
            end if;
        end loop;
	wait;
    end process;
end architecture test;
