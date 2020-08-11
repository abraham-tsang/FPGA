library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(a, b, ci : in std_logic; co, s : out std_logic);
end full_adder;

architecture basic of full_adder is
    signal co0, s0, co1 : std_logic;
begin
    half_adder0: entity work.half_adder port map(a, b, co0, s0);
    half_adder1: entity work.half_adder port map(s0, ci, co1, s);
    co <= co0 or co1;
end architecture basic;
