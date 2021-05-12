set moduleName time_img
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {time_img}
set C_modelType { void 0 }
set C_modelArgList {
	{ avg int 32 regular {axi_s 0 volatile  { avg Data } }  }
	{ cnt int 32 regular {axi_s 0 volatile  { cnt Data } }  }
	{ res int 32 regular {axi_s 1 volatile  { res Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "avg", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "avg","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "cnt", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "cnt","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "res", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "res","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ avg_TDATA sc_in sc_lv 32 signal 0 } 
	{ avg_TVALID sc_in sc_logic 1 invld 0 } 
	{ avg_TREADY sc_out sc_logic 1 inacc 0 } 
	{ cnt_TDATA sc_in sc_lv 32 signal 1 } 
	{ cnt_TVALID sc_in sc_logic 1 invld 1 } 
	{ cnt_TREADY sc_out sc_logic 1 inacc 1 } 
	{ res_TDATA sc_out sc_lv 32 signal 2 } 
	{ res_TVALID sc_out sc_logic 1 outvld 2 } 
	{ res_TREADY sc_in sc_logic 1 outacc 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "avg_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "avg", "role": "TDATA" }} , 
 	{ "name": "avg_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "avg", "role": "TVALID" }} , 
 	{ "name": "avg_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "avg", "role": "TREADY" }} , 
 	{ "name": "cnt_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cnt", "role": "TDATA" }} , 
 	{ "name": "cnt_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "cnt", "role": "TVALID" }} , 
 	{ "name": "cnt_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "cnt", "role": "TREADY" }} , 
 	{ "name": "res_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "res", "role": "TDATA" }} , 
 	{ "name": "res_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "res", "role": "TVALID" }} , 
 	{ "name": "res_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "res", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "time_img",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1048600", "EstimateLatencyMax" : "1048600",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "avg", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "avg_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cnt", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cnt_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "res", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "res_TDATA_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_6_no_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_avg_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_cnt_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_res_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	time_img {
		avg {Type I LastRead 1 FirstWrite -1}
		cnt {Type I LastRead 1 FirstWrite -1}
		res {Type O LastRead -1 FirstWrite 23}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1048600", "Max" : "1048600"}
	, {"Name" : "Interval", "Min" : "1048601", "Max" : "1048601"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	avg { axis {  { avg_TDATA in_data 0 32 }  { avg_TVALID in_vld 0 1 }  { avg_TREADY in_acc 1 1 } } }
	cnt { axis {  { cnt_TDATA in_data 0 32 }  { cnt_TVALID in_vld 0 1 }  { cnt_TREADY in_acc 1 1 } } }
	res { axis {  { res_TDATA out_data 1 32 }  { res_TVALID out_vld 1 1 }  { res_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
