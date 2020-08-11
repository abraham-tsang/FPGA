library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port(a, b, c, d : in std_logic_vector(7 downto 0); sel0, sel1 : in std_logic; z : out std_logic_vector(7 downto 0));
end mux;

architecture basic of mux is
    signal z0, z1 : std_logic_vector(7 downto 0);
begin
    mux2_1_8_v10: entity work.mux2_1_8_v1 port map(a, b, sel0, z0);
    mux2_1_8_v11: entity work.mux2_1_8_v1 port map(c, d, sel0, z1);
    mux2_1_8_v12: entity work.mux2_1_8_v1 port map(z0, z1, sel1, z);
end architecture basic;
