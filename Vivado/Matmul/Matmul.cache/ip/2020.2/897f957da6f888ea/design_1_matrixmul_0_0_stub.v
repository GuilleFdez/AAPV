// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue May 11 17:20:05 2021
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_matrixmul_0_0_stub.v
// Design      : design_1_matrixmul_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "matrixmul,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, a_TVALID, a_TREADY, a_TDATA, 
  b_TVALID, b_TREADY, b_TDATA, res_TVALID, res_TREADY, res_TDATA)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,a_TVALID,a_TREADY,a_TDATA[31:0],b_TVALID,b_TREADY,b_TDATA[31:0],res_TVALID,res_TREADY,res_TDATA[31:0]" */;
  input ap_clk;
  input ap_rst_n;
  input a_TVALID;
  output a_TREADY;
  input [31:0]a_TDATA;
  input b_TVALID;
  output b_TREADY;
  input [31:0]b_TDATA;
  output res_TVALID;
  input res_TREADY;
  output [31:0]res_TDATA;
endmodule
