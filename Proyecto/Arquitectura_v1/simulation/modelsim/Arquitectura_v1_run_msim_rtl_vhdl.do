transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Divisor_v1/Divisor_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/DataOut_v1/DataOut_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/DataIn_v1/DataIn_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/UControl_v1/UControl_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Rom_v1/Rom_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Register_v1/Register_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Ram_v1/Ram_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/PC_v1/PC_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Or_v1/Or_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/MuxPc_v1/MuxPc_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/MuxAlu_v1/MuxAlu_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/IR_v1/IR_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/And_v1/And_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Alu_v1/Alu_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Alu_Out_v1/Alu_Out_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Adder_v1/Adder_v1.vhd}
vcom -93 -work work {C:/VHDL_Project/VHDL_Project2/Arquitectura_v1/Arquitectura_v1.vhd}

