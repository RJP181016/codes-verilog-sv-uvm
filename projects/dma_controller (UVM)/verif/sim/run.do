vlog -cover fcbest\
+incdir+../../dma_axi64 \
+incdir+../top \
+incdir+../apb \
+incdir+../axi \
+incdir+../perif \
+incdir+../ref \
+incdir+../reg \
+incdir+../sbd \
+incdir+C:/questasim64_10.7c/uvm-1.1d/src \
../top/top.sv

vsim -cover -novopt -suppress 12110 -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi top +UVM_TESTNAME=dma_periph_transfer_test +UVM_VERBOSITY=UVM_LOW +UVM_TIMEOUT=100000
add log -r sim:/top/*
do wave.do
run -all
