library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlunit is
    port (
        clk, rst, hard_rst : in std_logic;
        inst : in std_logic_vector();
        toSeg : out std_logic_vector()
    );
end controlunit;

architecture rtl of controlunit is

begin

    process(clk)

    end process;
    
end architecture;