## Generated SDC file "DevBD.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 14.1.1 Build 190 01/19/2015 SJ Web Edition"

## DATE    "Sat Feb 28 15:18:23 2015"

##
## DEVICE  "EP4CE10F17C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {clk50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk50}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[15]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO8_2[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {IO16_2[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {LED[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {LED[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {LED[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk50}]  5.000 [get_ports {LED[3]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_6v8:dffpipe9|dffe10a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_5v8:dffpipe6|dffe7a*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

