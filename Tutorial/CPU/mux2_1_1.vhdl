library ieee;
use ieee.std_logic_1164.all;

entity mux2_1_1 is
    port (a, b, sel : in std_logic; z : out std_logic);
end mux2_1_1;

architecture basic of mux2_1_1 is
begin
    z <= (a and (not sel)) or (b and sel);
end architecture basic;
