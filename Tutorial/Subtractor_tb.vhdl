library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Subtractor_tb is
end entity Subtractor_tb;

architecture test of Subtractor_tb is
    signal a, b, s : std_logic_vector(3 downto 0);
begin
    Subtractor: entity work.Subtractor port map (a, b, s);
    process is
    begin
	for I in 
