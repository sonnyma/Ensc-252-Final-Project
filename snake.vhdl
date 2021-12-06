USE work.definitions_package.all;

entity fsm is
port(clock_50: in std_logic;
	lights : buffer std_logic_vector(17 downto 0);
	LEDR : out std_logic_vector(17 downto 0);
	SW : in std_logic_vector(17 downto 0));			
end fsm;

architecture behaviour of fsm is 
    constant idle: std_logic_vector(17 downto 0):= "000000000000000000";
    constant L1  : std_logic_vector(17 downto 0):= "000000111000000000";
    constant L2  : std_logic_vector(17 downto 0):= "000111111000000000";
    constant L3  : std_logic_vector(17 downto 0):= "111111111000000000";
    constant R1  : std_logic_vector(17 downto 0):= "000000000111000000";
    constant R2  : std_logic_vector(17 downto 0):= "000000000111111000";
    constant R3  : std_logic_vector(17 downto 0):= "000000000111111111";
	constant H1  : std_logic_vector(17 downto 0):= "000000111111000000";
    constant H2  : std_logic_vector(17 downto 0):= "000111111111111000";
    constant H3  : std_logic_vector(17 downto 0):= "111111111111111111";
	signal clk : std_logic;
    signal leftinput : std_logic;
	signal rightinput : std_logic;
	signal rst : std_logic;
	 
	component PreScale is
        port (Clkin   : in std_logic;
		    Clkout   : out std_logic);
	end component;

	 begin
	 	rst <= SW(17);
		leftinput <= SW(1);
		rightinput <= SW(0);
        process (clk)
        begin
            if rising_edge(clk) and clk = '1' then 
                if rst = '1' then
                    lights <= idle;
                else 
                    case lights is 
                        when IDLE =>
                            if leftinput = '1' and rightinput = '1' then 
                                lights <= H1;
                            elsif leftinput = '1' then 
                                lights <= L1;
                            elsif rightinput = '1' then 
                                lights <= R1;
                            else
                                lights <= idle;
                            end if;
                        when L1 =>
                            lights <= L2;
                        when L2 =>
                            lights <= L3;
                        when L3 =>
                            lights <= idle;
                        when R1 =>
                            lights <= R2;
                        when R2 =>
                            lights <= R3;
                        when R3 =>
                            lights <= idle;
                        when H1 =>
                            lights <= H2;
                        when H2 =>
                            lights <= H3;
                        when H3 =>
                            lights <= idle;
                        when others =>
                            lights <= idle;
                    end case;
                end if;
            end if;
        end process;

	ledr(17 downto 0) <= lights(17 downto 0);
	
	Prescaler : PreScale port map(Clkin => clock_50, Clkout => clk);		  
		  
    end behaviour;