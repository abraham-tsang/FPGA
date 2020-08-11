library ieee;
use ieee.std_logic_1164.all;

entity RippleCarryAdder is
    port (a, b : in std_logic_vector(2 downto 0); s : out std_logic_vector(3 downto 0));
end RippleCarryAdder;

architecture basic of RippleCarryAdder is
signal c0, c1 : std_logic;
begin
    ha: entity work.ha port map(a(0), b(0), s(0), c0);
    fa0: entity work.fa port map (a(1), b(1), c0, s(1), c1);
    fa1: entity work.fa port map (a(2), b(2), c1, s(2), s(3));
end architecture basic;
