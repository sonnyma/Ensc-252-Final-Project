library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
    port (
        clk, rst, hard_rst, stop_prog : in std_logic;
        program : in std_logic_vector();
        inst : out std_logic
        );
end datapath;

architecture rtl of datapath is

    component scheduler is
        port (
            clk, rst, hard_rst, stop_prog  : in std_logic;
            program : in std_logic_vector(17 downto 0);
            pce : out std_logic;
            inst_out : out std_logic_vector(something downto something)
            );
    end component;

begin

end architecture;