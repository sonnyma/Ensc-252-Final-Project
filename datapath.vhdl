LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity datapath is
    port (
        clk, rst, hard_rst : in std_logic;
        program : in std_logic_vector(3 downto 0);
        inst : out std_logic_vector(2 downto 0)
        );
end datapath;

architecture rtl of datapath is
	 
	 --component of scheduler
    component scheduler is
        port (
            clk, rst, hard_rst  : in std_logic;
            program : in std_logic_vector(3 downto 0);
            inst_out : buffer std_logic_vector(2 downto 0)
            );
    end component;
	 
	 begin
	
	--port map of scheduler
   S0 : scheduler port map(clk => clk, rst => rst, hard_rst => hard_rst, program => program, inst_out => inst);

end architecture;