###################################################################

# Created by write_sdc on Thu Mar 27 12:15:02 2025

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions slow -library slow
set_wire_load_model -name tsmc13_wl10 -library slow
set_load -pin_load 1 [get_ports READ_PT]
set_load -pin_load 1 [get_ports {DROP_XY[9]}]
set_load -pin_load 1 [get_ports {DROP_XY[8]}]
set_load -pin_load 1 [get_ports {DROP_XY[7]}]
set_load -pin_load 1 [get_ports {DROP_XY[6]}]
set_load -pin_load 1 [get_ports {DROP_XY[5]}]
set_load -pin_load 1 [get_ports {DROP_XY[4]}]
set_load -pin_load 1 [get_ports {DROP_XY[3]}]
set_load -pin_load 1 [get_ports {DROP_XY[2]}]
set_load -pin_load 1 [get_ports {DROP_XY[1]}]
set_load -pin_load 1 [get_ports {DROP_XY[0]}]
set_load -pin_load 1 [get_ports DROP_V]
set_ideal_network [get_ports CLK]
create_clock [get_ports CLK]  -period 8  -waveform {0 4}
set_clock_latency 0.5  [get_clocks CLK]
set_clock_uncertainty 0.1  [get_clocks CLK]
set_input_delay -clock CLK  -max 1  [get_ports RST]
set_input_delay -clock CLK  -min 0  [get_ports RST]
set_input_delay -clock CLK  -max 1  [get_ports {PT_XY[4]}]
set_input_delay -clock CLK  -min 0  [get_ports {PT_XY[4]}]
set_input_delay -clock CLK  -max 1  [get_ports {PT_XY[3]}]
set_input_delay -clock CLK  -min 0  [get_ports {PT_XY[3]}]
set_input_delay -clock CLK  -max 1  [get_ports {PT_XY[2]}]
set_input_delay -clock CLK  -min 0  [get_ports {PT_XY[2]}]
set_input_delay -clock CLK  -max 1  [get_ports {PT_XY[1]}]
set_input_delay -clock CLK  -min 0  [get_ports {PT_XY[1]}]
set_input_delay -clock CLK  -max 1  [get_ports {PT_XY[0]}]
set_input_delay -clock CLK  -min 0  [get_ports {PT_XY[0]}]
set_output_delay -clock CLK  1  [get_ports READ_PT]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[9]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[8]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[7]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[6]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[5]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[4]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[3]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[2]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[1]}]
set_output_delay -clock CLK  1  [get_ports {DROP_XY[0]}]
set_output_delay -clock CLK  1  [get_ports DROP_V]
set_drive 0.1  [get_ports CLK]
set_drive 0.1  [get_ports RST]
set_drive 0.1  [get_ports {PT_XY[4]}]
set_drive 0.1  [get_ports {PT_XY[3]}]
set_drive 0.1  [get_ports {PT_XY[2]}]
set_drive 0.1  [get_ports {PT_XY[1]}]
set_drive 0.1  [get_ports {PT_XY[0]}]
