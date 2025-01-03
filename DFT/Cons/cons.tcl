##Clock Definitions
puts "Functional Clocks Definition"
create_clock -name ref_clk  -period 20   [get_ports REF_CLK]
create_clock -name uart_clk -period 1040 [get_ports UART_CLK]

puts "Scan Clocks Definition"
create_clock -name scan_clk -period 3000 [get_ports SCAN_CLK]

puts "Generated Clocks Definition"
##ClockDivider
create_generated_clock -name uart_clk_2 -divide_by 2 [get_pins ClockDividerTopSys8/ClockDivider2Top/o_div_clk] \
                       -master_clock uart_clk -source [get_ports UART_CLK]
create_generated_clock -name uart_clk_4 -divide_by 2 [get_pins ClockDividerTopSys8/ClockDivider4Top/o_div_clk] \
                       -master_clock uart_clk_2 -source [get_pins ClockDividerTopSys8/ClockDivider2Top/o_div_clk]
create_generated_clock -name tx_clk -divide_by 2 [get_pins ClockDividerTopSys8/o_div_clk] \
                       -master_clock uart_clk_4 -source [get_pins ClockDividerTopSys8/ClockDivider4Top/o_div_clk]
##Constrainting the output of the clock MUXes
create_generated_clock -name ref_clk_mux -divide_by 1 [get_pins REF_SCAN_MUX/OUT] \
   		       -master_clock ref_clk -source [get_ports REF_CLK] -add
create_generated_clock -name scan_ref_clk_mux -divide_by 1 [get_pins REF_SCAN_MUX/OUT] \
   		       -master_clock scan_clk -source [get_ports SCAN_CLK] -add
create_generated_clock -name uart_clk_mux -divide_by 1 [get_pins UART_SCAN_MUX/OUT] \
   		       -master_clock uart_clk -source [get_ports UART_CLK] -add
create_generated_clock -name scan_uart_clk_mux -divide_by 1 [get_pins UART_SCAN_MUX/OUT] \
   		       -master_clock scan_clk -source [get_ports SCAN_CLK] -add
create_generated_clock -name tx_clk_mux -divide_by 1 [get_pins TX_SCAN_MUX/OUT] \
   		       -master_clock tx_clk -source [get_pins ClockDividerTopSys8/o_div_clk] -add
create_generated_clock -name scan_tx_clk_mux -divide_by 1 [get_pins TX_SCAN_MUX/OUT] \
   		       -master_clock scan_clk -source [get_ports SCAN_CLK] -add

##Clocks Latencies
puts "Clocks Latencies and uncertainties"
set_clock_latency -source 0.2 [get_clocks ref_clk]
set_clock_latency -source 0.2 [get_clocks uart_clk]
set_clock_latency -source 0.2 [get_clocks scan_clk]
set_clock_uncertainty -hold 0.1 [get_clocks ref_clk]
set_clock_uncertainty -setup 0.1 [get_clocks ref_clk]
set_clock_uncertainty -hold 0.2 [get_clocks uart_clk]
set_clock_uncertainty -setup 0.2 [get_clocks uart_clk] 
set_clock_uncertainty -hold 0.3 [get_clocks scan_clk]
set_clock_uncertainty -setup 0.3 [get_clocks scan_clk]

##Clocks Relationship
puts "Clock Relationship"
set_clock_groups -asynchronous -group {uart_clk tx_clk} -group {ref_clk}
set_clock_groups -logically_exclusive -group {uart_clk} -group {scan_clk}
set_clock_groups -logically_exclusive -group {tx_clk}   -group {scan_clk}
set_clock_groups -logically_exclusive -group {ref_clk}  -group {scan_clk}

set_clock_groups -physically_exclusive -group {ref_clk_mux} -group {scan_ref_clk_mux}
set_clock_groups -physically_exclusive -group {uart_clk_mux} -group {scan_uart_clk_mux}
set_clock_groups -physically_exclusive -group {tx_clk_mux} -group {scan_tx_clk_mux}

##Input Delay
puts "Input delay and transition"
set_input_delay -max 0.1 -clock [get_clocks uart_clk] [get_ports RX_IN]
set_input_transition 0.2 [get_ports RX_IN]
##Output Delay
puts "Output delay and load capacitance"
set_output_delay -max 0.1 -clock [get_clocks uart_clk] [get_ports TX_OUT
set_load 0.2 [get_ports TX_OUT]

##DONT TOUCH
set_dont_touch_network [all_clocks]


##Case Analysis
set_case_analysis 0 [get_ports SCAN_EN]
set_case_analysis 1 [get_ports TEST_MODE]
