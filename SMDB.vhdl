library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SMDB is
    port (
        clk, rst : in std_logic;
        SW : in std_logic_vector(17 downto 0);
        HEX : out std_logic_vector(7 downto 0)
    );
end SMDB;

architecture rtl of SMDB is

    signal clock : std_logic;
    signal choice : std_logic_vector();

begin

    if (ALL OFF)
        NOTHING HAPPENS;
    end if;

    process (clock, )

    end if;

    Y0 <= a;
    Y1 <= a;
    Y2 <= a;
    Y3 <= a;
    Y4 <= a;
    Y5 <= a;
    Y6 <= a;

    H0: disphex PORT MAP(, Y0 => HEX(0));
    H1: disphex PORT MAP(Y1 => HEX(1));
    H2: disphex PORT MAP(Y2 => HEX(2));
    H3: disphex PORT MAP(Y3 => HEX(3));
    H4: disphex PORT MAP(Y4 => HEX(4));
    H5: disphex PORT MAP(Y5 => HEX(5));
    H6: disphex PORT MAP(Y6 => HEX(6));

    C0: prescaler PORT MAP(clk => clkin, clkout => clock);

end architecture;