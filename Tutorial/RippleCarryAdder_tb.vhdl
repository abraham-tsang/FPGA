library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RippleCarryAdder_tb is
end RippleCarryAdder_tb;

architecture test of RippleCarryAdder_tb is
    signal a, b : std_logic_vector(2 downto 0);
    signal s : std_logic_vector(3 downto 0);
    signal avec, bvec : std_logic_vector(5 downto 0);
    signal ab : std_logic_vector(5 downto 0);
    signal svec : std_logic_vector(5 downto 0);
begin
    RippleCarryAdder: entity work.RippleCarryAdder port map (a, b, s);
    process is
    begin
	
	for I in 0 to 63 loop
	    ab <= std_logic_vector(to_unsigned(I, ab'length));
	    wait for 10 ns;
	    
	    a <= ab(5 downto 3);
	    b <= ab(2 downto 0);
	    wait for 10 ns;

	    avec <= "000" & a;
	    bvec <= "000" & b;
	    wait for 10 ns;
            
	    svec <= std_logic_vector(unsigned(avec) + unsigned(bvec));
	    wait for 10 ns;
	    
	    if (svec(3) /= s(3)) or (svec(2) /= s(2)) or (svec(1) /= s(1)) or (svec(0) /= s(0)) then
		report "FAILURE";
	    --end if;
	        report "Input: " & std_logic'image(a(2)) & std_logic'image(a(1)) & std_logic'image(a(0)) & " " & std_logic'image(b(2)) & std_logic'image(b(1)) & std_logic'image(b(0));
	        report "Expected: " & std_logic'image(svec(5)) & std_logic'image(svec(4)) & std_logic'image(svec(3)) & std_logic'image(svec(2)) & std_logic'image(svec(1)) & std_logic'image(svec(0));
	        report "Got: " & std_logic'image(s(3)) & std_logic'image(s(2)) & std_logic'image(s(1)) & std_logic'image(s(0));
                report "";
	    end if;
        end loop;
	
        wait;
    end process;
end architecture test;
