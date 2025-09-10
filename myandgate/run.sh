# Jackson Coxson
iverilog -o sim.vvp myandgate.srcs/sim_1/new/testbench.v myandgate.srcs/sources_1/new/myandgate.v

echo "Type 'finish' when finished"
vvp sim.vvp

surfer wave.vcd
