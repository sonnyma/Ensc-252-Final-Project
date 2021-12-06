use work.definitions_package.all;

entity SMDB is
    port (
        clock_50, rst : in std_logic;
        SW : in std_logic_vector(17 downto 0);
        HEX : out std_logic_vector(7 downto 0);
        LEDG : out std_logic_vector(7 downto 0);
        LEDR : out std_logic_vector(17 downto 0)
    );
end SMDB;

architecture rtl of SMDB is

    signal clock : std_logic;
    signal choice : std_logic_vector();

    component asip is
        port (
            clk, rst, hard_rst, stop_prog: in std_logic;
            program : in std_logic_vector();
            to_hex : out std_logic_vector()
        );
    end component;

    component debouncer is
        generic (
          timeout_cycles : positive
          );
        port (
          clk : in std_logic;
          rst : in std_logic;
          switch : in std_logic;
          switch_debounced : out std_logic
        );
    end component; 

    component prescale is
        port (clk   : in std_logic;
            mode	: in std_logic_vector(1 downto 0);
            clk_out   : out std_logic);
    end component;

begin

    if (ALL OFF)
        NOTHING HAPPENS;
    end if;

    process (clock_50, KEY(3))
        if (KEY(3) = '0')
            C0: prescaler port map(clk <= clock_50, clk => clock);
        end if;
    end process;

    s0 : scheduler port map(stuff);

    LEDG <= pce;
end architecture;