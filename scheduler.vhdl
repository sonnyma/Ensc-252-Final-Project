library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scheduler is
    port (
        clk, rst, hard_rst, stop_prog  : in std_logic;
        program : in std_logic_vector(17 downto 0);
        pce : out std_logic;
        inst_out : out std_logic_vector(something downto something)
        );
end scheduler;

architecture behaviour of scheduler is

begin

end architecture;