library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (a, b : in std_logic; c, s : out std_logic);
end half_adder;

architecture basic of half_adder is
begin
    c <= a and b;
    s <= a xor b;
end architecture basic;
