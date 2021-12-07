LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity prescale is
    port (clk   : in std_logic;
	    mode	: in std_logic_vector(1 downto 0);
		clk_out   : out std_logic);
end prescale;

architecture rtl of prescale is

signal count : unsigned(24 downto 0) := (others => '0');

begin

    process (clk,mode)
    begin
        if rising_edge (clk) and mode = "01" then -- slow speed
            count <= count + 1;
        end if;
		if rising_edge (clk) and mode = "00" then -- normal speed
            count <= count + 2;
        end if;
		if rising_edge (clk) and mode = "10" then -- fast speed
            count <= count + 3;
        end if;
		if rising_edge (clk) and mode = "11" then -- very fast speed
            count <= count + 4;
        end if;
    clk_out <= count(24); --looks at most significant bit
    end process;

end architecture;