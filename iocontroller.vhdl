use work.definitions_package.all;

entity iocontroller is
    port (
        toSeg : in std_logic_vector(39 downto 0);
        to_hex : out std_logic_vector(55 downto 0)
    );
end entity;

architecture rtl of iocontroller is

    component C7S is
        port (
            D : in std_logic_vector(4 downto 0);
            Y : out std_logic_vector(6 downto 0)
        );
    end component;

    begin
    seg0: c7s port map(D <= toSeg(4 downto 0), Y <= to_hex(6 downto 0));
    seg1: c7s port map(D <= toSeg(9 downto 5), Y <= to_hex(13 downto 7));
    seg2: c7s port map(D <= toSeg(14 downto 10), Y <= to_hex(20 downto 14));
    seg3: c7s port map(D <= toSeg(19 downto 15), Y <= to_hex(27 downto 21));
    seg4: c7s port map(D <= toSeg(24 downto 20), Y <= to_hex(34 downto 28));
    seg5: c7s port map(D <= toSeg(29 downto 25), Y <= to_hex(41 downto 35));
    seg6: c7s port map(D <= toSeg(34 downto 30), Y <= to_hex(48 downto 42));
    seg7: c7s port map(D <= toSeg(39 downto 35), Y <= to_hex(55 downto 49));
end architecture;