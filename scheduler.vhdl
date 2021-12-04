library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scheduler is
    port (
        clk : in std_logic;
        SW : in std_logic_vector(17 downto 0);	
        KEY : in std_logic_vector(3 downto 2);
        pce : out std_logic;
        inst_out : out std_logic_vector(something downto something)
        );
end scheduler;

architecture behaviour of scheduler is

signal program : std_logic_vector(1 downto 0);
signal stop_prog :std_logic;
signal speed : std_logic_vector(1 downto 0);
signal rst : std_logic;

begin
    program <= SW(3 downto 0);
    speed <= SW(6 downto 4);
    rst <= KEY(3);
    stop_prog <= KEY(2);
    process(clk)
    begin
        if rising_edge(clk) then
            if stop_prog = '1' then
                pce <= '1';
            elsif rst = '1' then
                --pause
            else
                pce <= '0';
                if program = "0001" then
                    --program 1
                    inst_out <= "001";
                elsif program = "0010" then
                    --program 2
                    inst_out <= "010";
                elsif program = "0100" then
                    --program 3
                    inst_out <= "011";
                elsif program = "1000" then
                    --program 4
                    inst_out <= "100";
                else
                    --do nothing
                    inst_out <= "000";
                end if;
            end if;
        end if;
            
end behaviour;