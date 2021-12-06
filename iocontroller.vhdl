LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity iocontroller is
    port (
        toSeg : in arr8x5;
        to_hex : out arr8x7
    );
end entity;

architecture rtl of iocontroller is
	
    component C7S is
        port (
            D : in std_logic_vector(4 downto 0);
            Y : out std_logic_vector(6 downto 0)
        );
    end component;

    begin
    seg0: c7s port map(D => toSeg(0), Y => to_hex(0));
    seg1: c7s port map(D => toSeg(1), Y => to_hex(1));
    seg2: c7s port map(D => toSeg(2), Y => to_hex(2));
    seg3: c7s port map(D => toSeg(3), Y => to_hex(3));
    seg4: c7s port map(D => toSeg(4), Y => to_hex(4));
    seg5: c7s port map(D => toSeg(5), Y => to_hex(5));
    seg6: c7s port map(D => toSeg(6), Y => to_hex(6));
    seg7: c7s port map(D => toSeg(7), Y => to_hex(7));
end architecture;