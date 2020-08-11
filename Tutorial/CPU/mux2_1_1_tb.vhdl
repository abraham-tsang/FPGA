library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2_1_1_tb is
end entity mux2_1_1_tb;

architecture test of mux2_1_1_tb is
    signal a, b, sel, z : std_logic;
    signal avec, bvec, selvec : std_logic_vector(2 downto 0);
    signal absel : std_logic_vector(2 downto 0);
    signal zvec : std_logic_vector(2 downto 0);
begin
    mux2_1_1: entity work.mux2_1_1 port map (a, b, sel, z);
    process is
    begin

	for I in 0 to 7 loop
            absel <= std_logic_vector(to_unsigned(I, absel'length));
	    wait for 10 ns;

	    a <= absel(2);
	    b <= absel(1);
	    sel <= absel(0);
	    wait for 10 ns;

	    avec <= "00" & a;
	    bvec <= "00" & b;
	    selvec <= "00" & sel;
	    wait for 10 ns;

	    if sel = '0' then
		zvec <= avec;
	    else
		zvec <= bvec;
	    end if;
	    wait for 10 ns;

	    if zvec(0) /= z then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a) & std_logic'image(b) & std_logic'image(sel);
		report "Expected: " & std_logic'image(zvec(0));
		report "Got: " & std_logic'image(z);
	    end if;
        end loop;
	wait;
    end process;
end architecture test;
