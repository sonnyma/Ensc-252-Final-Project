library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iocontroller is
    port (
        toSeg : in std_logic_vector();
        to_hex : out std_logic_vector()
    );
end entity;

architecture rtl of iocontroller is

begin

end architecture;