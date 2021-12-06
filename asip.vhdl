use work.definitions_package.all;

entity asip is
    port (
        clk, rst, hard_rst, stop_prog: in std_logic;
        program : in std_logic_vector(3 downto 0);
        to_hex : out std_logic_vector()
    );
end asip;

architecture rtl of asip is

    component datapath is
        port (
            clk, rst, hard_rst, stop_prog : in std_logic;
            program : in std_logic_vector(3 downto 0);
            inst : out std_logic_vector(5 downto 0);
            pce : out std_logic_vector(3 downto 0)
            );
    end component;

    component controlunit is
        port (
            clk, rst, hard_rst : in std_logic;
            inst : in std_logic_vector(5 downto 0);
            toSegcu : out std_logic_vector(255 downto 0)
        );
    end component;

    component iocontroller is
        port (
            toSeg : in std_logic_vector(arr8x5);
            to_hex : out std_logic_vector(55 downto 0)
        );
    end component;
    
    signal outinst(5 downto 0);
    signal outSeg(arr8x5);

    begin
    datapath: datapath port map(clk <= clk, rst <= rst, hard_rst <= hard_rst, stop_prog <= stop_prog, program <= program , inst <= outinst);
    controlunit: controlunit port map(clk <= clk, rst <= rst, hard_rst <= hard_rst, inst <= outinst, toSegcu <= outSeg);
    iocontroller: iocontroller port map(toSeg <= toSegcu, to_hex <= to_hex);

end architecture;