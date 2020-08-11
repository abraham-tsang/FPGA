library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (a, b, ci : in std_logic; s, co : out std_logic);
end fa;

architecture basic of fa is
    signal s0, s1, c0, c1 : std_logic; -- temps for connecting outputs to inputs
begin
    ha0: entity work.ha port map (a, b, s0, c0);
    ha1: entity work.ha port map (s0, ci, s1, c1);
    s <= s1;
    co <= c0 or c1;
end architecture basic;