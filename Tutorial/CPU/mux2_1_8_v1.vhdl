library ieee;
use ieee.std_logic_1164.all;

entity mux2_1_8_v1 is
    port (a, b : in std_logic_vector(7 downto 0); sel : in std_logic; z : out std_logic_vector(7 downto 0));
end mux2_1_8_v1;

architecture basic of mux2_1_8_v1 is
begin
    mux2_1_10: entity work.mux2_1_1 port map (a(0), b(0), sel, z(0));
    mux2_1_11: entity work.mux2_1_1 port map (a(1), b(1), sel, z(1));
    mux2_1_12: entity work.mux2_1_1 port map (a(2), b(2), sel, z(2));
    mux2_1_13: entity work.mux2_1_1 port map (a(3), b(3), sel, z(3));
    mux2_1_14: entity work.mux2_1_1 port map (a(4), b(4), sel, z(4));
    mux2_1_15: entity work.mux2_1_1 port map (a(5), b(5), sel, z(5));
    mux2_1_16: entity work.mux2_1_1 port map (a(6), b(6), sel, z(6));
    mux2_1_17: entity work.mux2_1_1 port map (a(7), b(7), sel, z(7));
end architecture basic;
