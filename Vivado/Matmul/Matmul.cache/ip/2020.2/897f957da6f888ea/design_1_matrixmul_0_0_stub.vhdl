-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue May 11 17:20:05 2021
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_matrixmul_0_0_stub.vhdl
-- Design      : design_1_matrixmul_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    a_TVALID : in STD_LOGIC;
    a_TREADY : out STD_LOGIC;
    a_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    b_TVALID : in STD_LOGIC;
    b_TREADY : out STD_LOGIC;
    b_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    res_TVALID : out STD_LOGIC;
    res_TREADY : in STD_LOGIC;
    res_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,a_TVALID,a_TREADY,a_TDATA[31:0],b_TVALID,b_TREADY,b_TDATA[31:0],res_TVALID,res_TREADY,res_TDATA[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "matrixmul,Vivado 2020.2";
begin
end;
