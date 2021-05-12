// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue May 11 21:06:33 2021
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_time_img_0_3_stub.v
// Design      : design_1_time_img_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "time_img,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, avg_TVALID, avg_TREADY, 
  avg_TDATA, cnt_TVALID, cnt_TREADY, cnt_TDATA, res_TVALID, res_TREADY, res_TDATA)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,avg_TVALID,avg_TREADY,avg_TDATA[31:0],cnt_TVALID,cnt_TREADY,cnt_TDATA[31:0],res_TVALID,res_TREADY,res_TDATA[31:0]" */;
  input ap_clk;
  input ap_rst_n;
  input avg_TVALID;
  output avg_TREADY;
  input [31:0]avg_TDATA;
  input cnt_TVALID;
  output cnt_TREADY;
  input [31:0]cnt_TDATA;
  output res_TVALID;
  input res_TREADY;
  output [31:0]res_TDATA;
endmodule
