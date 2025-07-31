import uvm_pkg::*;
`include "uvm_macros.svh"

import "DPI-C" function int unsigned alu_dpi_model(input int unsigned opa,opb,op);

`include "constructors.sv"
`include "alu_tx.sv"
`include "alu_seq.sv"
`include "alu_sqr.sv"
`include "alu_drv.sv"
`include "alu_iMon.sv"
`include "alu_oMon.sv"
`include "alu_magent.sv"
`include "alu_sagent.sv"
`include "alu_ref_model.sv"
`include "alu_sbd.sv"
`include "alu_env.sv"
`include "test.sv"

