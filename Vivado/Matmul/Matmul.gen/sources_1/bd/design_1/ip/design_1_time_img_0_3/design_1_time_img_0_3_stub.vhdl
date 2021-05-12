-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue May 11 21:06:35 2021
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/guill/Documents/Overlay/Matmul/Matmul/Matmul.gen/sources_1/bd/design_1/ip/design_1_time_img_0_3/design_1_time_img_0_3_stub.vhdl
-- Design      : design_1_time_img_0_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_time_img_0_3 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    avg_TVALID : in STD_LOGIC;
    avg_TREADY : out STD_LOGIC;
    avg_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cnt_TVALID : in STD_LOGIC;
    cnt_TREADY : out STD_LOGIC;
    cnt_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    res_TVALID : out STD_LOGIC;
    res_TREADY : in STD_LOGIC;
    res_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_time_img_0_3;

architecture stub of design_1_time_img_0_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,avg_TVALID,avg_TREADY,avg_TDATA[31:0],cnt_TVALID,cnt_TREADY,cnt_TDATA[31:0],res_TVALID,res_TREADY,res_TDATA[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "time_img,Vivado 2020.2";
begin
end;
