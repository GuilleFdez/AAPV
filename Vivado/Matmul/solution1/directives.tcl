############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode axis -register_mode both -register "matrixmul" a
set_directive_interface -mode axis -register_mode both -register "matrixmul" b
set_directive_interface -mode axis -register_mode both -register "matrixmul" res
set_directive_interface -mode ap_ctrl_none "matrixmul"
set_directive_pipeline -II 1 "matrixmul/col"
