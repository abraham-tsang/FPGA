library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fa_tb is
end fa_tb;

architecture test of fa_tb is
    signal a, b, ci, s, co : std_logic;
    signal avec, bvec, civec : std_logic_vector(2 downto 0);
    signal abci : std_logic_vector(2 downto 0);
    signal cos : std_logic_vector(2 downto 0);
begin
    fa: entity work.fa port map (a, b, ci, s, co);
    process is
    begin

        for I in 0 to 7 loop
	    
	    abci <= std_logic_vector(to_unsigned(I, abci'length));
            wait for 10 ns;
	    a <= abci(2);
	    b <= abci(1);
	    ci <= abci(0);
	    wait for 10 ns;

            avec <= (others => '0');
	    avec(0) <= a;
            bvec <= (others => '0');
	    bvec(0) <= b;
            civec <= (others => '0');
	    civec(0) <= ci;
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
