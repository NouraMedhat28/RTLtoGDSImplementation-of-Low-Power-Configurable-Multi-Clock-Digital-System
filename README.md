# -RTLtoGDSImplementation-of-Low-Power-Configurable-Multi-Clock-Digital-System
It is responsible for receiving commands through UART receiver to do different system functions such as  register File reading/writing or doing some processing using ALU block and send result as well as CRC bits of  result Using 4 bytes frame through UART transmitter communication protocol. 
IMPORTANT NOTE: When copying the NanGateOpenCellLibrary standard cell library make sure that all the CEL and FRAM views ends with ":1"
For example: AND2_X4 should be AND2_X4:1. There is a script "script.tcl" that performs the renaming process, just run it under the CEL and FRAM directories. This is mandatory to be able to parse the Verilog netlist in
the Backend flow. Also, to get the floorplanning created successfully, make sure the name of the unitTile file under the CEL directory is unitTile:1 

Synopsys Used Tools: DesignCompiler, Formality and IC Compiler
![SystemTop](https://github.com/user-attachments/assets/e9786c13-ea5f-475d-a114-37fb4251d3e7)
