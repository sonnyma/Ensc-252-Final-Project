library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity C7S is
    port (
        D : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(6 downto 0)
    );
end C7S;

architecture rtl of C7S is

begin

    Y <= "0001111" when D = "0000" else --snakeheadf
        "1110001" when D = "0010" else --snaketailf
        "1000111" when D = "0000" else --snakeheadb
        "0111001" when D = "0010" else --snaketailb
        "0001001" when D = "0001" else --snakebody
        "1111110" when D = "0011" else --fly1
        "1111101" when D = "0100" else --fly2
        "0111111" when D = "0101" else --fly3
        "1011111" when D = "0110" else --fly4
        "1111110" when D = "0111" else --fly5
        "1111011" when D = "1000" else --fly6
        "1110111" when D = "1001" else --fly7
        "1101111" when D = "1010" else --fly8
        "1111110" when D = "1010" else --fly9
        "0001000" when D = "0011" else --a
        "1100000" when D = "0100" else --b
        "1110010" when D = "0101" else --c
        "1000010" when D = "0110" else --d
        "0110000" when D = "0111" else --e
        "0111000" when D = "1000" else --f
        "0000100" when D = "1001" else --g
        "1001000" when D = "1010" else --h
        "1001111" when D = "1011" else --i or l or 1
        "1000111" when D = "1100" else --j
        "0100001" when D = "1101" else --j
        "0000110" when D = "1110" else --k cursed
        "0000000" when D = "1000" else --m cursed needs 2
        "1101010" when D = "1001" else --n
        "1100010" when D = "1010" else --o
        "0011000" when D = "1011" else --p
        "0001100" when D = "1100" else --q
        "1111010" when D = "1101" else --r
        "0100100" when D = "1110" else --s or 5
        "1111000" when D = "0111" else --t cursed
        "1100011" when D = "1000" else --u
        "0011000" when D = "1001" else --v cursed
        "0001000" when D = "1010" else --w cursed needs 2
        "0000011" when D = "1011" else --x cursed
        "1001100" when D = "1100" else --y or 4
        "0001110" when D = "1111"; --z cursed

end architecture;