onerror {exit -code 1}
vlib work
vlog -work work ly_2257_3.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.ly_2257_3_vlg_vec_tst
vcd file -direction ly_2257_3.msim.vcd
vcd add -internal ly_2257_3_vlg_vec_tst/*
vcd add -internal ly_2257_3_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f



