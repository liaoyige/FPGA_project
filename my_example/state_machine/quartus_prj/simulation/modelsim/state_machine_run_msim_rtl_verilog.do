transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/quartus_work/my_example/state_machine/rtl {D:/quartus_work/my_example/state_machine/rtl/state_machine.v}

vlog -vlog01compat -work work +incdir+D:/quartus_work/my_example/state_machine/quartus_prj/../sim {D:/quartus_work/my_example/state_machine/quartus_prj/../sim/tb_state_machine.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_state_machine

add wave *
view structure
view signals
run 20 us
