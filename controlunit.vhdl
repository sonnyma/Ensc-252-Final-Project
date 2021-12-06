use work.definitions_package.all;

entity controlunit is
    port (
        clk, rst, hard_rst : in std_logic;
        inst : in std_logic_vector(2 downto 0);
        toSeg : out arr8x5
    );
end controlunit;

begin
    process(clk, rst, hard_rst, inst)
        if rising_edge(clk) then 
            if (rst = '1' or hard_rst = '1') then
                toSeg <= (others := '0');
            else
                case toSeg is
                    when (others := '0') =>
                        if inst = "001" then
                            toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00010");
                        elsif inst = "010" then
                            toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00001");
                        elsif inst = "011" then
                            toSeg <= ("00011", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                        elsif inst = "100" then
                            toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110");
                        end if;
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00010") then --half w
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00010", "01111");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00010", "01111") then --w
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00010", "01111", "10000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00010", "01111", "10000") then --wh
                        toSeg <= ("00000", "00000", "00000", "00000", "00010", "01111", "10000", "10001");
                    when toSeg = ("00000", "00000", "00000", "00000", "00010", "01111", "10000", "10001") then --wha
                        toSeg <= ("00000", "00000", "00000", "00010", "01111", "10000", "10001", "10010");
                    when toSeg = ("00000", "00000", "00000", "00010", "01111", "10000", "10001", "10010") then --what
                        toSeg <= ("00000", "00000", "00010", "01111", "10000", "10001", "10010", "00000");
                    when toSeg = ("00000", "00000", "00010", "01111", "10000", "10001", "10010", "00000") then --what() 
                        toSeg <= ("00000", "00010", "01111", "10000", "10001", "10010", "00000", "10011");
                    when toSeg = ("00000", "00010", "01111", "10000", "10001", "10010", "00000", "10011") then --what d
                        toSeg <= ("00010", "01111", "10000", "10001", "10010", "00000", "10011", "10100");
                    when toSeg = ("00010", "01111", "10000", "10001", "10010", "00000", "10011", "10100") then --what di
                        toSeg <= ("01111", "10000", "10001", "10010", "00000", "10011", "10100", "10011");
                    when toSeg = ("01111", "10000", "10001", "10010", "00000", "10011", "10100", "10011") then --(half w)hat did
                        toSeg <= ("10000", "10001", "10010", "00000", "10011", "10100", "10011", "00000");
                    when toSeg = ("10000", "10001", "10010", "00000", "10011", "10100", "10011", "00000") then --hat did()
                        toSeg <= ("10001", "10010", "00000", "10011", "10100", "10011", "00000", "10010");
                    when toSeg = ("10001", "10010", "00000", "10011", "10100", "10011", "00000", "10010") then --at did t
                        toSeg <= ("10010", "00000", "10011", "10100", "10011", "00000", "10010", "10000");
                    when toSeg = ("10010", "00000", "10011", "10100", "10011", "00000", "10010", "10000") then --t did th
                        toSeg <= ("00000", "10011", "10100", "10011", "00000", "10010", "10000", "01101");
                    when toSeg = ("00000", "10011", "10100", "10011", "00000", "10010", "10000", "01101") then --()did the
                        toSeg <= ("10011", "10100", "10011", "00000", "10010", "10000", "01101", "00000");
                    when toSeg = ("10011", "10100", "10011", "00000", "10010", "10000", "01101", "00000") then --did the()
                        toSeg <= ("10100", "10011", "00000", "10010", "10000", "01101", "00000", "10100");
                    when toSeg = ("10100", "10011", "00000", "10010", "10000", "01101", "00000", "10100") then --id the 1
                        toSeg <= ("10011", "00000", "10010", "10000", "01101", "00000", "10100", "00000");
                    when toSeg = ("10011", "00000", "10010", "10000", "01101", "00000", "10100", "00000") then --d the 1()
                        toSeg <= ("00000", "10010", "10000", "01101", "00000", "10100", "00000", "10101");
                    when toSeg = ("00000", "10010", "10000", "01101", "00000", "10100", "00000", "10101") then --()the 1 s
                        toSeg <= ("10010", "10000", "01101", "00000", "10100", "00000", "10101", "10001");
                    when toSeg = ("10010", "10000", "01101", "00000", "10100", "00000", "10101", "10001") then --the 1 sa
                        toSeg <= ("10000", "01101", "00000", "10100", "00000", "10101", "10001", "10110");
                    when toSeg = ("10000", "01101", "00000", "10100", "00000", "10101", "10001", "10110") then --he 1 say
                        toSeg <= ("01101", "00000", "10100", "00000", "10101", "10001", "10110", "00000");
                    when toSeg = ("01101", "00000", "10100", "00000", "10101", "10001", "10110", "00000") then --e 1 say()
                        toSeg <= ("00000", "10100", "00000", "10101", "10001", "10110", "00000", "10010");
                    when toSeg = ("00000", "10100", "00000", "10101", "10001", "10110", "00000", "10010") then --()1 say t
                        toSeg <= ("10100", "00000", "10101", "10001", "10110", "00000", "10010", "10111");
                    when toSeg = ("10100", "00000", "10101", "10001", "10110", "00000", "10010", "10111") then --1 say to
                        toSeg <= ("00000", "10101", "10001", "10110", "00000", "10010", "10111", "00000");
                    when toSeg = ("00000", "10101", "10001", "10110", "00000", "10010", "10111", "00000") then --()say to()
                        toSeg <= ("10101", "10001", "10110", "00000", "10010", "10111", "00000", "10010");
                    when toSeg = ("10101", "10001", "10110", "00000", "10010", "10111", "00000", "10010") then --say to t
                        toSeg <= ("10001", "10110", "00000", "10010", "10111", "00000", "10010", "10000")
                    when toSeg = ("10001", "10110", "00000", "10010", "10111", "00000", "10010", "10000") then --ay to th
                        toSeg <= ("10110", "00000", "10010", "10111", "00000", "10010", "10000", "01101");
                    when toSeg = ("10110", "00000", "10010", "10111", "00000", "10010", "10000", "01101") then --y to the
                        toSeg <= ("00000", "10010", "10111", "00000", "10010", "10000", "01101", "00000");
                    when toSeg = ("00000", "10010", "10111", "00000", "10010", "10000", "01101", "00000") then --()to the()
                        toSeg <= ("10010", "10111", "00000", "10010", "10000", "01101", "00000", "10111");
                    when toSeg = ("10010", "10111", "00000", "10010", "10000", "01101", "00000", "10111") then --to the 0
                        toSeg <= ("10111", "00000", "10010", "10000", "01101", "00000", "10111", "11100");
                    when toSeg = ("10111", "00000", "10010", "10000", "01101", "00000", "10111", "11100") then --o the 0?
                        toSeg <= ("00000", "10010", "10000", "01101", "00000", "10111", "11100", "00000");
                    when toSeg = ("00000", "10010", "10000", "01101", "00000", "10111", "11100", "00000") then --()the 0?()
                        toSeg <= ("10010", "10000", "01101", "00000", "10111", "11100", "00000", "10101");
                    when toSeg = ("10010", "10000", "01101", "00000", "10111", "11100", "00000", "10101") then --the 0? S
                        toSeg <= ("10000", "01101", "00000", "10111", "11100", "00000", "10101", "10010");
                    when toSeg = ("10000", "01101", "00000", "10111", "11100", "00000", "10101", "10010") then --th 0? St
                        toSeg <= ("01101", "00000", "10111", "11100", "00000", "10101", "10010", "10111");
                    when toSeg = ("01101", "00000", "10111", "11100", "00000", "10101", "10010", "10111") then --h 0? Sto
                        toSeg <= ("00000", "10111", "11100", "00000", "10101", "10010", "10111", "11000");
                    when toSeg = ("00000", "10111", "11100", "00000", "10101", "10010", "10111", "11000") then --()0? Stop
                        toSeg <= ("10111", "11100", "00000", "10101", "10010", "10111", "11000", "00000");
                    when toSeg = ("10111", "11100", "00000", "10101", "10010", "10111", "11000", "00000") then --0? Stop()
                        toSeg ,= ("11100", "00000", "10101", "10010", "10111", "11000", "00000", "11001");
                    when toSeg = ("11100", "00000", "10101", "10010", "10111", "11000", "00000", "11001") then --? Stop b
                        toSeg <= ("00000", "10101", "10010", "10111", "11000", "00000", "11001", "10111");
                    when toSeg = ("00000", "10101", "10010", "10111", "11000", "00000", "11001", "10111") then --()Stop bo
                        toSeg <= ("10101", "10010", "10111", "11000", "00000", "11001", "10111", "10111");
                    when toSeg = ("10101", "10010", "10111", "11000", "00000", "11001", "10111", "10111") then --Stop boo
                        toSeg <= ("10010", "10111", "11000", "00000", "11001", "10111", "10111", "10100");
                    when toSeg = ("10010", "10111", "11000", "00000", "11001", "10111", "10111", "10100") then --top bool
                        toSeg <= ("10111", "11000", "00000", "11001", "10111", "10111", "10100", "01101")
                    when toSeg = ("10111", "11000", "00000", "11001", "10111", "10111", "10100", "01101") then --op boole
                        toSeg <= ("11000", "00000", "11001", "10111", "10111", "10100", "01101", "10001");
                    when toSeg = ("11000", "00000", "11001", "10111", "10111", "10100", "01101", "10001") then --p boolea
                        toSeg <= ("00000", "11001", "10111", "10111", "10100", "01101", "10001", "11010");
                    when toSeg = ("00000", "11001", "10111", "10111", "10100", "01101", "10001", "11010") then --()boolean
                        toSeg <= ("11001", "10111", "10111", "10100", "01101", "10001", "11010", "00000");
                    when toSeg = ("11001", "10111", "10111", "10100", "01101", "10001", "11010", "00000") then --boolean()
                        toSeg <= ("10111", "10111", "10100", "01101", "10001", "11010", "00000", "11010");
                    when toSeg = ("10111", "10111", "10100", "01101", "10001", "11010", "00000", "11010") then --oolean (half m)
                        toSeg <= ("10111", "10100", "01101", "10001", "11010", "00000", "11010", "11011");
                    when toSeg = ("10111", "10100", "01101", "10001", "11010", "00000", "11010", "11011") then --olean m
                        toSeg <= ("10100", "01101", "10001", "11010", "00000", "11010", "11011", "01101");
                    when toSeg = ("10100", "01101", "10001", "11010", "00000", "11010", "11011", "01101") then --olean me
                        toSeg <= ("01101", "10001", "11010", "00000", "11010", "11011", "01101", "00000");
                    when toSeg = ("01101", "10001", "11010", "00000", "11010", "11011", "01101", "00000") then --lean me()
                        toSeg <= ("10001", "11010", "00000", "11010", "11011", "01101", "00000", "00000");
                    when toSeg = ("10001", "11010", "00000", "11010", "11011", "01101", "00000", "00000") then --ean me()()
                        toSeg <= ("11010", "00000", "11010", "11011", "01101", "00000", "00000", "00000");
                    when toSeg = ("11010", "00000", "11010", "11011", "01101", "00000", "00000", "00000") then --an me()()()
                        toSeg <= ("00000", "11010", "11011", "01101", "00000", "00000", "00000", "00000");
                    when toSeg = ("00000", "11010", "11011", "01101", "00000", "00000", "00000", "00000") then --n me()()()()
                        toSeg <= ("11010", "11011", "01101", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("11010", "11011", "01101", "00000", "00000", "00000", "00000", "00000") then --()me()()()()()
                        toSeg <= ("11011", "01101", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("11011", "01101", "00000", "00000", "00000", "00000", "00000", "00000") then --(half m)e()()()()()()
                        toSeg <= ("01101", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("01101", "00000", "00000", "00000", "00000", "00000", "00000", "00000") then --e()()()()()()()
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00001") then --snake1 to left
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00001", "00101");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00001", "00101") then --snake2
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00001", "00101", "00101");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00001", "00101", "00101") then --snake3
                        toSeg <= ("00000", "00000", "00000", "00000", "00001", "00101", "00101", "00010");
                    when toSeg = ("00000", "00000", "00000", "00000", "00001", "00101", "00101", "00010") then --snake4
                        toSeg <= ("00000", "00000", "00000", "00001", "00101", "00101", "00010", "00000");
                    when toSeg = ("00000", "00000", "00000", "00001", "00101", "00101", "00010", "00000") then --snake5
                        toSeg <= ("00000", "00000", "00001", "00101", "00101", "00010", "00000", "00000");
                    when toSeg = ("00000", "00000", "00001", "00101", "00101", "00010", "00000", "00000") then --snake6
                        toSeg <= ("00000", "00001", "00101", "00101", "00010", "00000", "00000", "00000");
                    when toSeg = ("00000", "00001", "00101", "00101", "00010", "00000", "00000", "00000") then --snake7
                        toSeg <= ("00001", "00101", "00101", "00010", "00000", "00000", "00000", "00000");
                    when toSeg = ("00001", "00101", "00101", "00010", "00000", "00000", "00000", "00000") then --snake8
                        toSeg <= ("00101", "00101", "00010", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00101", "00101", "00010", "00000", "00000", "00000", "00000", "00000") then --snake9
                        toSeg <= ("00101", "00010", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00101", "00010", "00000", "00000", "00000", "00000", "00000", "00000") then --snake10
                        toSeg <= ("00010", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00010", "00000", "00000", "00000", "00000", "00000", "00000", "00000") then --snake11
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00011", "00000", "00000", "00000", "00000", "00000", "00000", "00000") then --snake1 to right
                        toSeg <= ("00101", "00011", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00101", "00011", "00000", "00000", "00000", "00000", "00000", "00000") then --snake2
                        toSeg <= ("00101", "00101", "00011", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00101", "00101", "00011", "00000", "00000", "00000", "00000", "00000") then --snake3
                        toSeg <= ("00100", "00101", "00101", "00011", "00000", "00000", "00000", "00000");
                    when toSeg = ("00100", "00101", "00101", "00011", "00000", "00000", "00000", "00000") then --snake4
                        toSeg <= ("00000", "00100", "00101", "00101", "00011", "00000", "00000", "00000");
                    when toSeg = ("00000", "00100", "00101", "00101", "00011", "00000", "00000", "00000") then --snake5
                        toSeg <= ("00000", "00000", "00100", "00101", "00101", "00011", "00000", "00000");
                    when toSeg = ("00000", "00000", "00100", "00101", "00101", "00011", "00000", "00000") then --snake6
                        toSeg <= ("00000", "00000", "00000", "00100", "00101", "00101", "00011", "00000");
                    when toSeg = ("00000", "00000", "00000", "00100", "00101", "00101", "00011", "00000") then --snake7
                        toSeg <= ("00000", "00000", "00000", "00000", "00100", "00101", "00101", "00011");
                    when toSeg = ("00000", "00000", "00000", "00000", "00100", "00101", "00101", "00011") then --snake8
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00100", "00101", "00101");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00100", "00101", "00101") then --snake9
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00100", "00101");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00100", "00101") then --snake10
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00100");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00100") then --snake11
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110") then --fly1
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00111");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00111") then --fly2
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01000") then --fly3
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01001");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01001") then --fly4
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110") then --fly5
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01010");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01010") then --fly6
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01011");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01011") then --fly7
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01100");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "01100") then --fly8
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110") then --fly9
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000") then --fly10
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00111", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00111", "00000") then --fly11
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "01000", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "01000", "00000") then --fly12
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "01001", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "01001", "00000") then --fly13
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000") then --fly14
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "01010", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "01010", "00000") then --fly15
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "01011", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "01011", "00000") then --fly16
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "01100", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "01100", "00000") then --fly17
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000");
                    when toSeg = ("00000", "00000", "00000", "00000", "00000", "00000", "00110", "00000") then --fly18
                        toSeg <= ("00000", "00000", "00000", "00000", "00000", "00000", "00000", "00110");
                end case;
            end if;
        end if;
    end process;



end architecture;