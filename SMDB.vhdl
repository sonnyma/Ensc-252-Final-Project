LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SMDB is
    port (
        clock_50, rst : in std_logic;
        SW : in std_logic_vector(17 downto 0);
		  KEY : in std_logic_vector(3 downto 0);
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);
        LEDG : out std_logic_vector(7 downto 0);
        LEDR : out std_logic_vector(17 downto 0)
    );
end SMDB;

architecture rtl of SMDB is
	signal clock, clock0 : std_logic;
	signal tohextemp : arr8x7;
	signal rstDebounced, hard_rstDebounced, modeDebounced13, modeDebounced14, programDebounced0, programDebounced1, programDebounced2, programDebounced3 : std_logic;
	signal modeDebounced : std_logic_vector(1 downto 0);
	signal programDebounced : std_logic_vector(3 downto 0);
	signal pectemp : std_logic_vector(3 downto 0);
	
	
component prescale is
    port (clk : in std_logic;
	    mode	: in std_logic_vector(1 downto 0);
		clk_out   : out std_logic);
end component;

component asip is
    port (
        clk, rst, hard_rst : in std_logic;
        program : in std_logic_vector(3 downto 0);
        to_hex : out arr8x7;
		  pec : out std_logic_vector(3 downto 0)
    );
end component;

component debouncer is
    generic (
      timeout_cycles : positive := 1000
      );
    port (
      clk : in std_logic;
      rst : in std_logic;
      switch : in std_logic;
      switch_debounced : out std_logic
    );
end component;

	begin
	
	--for pausing purposes
	process(KEY(3))
		begin
			if KEY(3) = '0' then
				clock0 <= '0';
			else 
				clock0 <= clock;
			end if;
	end process;
	
	 
	 ----debouncer port maps
	 --resetDebouncer : debouncer port map(clk=> clock, rst => SW(16), switch => SW(16), switch_debounced => rstDebounced);
    --hard_rstDebouncer : debouncer port map(clk=> clock, rst => SW(17), switch => SW(17), switch_debounced => hard_rstDebounced);
    --modeDebouncer13 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(13), switch_debounced => modeDebounced13);
    --modeDebouncer14 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(14), switch_debounced => modeDebounced14);
    --programDebouncer0 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(0), switch_debounced => programDebounced0);
    --programDebouncer1 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(1), switch_debounced => programDebounced1);
    --programDebouncer2 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(2), switch_debounced => programDebounced2);
    --programDebouncer3 : debouncer port map(clk=> clock, rst => hard_rstDebounced or rstDebounced, switch => SW(3), switch_debounced => programDebounced3);

	 ----concatenation of debounced sw keys
    --modeDebounced <= modeDebounced14 & modeDebounced13;
    --programDebounced <= programDebounced3 & programDebounced2 & programDebounced1 & programDebounced0;

	 ----portmap of prescale and asip
    --prescale0 : prescale port map(clk => clock_50, mode => modeDebounced, clk_out => clock);
    --asip0 : asip port map(clk => clock, rst => rstDebounced, hard_rst => hard_rstDebounced, program => programDebounced);
	
	--portmap of prescale and asip without debouncers
	prescale0 : prescale port map(clk => clock_50, mode => SW(14 downto 13), clk_out => clock);
	asip0 : asip port map(clk => clock0, rst => SW(16), hard_rst => SW(17), program => SW(3 downto 0), to_hex => tohextemp, pec => pectemp);
	
	--hexes for programs
	HEX0 <= tohextemp(0);
	HEX1 <= tohextemp(1);
	HEX2 <= tohextemp(2);
	HEX3 <= tohextemp(3);
	HEX4 <= tohextemp(4);
	HEX5 <= tohextemp(5);
	HEX6 <= tohextemp(6);
	HEX7 <= tohextemp(7);

	--ledr for pec
	process(pectemp)
	begin
	if pectemp = "0000" then -- 0
        LEDR <= "000000000000000000";
    elsif pectemp = "0001" then --1 
        LEDR <= "000000000000000001";
    elsif pectemp = "0010" then --2 
        LEDR <= "000000000000000011";
    elsif pectemp = "0011" then --3
        LEDR <= "000000000000000111";
    elsif pectemp = "0100" then --4 
        LEDR <= "000000000000001111";
    elsif pectemp = "0101" then --5 
        LEDR <= "000000000000011111";
    elsif pectemp = "0110" then --6
        LEDR <= "000000000000111111";
    elsif pectemp = "0111" then --7
        LEDR <= "000000000001111111";
    elsif pectemp = "1000" then --8 
        LEDR <= "000000000011111111";
    elsif pectemp = "1001" then --9
        LEDR <= "000000000111111111";
    elsif pectemp = "1010" then --10
        LEDR <= "000000001111111111";
    elsif pectemp = "1011" then --11
        LEDR <= "000000011111111111";
    elsif pectemp = "1100" then --12
        LEDR <= "000000111111111111";
    elsif pectemp = "1101" then --13
        LEDR <= "000001111111111111";
    elsif pectemp = "1110" then --14
        LEDR <= "000011111111111111";
    elsif pectemp = "1111" then --15
        LEDR <= "000111111111111111";
    end if;
	end process;
	
end architecture;