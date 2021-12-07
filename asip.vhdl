LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity asip is
    port (
        clk, rst, hard_rst : in std_logic;
        program : in std_logic_vector(3 downto 0);
        to_hex : out arr8x7;
		  pec : out std_logic_vector(3 downto 0)
    );
end asip;

architecture rtl of asip is
	 signal insttemp : std_logic_vector(2 downto 0);
	 signal tosegtemp : arr8x5;
	 signal pectemp : std_logic;
	 signal pectemp3 : unsigned(3 downto 0) := "0000";
	 
	 --component of datapath
    component datapath is
        port (
            clk, rst, hard_rst : in std_logic;
				program : in std_logic_vector(3 downto 0);
				inst : out std_logic_vector(2 downto 0)
            );
    end component;

	 --component of controlunit
    component controlunit is
        port (
            clk, rst, hard_rst : in std_logic;
				inst : in std_logic_vector(2 downto 0);
				toSeg : buffer arr8x5 := ("00000", "00000", "00000", "00000", "00000");
				whenidle : out std_logic
        );
    end component;

	 --component of iocontroller
    component iocontroller is
        port (
            toSeg : in arr8x5;
            to_hex : out arr8x7
        );
    end component;

    begin
	 
	 	process(pectemp, clk)
		begin
			if (hard_rst = '1' and rising_edge(clk)) then
				pectemp3 <= "0000"; --when hard reset reset counter to 0
			end if;
			if (pectemp = '1' and rising_edge(clk)) then
				pectemp3 <= pectemp3 + 1; --when end of program adds one
			elsif (pectemp = '0' and rising_edge(clk)) then
				pectemp3 <= pectemp3; --when not end doesn't do anything
			end if;
	end process;

	--sets pec to the counter
	pec <= std_logic_vector(pectemp3);
	
	 --portmaps of datapath, controlunit, iocontroller
    datapath0: datapath port map(clk => clk, rst => rst, hard_rst => hard_rst, program => program, inst => insttemp(2 downto 0));
    controlunit0 : controlunit port map(clk => clk, rst => rst, hard_rst => hard_rst, inst => insttemp(2 downto 0), toSeg => tosegtemp, whenidle => pectemp);
    iocontroller0 : iocontroller port map(toSeg => tosegtemp, to_hex => to_hex);

end architecture;