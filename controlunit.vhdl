USE work.definitions_package.all;

entity controlunit is
    port (
        clk, rst, hard_rst : in std_logic;
        inst : in std_logic_vector(5 downto 0);
        toSegcu : out std_logic_vector(255 downto 0)
    );
end controlunit;

architecture rtl of controlunit is
    signal output : std_logic_vector(7 downto 0);
    signal clock : std_logic;

    component iocontroller is
        port (
            toSegio : in std_logic_vector(255 downto 0);
            to_hex : out std_logic_vector(55 downto 0)
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
    
    ioc: iocontroller port map(toSegio <= output, to_hex => toSegcu)

end architecture;