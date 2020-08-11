library ieee;
use ieee.std_logic_1164.all;

entity ripple_adder_v1 is
    port (a, b : in std_logic_vector(7 downto 0); ci : in std_logic; co : out std_logic; s : out std_logic_vector(7 downto 0));
end ripple_adder_v1;

architecture basic of ripple_adder_v1 is
    signal c : std_logic_vector(6 downto 0);
begin
    full_adder0: entity work.full_adder port map(a(0), b(0), ci, c(0), s(0));
    full_adder1: entity work.full_adder port map(a(1), b(1), c(0), c(1), s(1));
    full_adder2: entity work.full_adder port map(a(2), b(2), c(1), c(2), s(2));
    full_adder3: entity work.full_adder port map(a(3), b(3), c(2), c(3), s(3));
    full_adder4: entity work.full_adder port map(a(4), b(4), c(3), c(4), s(4));
    full_adder5: entity work.full_adder port map(a(5), b(5), c(4), c(5), s(5));
    full_adder6: entity work.full_adder port map(a(6), b(6), c(5), c(6), s(6));
    full_adder7: entity work.full_adder port map(a(7), b(7), c(6), co, s(7));
end architecture basic;
