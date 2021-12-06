LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity C7S is
    port (
        D : in std_logic_vector(4 downto 0);
        Y : out std_logic_vector(6 downto 0)
    );
end C7S;

architecture rtl of C7S is

begin

    Y <= "1111111" when D = "00000" else --idle / all off
        "0001111" when D = "00001" else --snakehead to left
        "1110001" when D = "00010" else --snaketail to left / left of W
        "1000111" when D = "00011" else --snakehead to right
        "0111001" when D = "00100" else --snaketail to right
        "0001001" when D = "00101" else --snakebody
        "1111110" when D = "00110" else --fly1/5/9
        "1111101" when D = "00111" else --fly2
        "0111111" when D = "01000" else --fly3
        "1011111" when D = "01001" else --fly4
        "1111011" when D = "01010" else --fly6
        "1110111" when D = "01011" else --fly7
        "1101111" when D = "01100" else --fly8
        "0110000" when D = "01101" else --e
        "1111010" when D = "01110" else --r
        "1000011" when D = "01111" else --right of W
        "1001000" when D = "10000" else --H
        "0001000" when D = "10001" else --A
        "1110000" when D = "10010" else --t
        "1000010" when D = "10011" else --d
        "1001111" when D = "10100" else --1/l/I
        "0100100" when D = "10101" else --s
        "1000100" when D = "10110" else --y
        "0000001" when D = "10111" else --O or 0
        "0011000" when D = "11000" else --P
        "1100000" when D = "11001" else --b
        "1101010" when D = "11010" else --left of m / n
        "1101110" when D = "11011" else --right of m
        "0011010" when D = "11100"; --?

end architecture;