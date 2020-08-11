library ieee;
use ieee.std_logic_1164.all;

entity FastAdder is
    port (a, b: in std_logic_vector(3 downto 0); ci : in std_logic; s : out std_logic_vector(3 downto 0); co : out std_logic);
end FastAdder;

architecture basic of FastAdder is
    signal c: std_logic_vector(2 downto 0);
begin
    FastAdderUnit0: entity work.FastAdderUnit port map (a(0), b(0), ci, s(0), c(0));
    FastAdderUnit1: entity work.FastAdderUnit port map (a(1), b(1), c(0), s(1), c(1));
    FastAdderUnit2: entity work.FastAdderUnit port map (a(2), b(2), c(1), s(2), c(2));
    FastAdderUnit3: entity work.FastAdderUnit port map (a(3), b(3), c(2), s(3), co);
end architecture basic;
