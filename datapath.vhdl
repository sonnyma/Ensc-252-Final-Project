USE work.definitions_package.all;

entity datapath is
    port (
        clk, rst, hard_rst, stop_prog : in std_logic;
        program : in std_logic_vector(3 downto 0);
        inst : out std_logic_vector(5 downto 0);
        pce : out std_logic_vector(3 downto 0)
        );
end datapath;

architecture rtl of datapath is
    component scheduler is
        port (
            clk, rst, hard_rst, stop_prog  : in std_logic;
            program : in std_logic_vector(3 downto 0);
            pce : out std_logic;
            inst_out : out std_logic_vector(2 downto 0)
            );
    end component;

begin
    process(program)
        if program = "0001" then
            pce <= pce + 1;
        elsif program = "0010" then
            pce <= pce + 1;
        elsif program = "0100" then
            pce <= pce + 1;
        elsif program = "1000" then
            pce <= pce + 1;
        end if;
    end process;
    scheduler: scheduler port map (clk <= clk, rst <= rst, hard_rst <= hard_rst, stop_prog <= stop_prog, program <= program);

end architecture;