transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/quartus_work/half_adder/rtl {D:/quartus_work/half_adder/rtl/half_adder.v}

vlog -vlog01compat -work work +incdir+D:/quartus_work/half_adder/quartus_prj/../sim {D:/quartus_work/half_adder/quartus_prj/../sim/tb_half_adder.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_half_adder

add wave *
view structure
view signals
run 1 us
