library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2_1_8_v1_tb is
end entity mux2_1_8_v1_tb;

architecture test of mux2_1_8_v1_tb is
    signal a, b, z : std_logic_vector(7 downto 0);
    signal sel : std_logic;
    signal avec, bvec : std_logic_vector(16 downto 0);
    signal selvec : std_logic_vector(16 downto 0);
    signal absel : std_logic_vector(16 downto 0);
    signal zvec : std_logic_vector(16 downto 0);
begin
    mux2_1_8_v1: entity work.mux2_1_8_v1 port map (a, b, sel, z);
    process is
    begin
	for I in 0 to 131071 loop
	    absel <= std_logic_vector(to_unsigned(I, absel'length));
	    wait for 10 ns;

            a <= absel(16 downto 9);
            b <= absel(8 downto 1);
            sel <= absel(0);
	    wait for 10 ns;

	    avec <= "000000000" & a;
	    bvec <= "000000000" & b;
	    selvec <= "0000000000000000" & sel;
	    wait for 10 ns;

	    if sel = '0' then
		zvec <= avec;
	    else
		zvec <= bvec;
	    end if;
	    wait for 10 ns;

	    if zvec(7 downto 0) /= z then
		report "FAILURE";
	    --end if;
		report "Input: " & std_logic'image(a(7)) & std_logic'image(a(6)) & std_logic'image(a(5)) & std_logic'image(a(4)) & std_logic'image(a(3)) & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(7)) & std_logic'image(b(6)) & std_logic'image(b(5)) & std_logic'image(b(4)) & std_logic'image(b(3)) & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0)) & " " & std_logic'image(sel);
		report "Expected: " & std_logic'image(zvec(7)) & std_logic'image(zvec(6)) & std_logic'image(zvec(5)) & std_logic'image(zvec(4)) & std_logic'image(zvec(3)) & std_logic'image(zvec(2)) & std_logic'image(zvec(1)) & std_logic'image(zvec(0));
		report "Got: " & std_logic'image(z(7)) & std_logic'image(z(6)) & std_logic'image(z(5)) & std_logic'image(z(4)) & std_logic'image(z(3)) & std_logic'image(z(2)) & std_logic'image(z(1)) & std_logic'image(z(0));
	    end if;
	end loop;
	wait;
    end process;
end architecture test;

