library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity asip is
    port (
        clk, rst, hard_rst, stop_prog: in std_logic;
        program : in std_logic_vector();
        to_hex : out std_logic_vector()
    );
end asip;

architecture rtl of asip is

    component datapath is
        port (
            clk, rst, hard_rst, stop_prog : in std_logic;
            rst : in std_logic;
            sig
        );
    end component;

    component controlunit is
        port (
            clk, rst, hard_rst : in std_logic;
            inst : in std_logic_vector();
            toSeg : out std_logic_vector()
        );
    end component;

    component iocontroller is
        port (
            toSeg : in std_logic_vector();
            to_hex : out std_logic_vector()
        );
    end component;

begin

end architecture;