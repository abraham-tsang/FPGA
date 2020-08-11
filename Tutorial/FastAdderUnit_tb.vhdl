library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FastAdderUnit_tb is
end entity FastAdderUnit_tb;

architecture test of FastAdderUnit_tb is
    signal a, b, ci, s, co : std_logic;
    signal avec, bvec, civec : std_logic_vector(2 downto 0);
    signal abci : std_logic_vector(2 downto 0);
    signal cos : std_logic_vector(2 downto 0);
begin
    FastAdderUnit: entity work.FastAdderUnit port map (a, b, ci, s, co);
    process is
    begin

	for I in 0 to 7 loop
            abci <= std_logic_vector(to_unsigned(I, abci'length));
	    wait for 10 ns;

	    a <= abci(2);
	    b <= abci(1);
	    ci <= abci(0);
            wait for 10 ns;

	    avec <= "00" & a;
	    bvec <= "00" & b;
	    civec <= "00" & ci;
            wait for 10 ns;

            cos <= std_logic_vector(unsigned(avec) + unsigned(bvec) + unsigned(civec));
	    wait for 10 ns;

	    if (cos(1) /= co) or (cos(0) /= s) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a) & std_logic'image(b) & std_logic'image(ci);
	        report "Expected: " & std_logic'image(cos(1)) & std_logic'image(cos(0));
	        report "Got: " & std_logic'image(co) & std_logic'image(s);
	        report "";
            end if;

	end loop;

	wait;
    end process;
end architecture test;
