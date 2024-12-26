###################################################################

# Created by write_sdc on Wed Dec 25 17:15:39 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports REF_CLK]  -name ref_clk  -period 20  -waveform {0 10}
set_clock_latency -source 0.2  [get_clocks ref_clk]
set_clock_uncertainty 0.1  [get_clocks ref_clk]
create_clock [get_ports UART_CLK]  -name uart_clk  -period 1040  -waveform {0 520}
set_clock_latency -source 0.2  [get_clocks uart_clk]
set_clock_uncertainty 0.2  [get_clocks uart_clk]
create_clock [get_ports SCAN_CLK]  -name scan_clk  -period 3000  -waveform {0 1500}
set_clock_latency -source 0.2  [get_clocks scan_clk]
set_clock_uncertainty 0.3  [get_clocks scan_clk]
create_generated_clock [get_pins ClockDividerTopSys8/ClockDivider2Top/o_div_clk]  -name uart_clk_2  -source [get_ports UART_CLK]  -master_clock uart_clk  -divide_by 2  -add
create_generated_clock [get_pins ClockDividerTopSys8/ClockDivider4Top/o_div_clk]  -name uart_clk_4  -source [get_pins ClockDividerTopSys8/ClockDivider2Top/o_div_clk]  -master_clock uart_clk_2  -divide_by 2  -add
create_generated_clock [get_pins ClockDividerTopSys8/o_div_clk]  -name tx_clk  -source [get_pins ClockDividerTopSys8/ClockDivider4Top/o_div_clk]  -master_clock uart_clk_4  -divide_by 2  -add
create_generated_clock [get_pins REF_SCAN_MUX/OUT]  -name ref_clk_mux  -source [get_ports REF_CLK]  -master_clock ref_clk  -divide_by 1  -add
create_generated_clock [get_pins REF_SCAN_MUX/OUT]  -name scan_ref_clk_mux  -source [get_ports SCAN_CLK]  -master_clock scan_clk  -divide_by 1  -add
create_generated_clock [get_pins UART_SCAN_MUX/OUT]  -name uart_clk_mux  -source [get_ports UART_CLK]  -master_clock uart_clk  -divide_by 1  -add
create_generated_clock [get_pins UART_SCAN_MUX/OUT]  -name scan_uart_clk_mux  -source [get_ports SCAN_CLK]  -master_clock scan_clk  -divide_by 1  -add
create_generated_clock [get_pins TX_SCAN_MUX/OUT]  -name tx_clk_mux  -source [get_pins ClockDividerTopSys8/o_div_clk]  -master_clock tx_clk  -divide_by 1  -add
create_generated_clock [get_pins TX_SCAN_MUX/OUT]  -name scan_tx_clk_mux  -source [get_ports SCAN_CLK]  -master_clock scan_clk  -divide_by 1  -add
set_input_delay -clock uart_clk  -max 0.1  [get_ports RX_IN]
set_clock_groups  -logically_exclusive -name uart_clk_2  -group [get_clocks    \
uart_clk] -group [get_clocks scan_clk]
set_clock_groups  -logically_exclusive -name tx_clk_1  -group [get_clocks      \
tx_clk] -group [get_clocks scan_clk]
set_clock_groups  -logically_exclusive -name ref_clk_1  -group [get_clocks     \
ref_clk] -group [get_clocks scan_clk]
set_clock_groups  -physically_exclusive -name ref_clk_mux_1  -group            \
[get_clocks ref_clk_mux] -group [get_clocks scan_ref_clk_mux]
set_clock_groups  -physically_exclusive -name uart_clk_mux_1  -group           \
[get_clocks uart_clk_mux] -group [get_clocks scan_uart_clk_mux]
set_clock_groups  -physically_exclusive -name tx_clk_mux_1  -group [get_clocks \
tx_clk_mux] -group [get_clocks scan_tx_clk_mux]
set_clock_groups  -asynchronous -name uart_clk_1  -group [list [get_clocks     \
uart_clk] [get_clocks tx_clk]] -group [get_clocks ref_clk]
set_input_transition -max 0.2  [get_ports RX_IN]
set_input_transition -min 0.2  [get_ports RX_IN]
