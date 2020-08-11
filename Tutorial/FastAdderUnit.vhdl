library ieee;
use ieee.std_logic_1164.all;

entity FastAdderUnit is
    port (a, b, ci : in std_logic; s, co : out std_logic);
end FastAdderUnit;

architecture basic of FastAdderUnit is
begin
    s <= a xor b xor ci;
    co <= (a and b) or ((a or b) and ci);
end architecture basic;
