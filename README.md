README

Ensc-252-Final-Project

Sonny Ma and Brian Chan

Message: What did the 1 say to the 0? Stop Boolean me!

Since we directly ordered the Control Unit using the previous iteration there are no instructions in ISA table

Non-vhdl files will be attached as pdfs

SMDB \ to get hex and ledr to light up and pausing 
SMDB -> prescale \ for clock
SMDB -> debouncer \ for debouncing **(does not work)
SMDB -> asip -> datapath -> scheduler \ to get instructions of which program to do
SMDB -> asip -> controlunit \ to get what instuctions for what each hex should be
SMDB -> asip -> iocontroller -> c7s \ to convert instuctions of hex to binary of the segments of hex

Cannot figure out why debouncer does not work (makes all hex led light up) (has debouncers in structual diagram)

Have two structual diagrams (one for overall smdb and one for asip components)

Counts program when it is in it's last iteration (not exactly when program ends but basically the same)

Does not have stop_proj because we think it does the same thing as soft_rst so we think it is unnecessary

Have two flies in two different boxes (hex 17-16 and hex 1-0) that moves in different patterns

Made sure no redundancies for c7s

Some inputs/outputs were changed to buffers like toSeg so we can read it for next iterations

No debug folder because we did not use testbenches/waveforms and instead just looked at the fgpa board's output