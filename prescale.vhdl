library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prescale is
    port (
        clk : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        clk_out : out std_logic);
    );
end prescale;

architecture rtl of prescale is

begin

    process (clk,mode)
    begin
        if (rising_edge (clk) and mode = '01') then
            count <= count + 1;
        end if;
        if (rising_edge (clk) and mode = '10') then
            count <= count + 2;
        end if;
    clk_out <= count;
    end process;

end architecture;