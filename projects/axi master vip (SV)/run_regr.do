vlog -cover fcbest top.sv
vsim -cover -novopt -suppress 12110 top +testname=SINGLE_WRITE_TEST
coverage save -onexit SINGLE_WRITE_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=SINGLE_READ_TEST
coverage save -onexit SINGLE_READ_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=10_WRITE_READ
coverage save -onexit 10_WRITE_READ.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=WRAP_TEST
coverage save -onexit WRAP_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=INCR_TEST
coverage save -onexit INCR_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=FIXED_TEST
coverage save -onexit FIXED_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=WRITE_ALIGNED_TEST
coverage save -onexit WRITE_ALIGNED_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=WRITE_UNALIGNED_TEST
coverage save -onexit WRITE_UNALIGNED_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=NARROW_TRANSFER_TEST
coverage save -onexit NARROW_TRANSFER_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=INTERLEAVED_AND_OUT_OF_ORDER
coverage save -onexit INTERLEAVED_AND_OUT_OF_ORDER.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=SLAVE_ERROR_TEST
coverage save -onexit SLAVE_ERROR_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=DECODE_ERROR_TEST
coverage save -onexit DECODE_ERROR_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=4KB_BOUNDARY_TEST
coverage save -onexit 4KB_BOUNDARY_TEST.ucdb
run -all

vsim -cover -novopt -suppress 12110 top +testname=4KB_BOUNDARY_TEST

vcov merge final.ucdb SINGLE_WRITE_TEST.ucdb SINGLE_READ_TEST.ucdb 10_WRITE_READ.ucdb WRAP_TEST.ucdb INCR_TEST.ucdb FIXED_TEST.ucdb WRITE_ALIGNED_TEST.ucdb WRITE_UNALIGNED_TEST.ucdb NARROW_TRANSFER_TEST.ucdb INTERLEAVED_AND_OUT_OF_ORDER.ucdb SLAVE_ERROR_TEST.ucdb DECODE_ERROR_TEST.ucdb 4KB_BOUNDARY_TEST.ucdb
