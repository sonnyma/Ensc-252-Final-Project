LIBRARY ieee;
use work.definitions_package.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity scheduler is
    port (
        clk, rst, hard_rst, stop_prog : in std_logic;
        program : in std_logic_vector(3 downto 0);
        pce : out std_logic;
        inst_out : out std_logic_vector(2 downto 0)
        );
end scheduler;

architecture behaviour of scheduler is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if stop_prog = '1' then
                pce <= '1';
                --terminate program (return to idle)
            elsif rst = '1' then
                --pause (set count = )
            else
                pce <= '0';
                if program = "0001" then
                    --program 1 (message)
                    inst_out <= "001";
                elsif program = "0010" then
                    --program 2 (snake to left)
                    inst_out <= "010";
                elsif program = "0100" then
                    --program 3 (snake to right)
                    inst_out <= "011";
                elsif program = "1000" then
                    --program 4 (fly)
                    inst_out <= "100";
                else
                    --do nothing
                    inst_out <= "000";
                end if;
            end if;
        end if;
	end process;
    
end behaviour;