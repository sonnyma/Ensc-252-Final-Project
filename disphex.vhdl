library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity disphex is
    port (
        D : in std_logic_vector(5 downto 0);
        Y0, Y1, Y2, Y3, Y4, Y5, Y6 : out std_logic_vector(6 downto 0));
    );
end disphex;

architecture rtl of disphex is
    SIGNAL S0, S1, S2, S3 : STD_LOGIC;
    SIGNAL S4 : STD_LOGIC_VECTOR(3 downto 0);

    COMPONENT SegDecoder IS
    PORT ( X : in std_logic_vector ( 3 downto 0 );
		 Y : out std_logic_vector ( 6 downto 0 )   );

END COMPONENT;

begin

    S3 <= '0';
    S2 <= '0';
    S1 <= D(5);
    S0 <= D(4);

    S4 <= S3 & S2 & S1 & S0;

    U1: SegDecoder PORT MAP(X => D(3 downto 0), Y => Y0);
    U2: SegDecoder PORT MAP(X => S4(3 downto 0), Y => Y1);

end architecture;