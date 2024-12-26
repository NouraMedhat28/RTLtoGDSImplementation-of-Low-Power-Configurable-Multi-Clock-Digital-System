# -RTLtoGDSImplementation-of-Low-Power-Configurable-Multi-Clock-Digital-System
It is responsible for receiving commands through UART receiver to do different system functions such as  register File reading/writing or doing some processing using ALU block and send result as well as CRC bits of  result Using 4 bytes frame through UART transmitter communication protocol. 
IMPORTANT NOTE: When copying the NanGateOpenCellLibrary standard cell library make sure that all the CEL and FRAM views ends with ":1"
For example: AND2_X4 should be AND2_X4:1. There a script "script.tcl" that performs the renaming process, just replace the "_" with the delimeter needed.
