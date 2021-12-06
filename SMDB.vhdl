LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SMDB is
    port (
        clock_50, rst : in std_logic;
        SW : in std_logic_vector(17 downto 0);
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);
        LEDG : out std_logic_vector(7 downto 0);
        LEDR : out std_logic_vector(17 downto 0)
    );
end SMDB;

architecture rtl of SMDB is
	signal progtemp, clock : std_logic;
	signal insttemp : std_logic_vector(2 downto 0);
	signal tosegtemp : arr8x5;
	signal tohextemp : arr8x7 := ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
	
component prescale is
    port (clk : in std_logic;
	    mode	: in std_logic_vector(1 downto 0);
		clk_out   : out std_logic);
end component;

component scheduler is
    port (
        clk, rst, hard_rst, stop_prog : in std_logic;
        program : in std_logic_vector(3 downto 0);
        pce : out std_logic;
        inst_out : out std_logic_vector(2 downto 0)
        );
end component;

component controlunit is
    port (
        clk, rst, hard_rst : in std_logic;
        inst : in std_logic_vector(2 downto 0);
        toSeg : out arr8x5
    );
end component;

component C7S is
    port (
        D : in std_logic_vector(4 downto 0);
        Y : out std_logic_vector(6 downto 0)
    );
end component;

component iocontroller is
    port (
        toSeg : in arr8x5;
        to_hex : out arr8x7
    );
end component;

	begin
	
   Cl0 : prescale port map(clk => clock_50, mode => SW(14 downto 13), clk_out => clock);
	S0 : scheduler port map(clk => clock, rst => SW(17), hard_rst => SW(16), stop_prog => SW(15), program => SW(3 downto 0),
									pce => progtemp, inst_out => insttemp(2 downto 0));
	CU0 : controlunit port map(clk => clock, rst => SW(17), hard_rst => SW(16), inst => insttemp(2 downto 0), toSeg => tosegtemp);
	I0 : iocontroller port map(toSeg => tosegtemp, to_hex => tohextemp);
	
	HEX0 <= tohextemp(0);
	HEX1 <= tohextemp(1);
	HEX2 <= tohextemp(2);
	HEX3 <= tohextemp(3);
	HEX4 <= tohextemp(4);
	HEX5 <= tohextemp(5);
	HEX6 <= tohextemp(6);
	HEX7 <= tohextemp(7);

end architecture;