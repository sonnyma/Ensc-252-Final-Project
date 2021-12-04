library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlunit is
    port (
        clk, rst, hard_rst : in std_logic;
        inst : in std_logic_vector(5 downto 0);
        toSeg : out std_logic_vector()
    );
end controlunit;

architecture rtl of controlunit is
    signal output : std_logic_vector(7 downto 0);
    signal clock : std_logic;

    component C7S is
        port (
            D : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(6 downto 0)
        );
    end component;

begin

    process(clk, rst, hard_rst, inst)
        if (rst = '1') then
            output <= (others := '0');
        else
            output <= inst;
        end if;
    end process;
    
    seg0: c7s port map(D <= h0, Y <= output(3 downto 0));
    seg1: c7s port map(D <= h1, Y <= output(7 downto 4));
    seg2: c7s port map(D <= h2, Y <= output(11 downto 8));
    seg3: c7s port map(D <= h3, Y <= output(15 downto 12));
    seg4: c7s port map(D <= h4, Y <= output(19 downto 16));
    seg5: c7s port map(D <= h5, Y <= output(23 downto 20));
    seg6: c7s port map(D <= h6, Y <= output(27 downto 24));
    seg7: c7s port map(D <= h7, Y <= output(31 downto 38));

end architecture;