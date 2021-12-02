library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PreScale is
    port (clk   : in std_logic;
	    mode	: in std_logic_vector(1 downto 0);
		clk_out   : out std_logic);
end PreScale;

architecture arch of PreScale is

signal count : std_logic_vector(19 downto 0) := (others => '0');

begin

    process (clk,mode)
    begin
        if rising_edge (clk) and mode = "01" then -- normal speed
            count <= count + 1;
        end if;
		if rising_edge (clk) and mode = "01" then -- slow speed
            count <= count + 2;
        end if;
		if rising_edge (clk) and mode = "10" then -- fast speed
            count <= count + 3;
        end if;
		if rising_edge (clk) and mode = "11" then -- very fast speed
            count <= count + 4;
        end if;
    clk_out <= count (19);
    end process;

end arch;