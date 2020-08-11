library ieee;
use ieee.std_logic_1164.all;

entity CarrySaveAdder is
    port(a, b, c, d : in std_logic_vector(2 downto 0); s : out std_logic_vector(4 downto 0));
end CarrySaveAdder;

architecture basic of CarrySaveAdder is
signal fls, flc: std_logic_vector(2 downto 0);
signal sls: std_logic_vector(1 downto 0);
signal slc: std_logic_vector(2 downto 0);
signal rcai1: std_logic_vector(2 downto 0);
begin
    csa0: entity work.fa port map (a(0), b(0), c(0), fls(0), flc(0));
    csa1: entity work.fa port map (a(1), b(1), c(1), fls(1), flc(1));
    csa2: entity work.fa port map (a(2), b(2), c(2), fls(2), flc(2));
    ha: entity work.ha port map (d(0), fls(0), s(0), slc(0));
    csa3: entity work.fa port map (d(1), fls(1), flc(0), sls(0), slc(1));
    csa4: entity work.fa port map (d(2), fls(2), flc(1), sls(1), slc(2));
    rcai1 <= flc(2)&sls;
    rca: entity work.RippleCarryAdder port map(rcai1, slc, s(4 downto 1));
end architecture basic;