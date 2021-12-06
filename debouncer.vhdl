<<<<<<< HEAD
USE work.definitions_package.all;
=======
use work.definitions_package.all;
>>>>>>> ffe64110af48e297c94a6d62bd083ae0992e056d

entity debouncer is
  generic (
    timeout_cycles : positive
    );
  port (
    clk : in std_logic;
    rst : in std_logic;
    switch : in std_logic;
    switch_debounced : out std_logic
  );
end debouncer; 

architecture rtl of debouncer is

  signal debounced : std_logic;
  signal counter : integer range 0 to timeout_cycles - 1;

begin

  -- Copy internal signal to output
  switch_debounced <= debounced;

  DEBOUNCE_PROC : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        counter <= 0;
        debounced <= switch;
        
      else
        
        if counter < timeout_cycles - 1 then
          counter <= counter + 1;
        elsif switch /= debounced then
          counter <= 0;
          debounced <= switch;
        end if;

      end if;
    end if;
  end process;

end architecture;