LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
package definitions_package is
type arr8x5 is array (7 downto 0) of std_logic_vector(4 downto 0); --array of size 8 of vectors of size 5
type arr8x7 is array (7 downto 0) of std_logic_vector(6 downto 0); --array of size 8 of vectors of size 7

end package definitions_package;
package body definitions_package is
--blank, include any implementations here, if necessary

end package body definitions_package;