LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity c7s is
    port (
        D : in std_logic_vector(4 downto 0);
        Y : out std_logic_vector(6 downto 0)
    );
end c7s;

architecture rtl of c7s is

begin

    Y <= "1111111" when D = "00000" else --idle / all off
        "1111000" when D = "00001" else --snakehead to left
        "1000111" when D = "00010" else --snaketail to left / left of W / L
        "1001110" when D = "00011" else --snakehead to right
        "1110001" when D = "00100" else --snaketail to right
        "1001000" when D = "00101" else --snakebody
        "0111111" when D = "00110" else --fly1/5/9
        "1011111" when D = "00111" else --fly2
        "1111110" when D = "01000" else --fly3
        "1111101" when D = "01001" else --fly4
        "1101111" when D = "01010" else --fly6
        "1110111" when D = "01011" else --fly7
        "1111011" when D = "01100" else --fly8
        "0000110" when D = "01101" else --E
        "0101111" when D = "01110" else --r
        "1100001" when D = "01111" else --right of W
        "0001001" when D = "10000" else --H
        "0001000" when D = "10001" else --A
        "0000111" when D = "10010" else --t
        "0100001" when D = "10011" else --d
        "1111001" when D = "10100" else --1/I
        "0010010" when D = "10101" else --s
        "0010001" when D = "10110" else --y
        "1000000" when D = "10111" else --O or 0
        "0001100" when D = "11000" else --P
        "0000011" when D = "11001" else --b
        "0101011" when D = "11010" else --left of m / n
        "0111011" when D = "11011" else --right of m
        "0101100" when D = "11100"; --?

end architecture;