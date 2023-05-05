/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Apr 26 17:16:13 2023
/////////////////////////////////////////////////////////////


module reset_synchronizer_1 ( clk, reset_n, reset_synchronized );
  input clk, reset_n;
  output reset_synchronized;
  wire   \Q[0] ;

  DFFRQX1M \Q_reg[1]  ( .D(\Q[0] ), .CK(clk), .RN(reset_n), .Q(
        reset_synchronized) );
  DFFRQX1M \Q_reg[0]  ( .D(1'b1), .CK(clk), .RN(reset_n), .Q(\Q[0] ) );
endmodule


module uart_transmitter_controller ( clk, reset_n, alu_result_valid, 
        alu_result, read_data_valid, read_data, transmitter_busy_sync, 
        transmitter_q_pulse_generator, transmitter_parallel_data_valid, 
        transmitter_parallel_data, uart_receiver_controller_en );
  input [15:0] alu_result;
  input [7:0] read_data;
  output [7:0] transmitter_parallel_data;
  input clk, reset_n, alu_result_valid, read_data_valid, transmitter_busy_sync,
         transmitter_q_pulse_generator;
  output transmitter_parallel_data_valid, uart_receiver_controller_en;
  wire   n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n49, n50, n51, n52, n53, n54;
  wire   [2:0] current_state;
  wire   [15:0] message;
  wire   [1:0] transmission_current_state;

  DFFRQX1M \message_reg[15]  ( .D(n47), .CK(clk), .RN(reset_n), .Q(message[15]) );
  DFFRQX1M \message_reg[14]  ( .D(n46), .CK(clk), .RN(reset_n), .Q(message[14]) );
  DFFRQX1M \message_reg[13]  ( .D(n45), .CK(clk), .RN(reset_n), .Q(message[13]) );
  DFFRQX1M \message_reg[12]  ( .D(n44), .CK(clk), .RN(reset_n), .Q(message[12]) );
  DFFRQX1M \message_reg[11]  ( .D(n43), .CK(clk), .RN(reset_n), .Q(message[11]) );
  DFFRQX1M \message_reg[10]  ( .D(n42), .CK(clk), .RN(reset_n), .Q(message[10]) );
  DFFRQX1M \message_reg[9]  ( .D(n41), .CK(clk), .RN(reset_n), .Q(message[9])
         );
  DFFRQX1M \message_reg[8]  ( .D(n40), .CK(clk), .RN(reset_n), .Q(message[8])
         );
  DFFRQX1M \message_reg[7]  ( .D(n39), .CK(clk), .RN(reset_n), .Q(message[7])
         );
  DFFRQX1M \message_reg[6]  ( .D(n38), .CK(clk), .RN(n54), .Q(message[6]) );
  DFFRQX1M \message_reg[5]  ( .D(n37), .CK(clk), .RN(n54), .Q(message[5]) );
  DFFRQX1M \message_reg[4]  ( .D(n36), .CK(clk), .RN(n54), .Q(message[4]) );
  DFFRQX1M \message_reg[3]  ( .D(n35), .CK(clk), .RN(n54), .Q(message[3]) );
  DFFRQX1M \message_reg[2]  ( .D(n34), .CK(clk), .RN(n54), .Q(message[2]) );
  DFFRQX1M \message_reg[1]  ( .D(n33), .CK(clk), .RN(n54), .Q(message[1]) );
  DFFRQX1M \message_reg[0]  ( .D(n32), .CK(clk), .RN(n54), .Q(message[0]) );
  DFFRQX1M \transmission_current_state_reg[0]  ( .D(n31), .CK(clk), .RN(n54), 
        .Q(transmission_current_state[0]) );
  DFFSQX2M uart_receiver_controller_en_reg ( .D(n48), .CK(clk), .SN(reset_n), 
        .Q(uart_receiver_controller_en) );
  DFFRQX4M \current_state_reg[1]  ( .D(n28), .CK(clk), .RN(n54), .Q(
        current_state[1]) );
  DFFRQX4M \current_state_reg[2]  ( .D(n27), .CK(clk), .RN(n54), .Q(
        current_state[2]) );
  DFFRQX2M \transmission_current_state_reg[1]  ( .D(n30), .CK(clk), .RN(n54), 
        .Q(transmission_current_state[1]) );
  DFFRQX4M \current_state_reg[0]  ( .D(n29), .CK(clk), .RN(n54), .Q(
        current_state[0]) );
  AOI221X2M U3 ( .A0(current_state[1]), .A1(n51), .B0(n19), .B1(n18), .C0(
        current_state[0]), .Y(n20) );
  AOI221X2M U4 ( .A0(transmitter_q_pulse_generator), .A1(current_state[1]), 
        .B0(n51), .B1(n19), .C0(n17), .Y(n23) );
  AOI222X2M U5 ( .A0(n11), .A1(read_data[4]), .B0(message[4]), .B1(n10), .C0(
        n2), .C1(alu_result[4]), .Y(n9) );
  AOI222X2M U6 ( .A0(n11), .A1(read_data[0]), .B0(message[0]), .B1(n10), .C0(
        n2), .C1(alu_result[0]), .Y(n12) );
  AOI222X2M U7 ( .A0(n11), .A1(read_data[1]), .B0(message[1]), .B1(n10), .C0(
        n2), .C1(alu_result[1]), .Y(n3) );
  AOI222X2M U8 ( .A0(n11), .A1(read_data[6]), .B0(message[6]), .B1(n10), .C0(
        n2), .C1(alu_result[6]), .Y(n4) );
  AOI222X2M U9 ( .A0(n11), .A1(read_data[2]), .B0(message[2]), .B1(n10), .C0(
        n2), .C1(alu_result[2]), .Y(n5) );
  AOI222X2M U10 ( .A0(n11), .A1(read_data[3]), .B0(message[3]), .B1(n10), .C0(
        n2), .C1(alu_result[3]), .Y(n6) );
  AOI222X2M U11 ( .A0(n11), .A1(read_data[5]), .B0(message[5]), .B1(n10), .C0(
        n2), .C1(alu_result[5]), .Y(n7) );
  AOI222X2M U12 ( .A0(n11), .A1(read_data[7]), .B0(message[7]), .B1(n10), .C0(
        n2), .C1(alu_result[7]), .Y(n8) );
  NAND2X1M U13 ( .A(alu_result_valid), .B(n18), .Y(n16) );
  CLKINVX1M U14 ( .A(n11), .Y(n18) );
  INVX8M U15 ( .A(n16), .Y(n2) );
  BUFX6M U16 ( .A(reset_n), .Y(n54) );
  BUFX5M U17 ( .A(read_data_valid), .Y(n11) );
  OAI31X2M U18 ( .A0(current_state[2]), .A1(transmitter_q_pulse_generator), 
        .A2(n22), .B0(current_state[1]), .Y(n15) );
  OAI31X2M U19 ( .A0(transmitter_q_pulse_generator), .A1(n22), .A2(n19), .B0(
        n14), .Y(n27) );
  OAI31X2M U20 ( .A0(current_state[0]), .A1(n17), .A2(n16), .B0(n15), .Y(n28)
         );
  NOR2X3M U21 ( .A(current_state[1]), .B(current_state[0]), .Y(n49) );
  CLKINVX2M U22 ( .A(current_state[0]), .Y(n22) );
  AOI211X2M U23 ( .A0(current_state[1]), .A1(current_state[0]), .B0(
        current_state[2]), .C0(n49), .Y(n50) );
  BUFX5M U24 ( .A(n24), .Y(n52) );
  BUFX8M U25 ( .A(n1), .Y(n10) );
  CLKINVX1M U26 ( .A(transmission_current_state[0]), .Y(n13) );
  AOI2B1X1M U27 ( .A1N(transmission_current_state[1]), .A0(
        transmitter_busy_sync), .B0(n13), .Y(n30) );
  NOR2X1M U28 ( .A(n11), .B(alu_result_valid), .Y(n1) );
  AO22XLM U29 ( .A0(message[15]), .A1(n10), .B0(n2), .B1(alu_result[15]), .Y(
        n47) );
  AO22XLM U30 ( .A0(message[12]), .A1(n10), .B0(n2), .B1(alu_result[12]), .Y(
        n44) );
  AO22XLM U31 ( .A0(message[13]), .A1(n10), .B0(n2), .B1(alu_result[13]), .Y(
        n45) );
  AO22XLM U32 ( .A0(message[8]), .A1(n10), .B0(n2), .B1(alu_result[8]), .Y(n40) );
  AO22XLM U33 ( .A0(message[14]), .A1(n10), .B0(n2), .B1(alu_result[14]), .Y(
        n46) );
  AO22XLM U34 ( .A0(message[11]), .A1(n10), .B0(n2), .B1(alu_result[11]), .Y(
        n43) );
  AO22XLM U35 ( .A0(message[10]), .A1(n10), .B0(n2), .B1(alu_result[10]), .Y(
        n42) );
  AO22XLM U36 ( .A0(message[9]), .A1(n10), .B0(n2), .B1(alu_result[9]), .Y(n41) );
  CLKINVX1M U37 ( .A(n3), .Y(n33) );
  CLKINVX1M U38 ( .A(n4), .Y(n38) );
  CLKINVX1M U39 ( .A(n5), .Y(n34) );
  CLKINVX1M U40 ( .A(n6), .Y(n35) );
  CLKINVX1M U41 ( .A(n7), .Y(n37) );
  CLKINVX1M U42 ( .A(n8), .Y(n39) );
  CLKINVX1M U43 ( .A(n9), .Y(n36) );
  CLKINVX1M U44 ( .A(n12), .Y(n32) );
  CLKINVX2M U45 ( .A(current_state[1]), .Y(n19) );
  CLKINVX2M U46 ( .A(n49), .Y(n25) );
  NAND2X2M U47 ( .A(n13), .B(transmission_current_state[1]), .Y(n51) );
  OAI21X1M U48 ( .A0(n25), .A1(n51), .B0(current_state[2]), .Y(n14) );
  AOI21X2M U49 ( .A0(n49), .A1(transmitter_busy_sync), .B0(current_state[2]), 
        .Y(n21) );
  CLKINVX1M U50 ( .A(n21), .Y(n17) );
  OAI2BB2X1M U51 ( .B0(n23), .B1(n22), .A0N(n21), .A1N(n20), .Y(n29) );
  CLKINVX1M U52 ( .A(current_state[2]), .Y(n26) );
  NOR2X1M U53 ( .A(n26), .B(n25), .Y(n24) );
  AOI21X1M U54 ( .A0(n26), .A1(n25), .B0(n52), .Y(n48) );
  CLKBUFX4M U55 ( .A(n50), .Y(n53) );
  OR2X1M U56 ( .A(n52), .B(n53), .Y(transmitter_parallel_data_valid) );
  OA21XLM U57 ( .A0(transmitter_busy_sync), .A1(transmission_current_state[1]), 
        .B0(n51), .Y(n31) );
  AO22XLM U58 ( .A0(message[0]), .A1(n53), .B0(message[8]), .B1(n52), .Y(
        transmitter_parallel_data[0]) );
  AO22XLM U59 ( .A0(n53), .A1(message[1]), .B0(n52), .B1(message[9]), .Y(
        transmitter_parallel_data[1]) );
  AO22XLM U60 ( .A0(n53), .A1(message[2]), .B0(n52), .B1(message[10]), .Y(
        transmitter_parallel_data[2]) );
  AO22XLM U61 ( .A0(n53), .A1(message[3]), .B0(n52), .B1(message[11]), .Y(
        transmitter_parallel_data[3]) );
  AO22XLM U62 ( .A0(n53), .A1(message[4]), .B0(n52), .B1(message[12]), .Y(
        transmitter_parallel_data[4]) );
  AO22XLM U63 ( .A0(n53), .A1(message[5]), .B0(n52), .B1(message[13]), .Y(
        transmitter_parallel_data[5]) );
  AO22XLM U64 ( .A0(n53), .A1(message[6]), .B0(n52), .B1(message[14]), .Y(
        transmitter_parallel_data[6]) );
  AO22XLM U65 ( .A0(n53), .A1(message[7]), .B0(n52), .B1(message[15]), .Y(
        transmitter_parallel_data[7]) );
endmodule


module uart_receiver_controller ( clk, enable, reset_n, 
        parallel_data_valid_sync, parallel_data_sync, alu_function, alu_en, 
        alu_clk_en, address, read_en, write_data, write_en_BAR );
  input [7:0] parallel_data_sync;
  output [3:0] alu_function;
  output [3:0] address;
  output [7:0] write_data;
  input clk, enable, reset_n, parallel_data_valid_sync;
  output alu_en, alu_clk_en, read_en, write_en_BAR;
  wire   n51, N98, n42, n43, n44, n45, n46, n47, n48, n1, n2, n3, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n49;
  wire   [2:0] current_state;
  wire   [3:0] Q_write_address_register;
  wire   [1:0] counter;

  DFFRQX1M \Q_write_address_register_reg[1]  ( .D(n42), .CK(clk), .RN(reset_n), 
        .Q(Q_write_address_register[1]) );
  DFFRQX1M \Q_write_address_register_reg[3]  ( .D(n44), .CK(clk), .RN(reset_n), 
        .Q(Q_write_address_register[3]) );
  DFFRQX4M \current_state_reg[2]  ( .D(n47), .CK(clk), .RN(reset_n), .Q(
        current_state[2]) );
  DFFRQX1M \Q_write_address_register_reg[0]  ( .D(n45), .CK(clk), .RN(reset_n), 
        .Q(Q_write_address_register[0]) );
  DFFRQX1M \counter_reg[0]  ( .D(parallel_data_valid_sync), .CK(clk), .RN(
        reset_n), .Q(counter[0]) );
  DFFRQX1M \Q_write_address_register_reg[2]  ( .D(n43), .CK(clk), .RN(reset_n), 
        .Q(Q_write_address_register[2]) );
  DFFRQX1M \counter_reg[1]  ( .D(N98), .CK(clk), .RN(reset_n), .Q(counter[1])
         );
  DFFRQX4M \current_state_reg[1]  ( .D(n46), .CK(clk), .RN(reset_n), .Q(
        current_state[1]) );
  DFFRQX4M \current_state_reg[0]  ( .D(n48), .CK(clk), .RN(reset_n), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(n3), .Y(address[0]) );
  INVX2M U4 ( .A(read_en), .Y(n11) );
  INVX2M U5 ( .A(current_state[0]), .Y(n49) );
  NOR2X2M U6 ( .A(current_state[2]), .B(n41), .Y(n7) );
  NOR4X4M U7 ( .A(parallel_data_sync[6]), .B(n15), .C(parallel_data_sync[2]), 
        .D(n14), .Y(n34) );
  CLKINVX1M U8 ( .A(n30), .Y(n1) );
  CLKINVX1M U9 ( .A(n1), .Y(n2) );
  NOR4X1M U10 ( .A(parallel_data_sync[1]), .B(n17), .C(parallel_data_sync[5]), 
        .D(n16), .Y(n30) );
  AOI221X2M U11 ( .A0(n34), .A1(n24), .B0(n2), .B1(n24), .C0(n18), .Y(n22) );
  AOI22X1M U12 ( .A0(current_state[0]), .A1(n35), .B0(n34), .B1(n33), .Y(n37)
         );
  AOI22X1M U13 ( .A0(n2), .A1(n33), .B0(current_state[2]), .B1(n35), .Y(n32)
         );
  AOI22X1M U14 ( .A0(parallel_data_sync[0]), .A1(read_en), .B0(
        Q_write_address_register[0]), .B1(n38), .Y(n39) );
  NAND2X2M U15 ( .A(current_state[1]), .B(n7), .Y(n9) );
  INVX2M U16 ( .A(counter[0]), .Y(n5) );
  INVX2M U17 ( .A(n51), .Y(n3) );
  NOR2X1M U18 ( .A(write_en_BAR), .B(n26), .Y(write_data[0]) );
  NOR2X1M U19 ( .A(write_en_BAR), .B(n16), .Y(write_data[6]) );
  NOR2X1M U20 ( .A(write_en_BAR), .B(n14), .Y(write_data[5]) );
  NOR2X1M U21 ( .A(write_en_BAR), .B(n25), .Y(write_data[4]) );
  NOR2X1M U22 ( .A(write_en_BAR), .B(n13), .Y(write_data[3]) );
  NOR2X1M U23 ( .A(write_en_BAR), .B(n17), .Y(write_data[2]) );
  OAI2BB2X4M U24 ( .B0(n15), .B1(n11), .A0N(n38), .A1N(
        Q_write_address_register[1]), .Y(address[1]) );
  CLKINVX1M U25 ( .A(parallel_data_sync[6]), .Y(n16) );
  CLKINVX1M U26 ( .A(parallel_data_sync[5]), .Y(n14) );
  AOI2BB2X1M U27 ( .B0(n8), .B1(n26), .A0N(Q_write_address_register[0]), .A1N(
        n8), .Y(n45) );
  AOI21X1M U28 ( .A0(current_state[2]), .A1(n49), .B0(n35), .Y(n21) );
  OAI2BB2X8M U29 ( .B0(n13), .B1(n11), .A0N(n38), .A1N(
        Q_write_address_register[3]), .Y(address[3]) );
  NOR2X6M U30 ( .A(current_state[0]), .B(n9), .Y(n38) );
  OAI31X2M U31 ( .A0(n49), .A1(n41), .A2(n40), .B0(n39), .Y(n51) );
  NOR3X6M U32 ( .A(current_state[1]), .B(current_state[0]), .C(
        current_state[2]), .Y(n19) );
  NAND3X2M U33 ( .A(parallel_data_sync[3]), .B(n19), .C(parallel_data_sync[7]), 
        .Y(n23) );
  INVX4M U34 ( .A(parallel_data_sync[0]), .Y(n26) );
  OAI31X2M U35 ( .A0(n20), .A1(n31), .A2(n41), .B0(n6), .Y(alu_clk_en) );
  INVX2M U36 ( .A(current_state[1]), .Y(n20) );
  AOI2BB2X1M U37 ( .B0(n8), .B1(n13), .A0N(Q_write_address_register[3]), .A1N(
        n8), .Y(n44) );
  NOR3X6M U38 ( .A(n26), .B(n23), .C(n25), .Y(n24) );
  OAI2BB2X8M U39 ( .B0(n17), .B1(n11), .A0N(n38), .A1N(
        Q_write_address_register[2]), .Y(address[2]) );
  AOI2BB2X1M U40 ( .B0(n8), .B1(n17), .A0N(Q_write_address_register[2]), .A1N(
        n8), .Y(n43) );
  INVX4M U41 ( .A(parallel_data_sync[2]), .Y(n17) );
  AOI2BB2X1M U42 ( .B0(n8), .B1(n15), .A0N(Q_write_address_register[1]), .A1N(
        n8), .Y(n42) );
  INVX4M U43 ( .A(parallel_data_sync[1]), .Y(n15) );
  NOR2X6M U44 ( .A(n49), .B(n9), .Y(read_en) );
  OAI2B1X2M U45 ( .A1N(n19), .A0(enable), .B0(parallel_data_valid_sync), .Y(
        n28) );
  NAND3BX4M U46 ( .AN(counter[1]), .B(n5), .C(parallel_data_valid_sync), .Y(
        n41) );
  NAND3X4M U47 ( .A(current_state[1]), .B(current_state[0]), .C(
        current_state[2]), .Y(n12) );
  NOR2X6M U48 ( .A(n13), .B(n12), .Y(alu_function[3]) );
  NOR2X6M U49 ( .A(n15), .B(n12), .Y(alu_function[1]) );
  NOR2X1M U50 ( .A(parallel_data_valid_sync), .B(n12), .Y(N98) );
  INVX4M U51 ( .A(n12), .Y(alu_en) );
  CLKINVX1M U52 ( .A(current_state[2]), .Y(n31) );
  AOI31X1M U53 ( .A0(n19), .A1(counter[1]), .A2(n5), .B0(alu_en), .Y(n6) );
  INVX2M U54 ( .A(parallel_data_sync[3]), .Y(n13) );
  NOR2X2M U55 ( .A(current_state[1]), .B(n49), .Y(n18) );
  CLKAND2X4M U56 ( .A(n18), .B(n7), .Y(n8) );
  NAND2X2M U57 ( .A(current_state[2]), .B(n20), .Y(n40) );
  AOI2BB1X2M U58 ( .A0N(n40), .A1N(n41), .B0(n38), .Y(n10) );
  BUFX5M U59 ( .A(n10), .Y(write_en_BAR) );
  NOR2X2M U60 ( .A(n26), .B(n12), .Y(alu_function[0]) );
  NOR2X2M U61 ( .A(n17), .B(n12), .Y(alu_function[2]) );
  CLKINVX2M U62 ( .A(parallel_data_sync[4]), .Y(n25) );
  NOR2X1M U63 ( .A(write_en_BAR), .B(n15), .Y(write_data[1]) );
  NOR2X4M U64 ( .A(parallel_data_valid_sync), .B(alu_en), .Y(n35) );
  OAI22X1M U65 ( .A0(n22), .A1(n28), .B0(n21), .B1(n20), .Y(n46) );
  CLKINVX1M U66 ( .A(n23), .Y(n27) );
  AOI31X1M U67 ( .A0(n27), .A1(n26), .A2(n25), .B0(n24), .Y(n29) );
  NOR2X2M U68 ( .A(n29), .B(n28), .Y(n33) );
  OR3X1M U69 ( .A(n35), .B(n31), .C(current_state[0]), .Y(n36) );
  NAND3XLM U70 ( .A(n32), .B(n36), .C(n40), .Y(n47) );
  NAND2XLM U71 ( .A(n37), .B(n36), .Y(n48) );
  NOR2BX1M U72 ( .AN(parallel_data_sync[7]), .B(write_en_BAR), .Y(
        write_data[7]) );
endmodule


module system_controller ( clk, reset_n, alu_result_valid, alu_result, 
        register_file_read_data_valid, register_file_read_data, 
        transmitter_busy_sync, transmitter_q_pulse_generator, 
        receiver_parallel_data_valid_sync, receiver_parallel_data_sync, 
        alu_function, alu_en, alu_clk_en, transmitter_parallel_data_valid, 
        transmitter_parallel_data, register_file_address, 
        register_file_write_data, register_file_read_en, 
        register_file_write_en_BAR );
  input [15:0] alu_result;
  input [7:0] register_file_read_data;
  input [7:0] receiver_parallel_data_sync;
  output [3:0] alu_function;
  output [7:0] transmitter_parallel_data;
  output [3:0] register_file_address;
  output [7:0] register_file_write_data;
  input clk, reset_n, alu_result_valid, register_file_read_data_valid,
         transmitter_busy_sync, transmitter_q_pulse_generator,
         receiver_parallel_data_valid_sync;
  output alu_en, alu_clk_en, transmitter_parallel_data_valid,
         register_file_read_en, register_file_write_en_BAR;
  wire   register_file_write_en, receiver_controller_en, n1;
  assign register_file_write_en_BAR = register_file_write_en;

  uart_transmitter_controller uart_transmitter_controller_inst ( .clk(clk), 
        .reset_n(n1), .alu_result_valid(alu_result_valid), .alu_result(
        alu_result), .read_data_valid(register_file_read_data_valid), 
        .read_data(register_file_read_data), .transmitter_busy_sync(
        transmitter_busy_sync), .transmitter_q_pulse_generator(
        transmitter_q_pulse_generator), .transmitter_parallel_data_valid(
        transmitter_parallel_data_valid), .transmitter_parallel_data(
        transmitter_parallel_data), .uart_receiver_controller_en(
        receiver_controller_en) );
  uart_receiver_controller uart_receiver_controller_inst ( .clk(clk), .enable(
        receiver_controller_en), .reset_n(n1), .parallel_data_valid_sync(
        receiver_parallel_data_valid_sync), .parallel_data_sync(
        receiver_parallel_data_sync), .alu_function(alu_function), .alu_en(
        alu_en), .alu_clk_en(alu_clk_en), .address(register_file_address), 
        .read_en(register_file_read_en), .write_data(register_file_write_data), 
        .write_en_BAR(register_file_write_en) );
  BUFX10M U1 ( .A(reset_n), .Y(n1) );
endmodule


module clock_gating_cell ( clk, clk_en, gated_clk );
  input clk, clk_en;
  output gated_clk;


  TLATNCAX4M U_ICG_cell ( .E(clk_en), .CK(clk), .ECK(gated_clk) );
endmodule


module alu ( clk, reset_n, A, B, alu_function, enable, alu_result_valid, 
        alu_result );
  input [7:0] A;
  input [7:0] B;
  input [3:0] alu_function;
  output [15:0] alu_result;
  input clk, reset_n, enable;
  output alu_result_valid;
  wire   N178, N179, N180, N181, N182, N183, N184, N185, N186, N187, N188,
         N189, N190, N191, N192, N193, N194, \C9/DATA15_0 , \C9/DATA15_1 ,
         \C9/DATA15_2 , \C9/DATA15_3 , \C9/DATA15_4 , \C9/DATA15_5 ,
         \C9/DATA15_6 , \C9/DATA15_7 , \DP_OP_29J1_122_2578/n29 ,
         \DP_OP_29J1_122_2578/n28 , \DP_OP_29J1_122_2578/n27 ,
         \DP_OP_29J1_122_2578/n26 , \DP_OP_29J1_122_2578/n25 ,
         \DP_OP_29J1_122_2578/n24 , \DP_OP_29J1_122_2578/n23 ,
         \DP_OP_29J1_122_2578/n22 , \DP_OP_29J1_122_2578/n16 ,
         \DP_OP_29J1_122_2578/n15 , \DP_OP_29J1_122_2578/n14 ,
         \DP_OP_29J1_122_2578/n13 , \DP_OP_29J1_122_2578/n12 ,
         \DP_OP_29J1_122_2578/n11 , \DP_OP_29J1_122_2578/n10 ,
         \DP_OP_29J1_122_2578/n9 , \intadd_0/A[4] , \intadd_0/A[3] ,
         \intadd_0/A[2] , \intadd_0/A[1] , \intadd_0/A[0] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/SUM[4] , \intadd_0/SUM[3] ,
         \intadd_0/SUM[2] , \intadd_0/SUM[1] , \intadd_0/SUM[0] ,
         \intadd_0/n5 , \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 ,
         \intadd_0/n1 , \intadd_1/A[3] , \intadd_1/A[2] , \intadd_1/A[1] ,
         \intadd_1/B[4] , \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] ,
         \intadd_1/B[0] , \intadd_1/CI , \intadd_1/SUM[4] , \intadd_1/SUM[3] ,
         \intadd_1/SUM[2] , \intadd_1/SUM[1] , \intadd_1/SUM[0] ,
         \intadd_1/n5 , \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 ,
         \intadd_1/n1 , \intadd_2/A[3] , \intadd_2/A[2] , \intadd_2/A[1] ,
         \intadd_2/A[0] , \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] ,
         \intadd_2/B[0] , \intadd_2/CI , \intadd_2/SUM[3] , \intadd_2/SUM[2] ,
         \intadd_2/SUM[1] , \intadd_2/SUM[0] , \intadd_2/n4 , \intadd_2/n3 ,
         \intadd_2/n2 , \intadd_2/n1 , \intadd_3/A[3] , \intadd_3/A[2] ,
         \intadd_3/A[1] , \intadd_3/A[0] , \intadd_3/B[2] , \intadd_3/B[1] ,
         \intadd_3/B[0] , \intadd_3/CI , \intadd_3/SUM[2] , \intadd_3/SUM[0] ,
         \intadd_3/n4 , \intadd_3/n3 , \intadd_3/n2 , \intadd_3/n1 ,
         \intadd_4/A[0] , \intadd_4/B[1] , \intadd_4/B[0] , \intadd_4/CI ,
         \intadd_4/SUM[0] , \intadd_4/n3 , \intadd_4/n2 , \intadd_4/n1 ,
         \intadd_5/A[2] , \intadd_5/A[0] , \intadd_5/B[1] , \intadd_5/B[0] ,
         \intadd_5/CI , \intadd_5/n3 , \intadd_5/n2 , \intadd_5/n1 ,
         \intadd_6/A[2] , \intadd_6/A[0] , \intadd_6/B[2] , \intadd_6/B[1] ,
         \intadd_6/B[0] , \intadd_6/CI , \intadd_6/SUM[2] , \intadd_6/SUM[1] ,
         \intadd_6/SUM[0] , \intadd_6/n3 , \intadd_6/n2 , \intadd_6/n1 ,
         \intadd_7/A[1] , \intadd_7/A[0] , \intadd_7/B[2] , \intadd_7/B[1] ,
         \intadd_7/B[0] , \intadd_7/CI , \intadd_7/SUM[2] , \intadd_7/SUM[1] ,
         \intadd_7/SUM[0] , \intadd_7/n3 , \intadd_7/n2 , \intadd_7/n1 , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415;

  DFFRQX1M \alu_result_reg[15]  ( .D(N194), .CK(clk), .RN(n279), .Q(
        alu_result[15]) );
  DFFRQX1M \alu_result_reg[14]  ( .D(N193), .CK(clk), .RN(n279), .Q(
        alu_result[14]) );
  DFFRQX1M \alu_result_reg[13]  ( .D(N192), .CK(clk), .RN(n279), .Q(
        alu_result[13]) );
  DFFRQX1M \alu_result_reg[12]  ( .D(N191), .CK(clk), .RN(n279), .Q(
        alu_result[12]) );
  DFFRQX1M \alu_result_reg[11]  ( .D(N190), .CK(clk), .RN(n279), .Q(
        alu_result[11]) );
  DFFRQX1M \alu_result_reg[10]  ( .D(N189), .CK(clk), .RN(n279), .Q(
        alu_result[10]) );
  DFFRQX1M \alu_result_reg[9]  ( .D(N188), .CK(clk), .RN(n279), .Q(
        alu_result[9]) );
  DFFRQX1M \alu_result_reg[8]  ( .D(N187), .CK(clk), .RN(n279), .Q(
        alu_result[8]) );
  DFFRQX1M \alu_result_reg[7]  ( .D(N186), .CK(clk), .RN(n279), .Q(
        alu_result[7]) );
  DFFRQX1M \alu_result_reg[6]  ( .D(N185), .CK(clk), .RN(n279), .Q(
        alu_result[6]) );
  DFFRQX1M \alu_result_reg[5]  ( .D(N184), .CK(clk), .RN(n279), .Q(
        alu_result[5]) );
  DFFRQX1M \alu_result_reg[4]  ( .D(N183), .CK(clk), .RN(n279), .Q(
        alu_result[4]) );
  DFFRQX1M \alu_result_reg[3]  ( .D(N182), .CK(clk), .RN(n279), .Q(
        alu_result[3]) );
  DFFRQX1M \alu_result_reg[2]  ( .D(N181), .CK(clk), .RN(n279), .Q(
        alu_result[2]) );
  DFFRQX1M \alu_result_reg[1]  ( .D(N180), .CK(clk), .RN(n279), .Q(
        alu_result[1]) );
  DFFRQX1M \alu_result_reg[0]  ( .D(N179), .CK(clk), .RN(reset_n), .Q(
        alu_result[0]) );
  DFFRQX1M alu_result_valid_reg ( .D(N178), .CK(clk), .RN(reset_n), .Q(
        alu_result_valid) );
  ADDFX1M \intadd_0/U6  ( .A(n11), .B(\intadd_0/B[0] ), .CI(\intadd_0/CI ), 
        .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[0] ) );
  ADDFX1M \intadd_0/U5  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[1] ) );
  ADDFX1M \intadd_3/U5  ( .A(\intadd_3/A[0] ), .B(\intadd_3/B[0] ), .CI(
        \intadd_3/CI ), .CO(\intadd_3/n4 ), .S(\intadd_3/SUM[0] ) );
  ADDFX1M \intadd_3/U4  ( .A(\intadd_3/A[1] ), .B(\intadd_3/B[1] ), .CI(
        \intadd_3/n4 ), .CO(\intadd_3/n3 ), .S(\intadd_1/B[2] ) );
  ADDFX1M \intadd_3/U3  ( .A(\intadd_3/A[2] ), .B(\intadd_3/B[2] ), .CI(
        \intadd_3/n3 ), .CO(\intadd_3/n2 ), .S(\intadd_3/SUM[2] ) );
  ADDFX1M \intadd_4/U4  ( .A(n10), .B(\intadd_4/B[0] ), .CI(\intadd_4/CI ), 
        .CO(\intadd_4/n3 ), .S(\intadd_4/SUM[0] ) );
  ADDFX1M \intadd_4/U3  ( .A(\intadd_0/SUM[0] ), .B(\intadd_4/B[1] ), .CI(
        \intadd_4/n3 ), .CO(\intadd_4/n2 ), .S(\intadd_1/A[2] ) );
  ADDFX1M \intadd_5/U4  ( .A(\intadd_5/A[0] ), .B(\intadd_5/B[0] ), .CI(
        \intadd_5/CI ), .CO(\intadd_5/n3 ), .S(\intadd_0/A[2] ) );
  ADDFX1M \intadd_6/U4  ( .A(\intadd_6/A[0] ), .B(\intadd_6/B[0] ), .CI(
        \intadd_6/CI ), .CO(\intadd_6/n3 ), .S(\intadd_6/SUM[0] ) );
  ADDFX1M \intadd_7/U4  ( .A(n13), .B(\intadd_7/B[0] ), .CI(\intadd_7/CI ), 
        .CO(\intadd_7/n3 ), .S(\intadd_7/SUM[0] ) );
  ADDFX1M \intadd_7/U3  ( .A(\intadd_7/A[1] ), .B(\intadd_7/B[1] ), .CI(
        \intadd_7/n3 ), .CO(\intadd_7/n2 ), .S(\intadd_7/SUM[1] ) );
  ADDFX1M \intadd_1/U5  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[1] ) );
  ADDFX1M \intadd_2/U5  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[0] ) );
  ADDFX1M \intadd_5/U3  ( .A(\intadd_2/SUM[0] ), .B(\intadd_5/B[1] ), .CI(
        \intadd_5/n3 ), .CO(\intadd_5/n2 ), .S(\intadd_0/B[3] ) );
  ADDFX1M \intadd_2/U4  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[1] ) );
  ADDFX1M \DP_OP_29J1_122_2578/U20  ( .A(\DP_OP_29J1_122_2578/n28 ), .B(A[1]), 
        .CI(\DP_OP_29J1_122_2578/n16 ), .CO(\DP_OP_29J1_122_2578/n15 ), .S(
        \C9/DATA15_1 ) );
  ADDFX1M \DP_OP_29J1_122_2578/U19  ( .A(\DP_OP_29J1_122_2578/n27 ), .B(A[2]), 
        .CI(\DP_OP_29J1_122_2578/n15 ), .CO(\DP_OP_29J1_122_2578/n14 ), .S(
        \C9/DATA15_2 ) );
  ADDFX1M \DP_OP_29J1_122_2578/U18  ( .A(\DP_OP_29J1_122_2578/n26 ), .B(A[3]), 
        .CI(\DP_OP_29J1_122_2578/n14 ), .CO(\DP_OP_29J1_122_2578/n13 ), .S(
        \C9/DATA15_3 ) );
  ADDFX1M \DP_OP_29J1_122_2578/U17  ( .A(\DP_OP_29J1_122_2578/n25 ), .B(A[4]), 
        .CI(\DP_OP_29J1_122_2578/n13 ), .CO(\DP_OP_29J1_122_2578/n12 ), .S(
        \C9/DATA15_4 ) );
  ADDFX2M \intadd_3/U2  ( .A(\intadd_3/A[3] ), .B(\intadd_0/SUM[2] ), .CI(
        \intadd_3/n2 ), .CO(\intadd_3/n1 ), .S(\intadd_1/B[4] ) );
  ADDFX2M \intadd_5/U2  ( .A(\intadd_5/A[2] ), .B(\intadd_2/SUM[1] ), .CI(
        \intadd_5/n2 ), .CO(\intadd_5/n1 ), .S(\intadd_0/B[4] ) );
  ADDFX2M \intadd_1/U2  ( .A(\intadd_4/n1 ), .B(\intadd_1/B[4] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[4] ) );
  ADDFX2M \intadd_0/U2  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[4] ) );
  ADDFX2M \intadd_2/U2  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(\intadd_2/SUM[3] ) );
  ADDFX2M \intadd_1/U4  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[2] ) );
  ADDFX2M \intadd_0/U3  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[3] ) );
  ADDFX2M \intadd_2/U3  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[2] ) );
  ADDFX2M \DP_OP_29J1_122_2578/U14  ( .A(\DP_OP_29J1_122_2578/n22 ), .B(n415), 
        .CI(\DP_OP_29J1_122_2578/n10 ), .CO(\DP_OP_29J1_122_2578/n9 ), .S(
        \C9/DATA15_7 ) );
  ADDFX2M \intadd_1/U3  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[3] ) );
  ADDFX1M \intadd_1/U6  ( .A(n1), .B(\intadd_1/B[0] ), .CI(\intadd_1/CI ), 
        .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[0] ) );
  ADDFX1M \DP_OP_29J1_122_2578/U21  ( .A(A[0]), .B(n412), .CI(
        \DP_OP_29J1_122_2578/n29 ), .CO(\DP_OP_29J1_122_2578/n16 ), .S(
        \C9/DATA15_0 ) );
  ADDFX1M \intadd_6/U3  ( .A(\intadd_1/SUM[0] ), .B(\intadd_6/B[1] ), .CI(
        \intadd_6/n3 ), .CO(\intadd_6/n2 ), .S(\intadd_6/SUM[1] ) );
  ADDFX1M \intadd_0/U4  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[2] ) );
  ADDFX1M \intadd_4/U2  ( .A(\intadd_0/SUM[1] ), .B(\intadd_3/SUM[2] ), .CI(
        \intadd_4/n2 ), .CO(\intadd_4/n1 ), .S(\intadd_1/B[3] ) );
  ADDFX1M \intadd_7/U2  ( .A(\intadd_6/SUM[0] ), .B(\intadd_7/B[2] ), .CI(
        \intadd_7/n2 ), .CO(\intadd_7/n1 ), .S(\intadd_7/SUM[2] ) );
  ADDFX1M \intadd_6/U2  ( .A(\intadd_6/A[2] ), .B(\intadd_6/B[2] ), .CI(
        \intadd_6/n2 ), .CO(\intadd_6/n1 ), .S(\intadd_6/SUM[2] ) );
  ADDFX1M \DP_OP_29J1_122_2578/U16  ( .A(\DP_OP_29J1_122_2578/n24 ), .B(n413), 
        .CI(\DP_OP_29J1_122_2578/n12 ), .CO(\DP_OP_29J1_122_2578/n11 ), .S(
        \C9/DATA15_5 ) );
  ADDFX1M \DP_OP_29J1_122_2578/U15  ( .A(\DP_OP_29J1_122_2578/n23 ), .B(n414), 
        .CI(\DP_OP_29J1_122_2578/n11 ), .CO(\DP_OP_29J1_122_2578/n10 ), .S(
        \C9/DATA15_6 ) );
  OAI2BB2X1M U3 ( .B0(n367), .B1(n211), .A0N(n366), .A1N(\C9/DATA15_1 ), .Y(
        N180) );
  NOR2X2M U4 ( .A(n138), .B(n157), .Y(n150) );
  NOR2X2M U5 ( .A(n152), .B(n151), .Y(n138) );
  BUFX4M U6 ( .A(n29), .Y(n286) );
  NOR2X1M U7 ( .A(n159), .B(n158), .Y(n149) );
  NOR2X2M U8 ( .A(n154), .B(n153), .Y(n157) );
  CLKMX2X2M U9 ( .A(n148), .B(n147), .S0(n365), .Y(n159) );
  CLKMX2X2M U10 ( .A(n109), .B(n108), .S0(n365), .Y(n116) );
  AND2X6M U11 ( .A(n101), .B(n161), .Y(n365) );
  MX2X2M U12 ( .A(n86), .B(n85), .S0(n269), .Y(n133) );
  MX2X2M U13 ( .A(n92), .B(n91), .S0(n269), .Y(n148) );
  ADDFX1M U14 ( .A(n96), .B(n153), .CI(n75), .CO(n76) );
  MX2X2M U15 ( .A(n52), .B(n51), .S0(n230), .Y(n68) );
  CLKMX2X4M U16 ( .A(n54), .B(n53), .S0(n230), .Y(n71) );
  MX2X2M U17 ( .A(n41), .B(n40), .S0(n239), .Y(n52) );
  CLKMX2X4M U18 ( .A(n413), .B(n43), .S0(n239), .Y(n54) );
  INVX12M U19 ( .A(n378), .Y(n392) );
  BUFX5M U20 ( .A(A[6]), .Y(n414) );
  BUFX4M U21 ( .A(A[7]), .Y(n415) );
  INVX10M U22 ( .A(B[4]), .Y(n151) );
  INVX8M U23 ( .A(B[5]), .Y(n153) );
  AOI221X2M U24 ( .A0(n368), .A1(n381), .B0(n380), .B1(A[0]), .C0(n224), .Y(
        n193) );
  AOI221X2M U25 ( .A0(n197), .A1(n188), .B0(n182), .B1(n188), .C0(n218), .Y(
        n205) );
  AOI22X1M U26 ( .A0(A[4]), .A1(n348), .B0(n16), .B1(n239), .Y(n251) );
  AOI22X1M U27 ( .A0(n415), .A1(n270), .B0(n16), .B1(n253), .Y(n259) );
  AOI22X1M U28 ( .A0(\intadd_7/SUM[1] ), .A1(n15), .B0(\intadd_4/CI ), .B1(n22), .Y(n227) );
  AOI22X1M U29 ( .A0(n293), .A1(n330), .B0(n240), .B1(n2), .Y(n249) );
  AOI22X1M U30 ( .A0(n413), .A1(n348), .B0(n15), .B1(\intadd_6/SUM[2] ), .Y(
        n258) );
  AOI22X1M U31 ( .A0(A[1]), .A1(n348), .B0(n15), .B1(\intadd_7/SUM[0] ), .Y(
        n276) );
  AOI22X1M U32 ( .A0(n230), .A1(n16), .B0(n395), .B1(n22), .Y(n235) );
  AOI22X1M U33 ( .A0(A[3]), .A1(n348), .B0(n15), .B1(\intadd_7/SUM[2] ), .Y(
        n234) );
  AOI22X1M U34 ( .A0(n287), .A1(n161), .B0(n347), .B1(n288), .Y(n297) );
  AOI32X1M U35 ( .A0(n179), .A1(n194), .A2(n183), .B0(n184), .B1(n194), .Y(
        n180) );
  AOI22X2M U36 ( .A0(A[1]), .A1(n392), .B0(n378), .B1(n393), .Y(n361) );
  AOI22X2M U37 ( .A0(\intadd_6/SUM[1] ), .A1(n339), .B0(\intadd_7/n1 ), .B1(
        n340), .Y(n242) );
  AOI32X1M U38 ( .A0(n286), .A1(A[4]), .A2(n151), .B0(n271), .B1(A[4]), .Y(
        n232) );
  AOI221X2M U39 ( .A0(n293), .A1(n255), .B0(n22), .B1(n410), .C0(n254), .Y(
        n256) );
  AOI221X2M U40 ( .A0(n285), .A1(n158), .B0(n360), .B1(B[6]), .C0(n414), .Y(
        n254) );
  AOI221X2M U41 ( .A0(n286), .A1(n380), .B0(n22), .B1(n368), .C0(n271), .Y(
        n174) );
  AOI221X2M U42 ( .A0(n293), .A1(n273), .B0(n22), .B1(\intadd_6/A[0] ), .C0(
        n272), .Y(n274) );
  AOI221X2M U43 ( .A0(n285), .A1(n115), .B0(n360), .B1(B[2]), .C0(A[2]), .Y(
        n272) );
  AOI22X1M U44 ( .A0(n289), .A1(n16), .B0(n319), .B1(n22), .Y(n290) );
  AOI22X2M U45 ( .A0(B[4]), .A1(n405), .B0(B[5]), .B1(n389), .Y(n200) );
  CLKINVX1M U46 ( .A(n142), .Y(n144) );
  NAND2XLM U47 ( .A(n144), .B(n143), .Y(n145) );
  NAND2XLM U48 ( .A(n129), .B(n128), .Y(n130) );
  NAND2XLM U49 ( .A(n154), .B(n153), .Y(n155) );
  OAI21X2M U50 ( .A0(n141), .A1(n100), .B0(n99), .Y(n101) );
  NAND2X2M U51 ( .A(n150), .B(n167), .Y(n170) );
  NOR2X4M U52 ( .A(n149), .B(n165), .Y(n167) );
  NAND2X2M U53 ( .A(n159), .B(n158), .Y(n164) );
  NAND2X2M U54 ( .A(n152), .B(n151), .Y(n156) );
  NAND2X2M U55 ( .A(n162), .B(n161), .Y(n163) );
  NAND2X2M U56 ( .A(n116), .B(n115), .Y(n119) );
  NAND2X2M U57 ( .A(n117), .B(n388), .Y(n118) );
  INVX2M U58 ( .A(n88), .Y(n126) );
  NAND2X2M U59 ( .A(n79), .B(n124), .Y(n83) );
  NAND2X2M U60 ( .A(n134), .B(n139), .Y(n135) );
  AND3X6M U61 ( .A(n76), .B(n161), .C(n158), .Y(n269) );
  OAI2BB1X1M U62 ( .A0N(n322), .A1N(\intadd_0/SUM[4] ), .B0(n320), .Y(N190) );
  OAI2BB1X1M U63 ( .A0N(n322), .A1N(n305), .B0(n320), .Y(N189) );
  NAND2X2M U64 ( .A(n392), .B(n74), .Y(n17) );
  OAI21X2M U65 ( .A0(n392), .A1(n55), .B0(n54), .Y(n44) );
  AND2X6M U66 ( .A(n39), .B(n38), .Y(n239) );
  CLKINVX1M U67 ( .A(n346), .Y(\intadd_7/B[2] ) );
  MX2X4M U68 ( .A(n414), .B(n34), .S0(n253), .Y(n41) );
  CLKINVX1M U69 ( .A(n333), .Y(\intadd_5/B[1] ) );
  CLKINVX1M U70 ( .A(n326), .Y(\intadd_5/A[2] ) );
  OAI2BB1X2M U71 ( .A0N(n35), .A1N(n32), .B0(n31), .Y(n33) );
  INVX2M U72 ( .A(\intadd_0/A[0] ), .Y(n11) );
  CLKINVX2M U73 ( .A(n192), .Y(n165) );
  INVX8M U74 ( .A(n415), .Y(n287) );
  BUFX8M U75 ( .A(B[1]), .Y(n378) );
  NAND4X6M U76 ( .A(n153), .B(n151), .C(n161), .D(n158), .Y(n49) );
  OAI2BB1X2M U77 ( .A0N(enable), .A1N(n215), .B0(n214), .Y(N179) );
  AOI21X4M U78 ( .A0(n177), .A1(n16), .B0(n176), .Y(n208) );
  OAI21X4M U79 ( .A0(n171), .A1(n170), .B0(n169), .Y(n177) );
  INVX1M U80 ( .A(n140), .Y(n134) );
  INVX1M U81 ( .A(n125), .Y(n79) );
  INVX2M U82 ( .A(n109), .Y(n82) );
  MX2X2M U83 ( .A(n68), .B(n67), .S0(n219), .Y(n92) );
  OAI2BB1X2M U84 ( .A0N(n322), .A1N(n321), .B0(n320), .Y(N193) );
  CLKXOR2X2M U85 ( .A(n69), .B(n115), .Y(n70) );
  OAI2BB1X2M U86 ( .A0N(n322), .A1N(\intadd_2/SUM[3] ), .B0(n320), .Y(N192) );
  OAI2BB1X2M U87 ( .A0N(n322), .A1N(n307), .B0(n320), .Y(N191) );
  NAND2X2M U88 ( .A(n74), .B(n72), .Y(n19) );
  NAND2X2M U89 ( .A(n68), .B(n388), .Y(n59) );
  NAND2X2M U90 ( .A(n71), .B(n115), .Y(n57) );
  INVX2M U91 ( .A(\intadd_0/n1 ), .Y(n325) );
  MX2X6M U92 ( .A(A[4]), .B(n56), .S0(n230), .Y(n74) );
  OAI2BB2X4M U93 ( .B0(n48), .B1(n47), .A0N(n60), .A1N(n388), .Y(n50) );
  INVX2M U94 ( .A(\intadd_1/n1 ), .Y(n329) );
  OAI2BB1X1M U95 ( .A0N(n366), .A1N(n267), .B0(n266), .Y(n268) );
  INVX2M U96 ( .A(n335), .Y(n338) );
  INVX2M U97 ( .A(\intadd_0/SUM[3] ), .Y(n328) );
  NOR4X1M U98 ( .A(n281), .B(n202), .C(n201), .D(n283), .Y(n203) );
  AOI21X2M U99 ( .A0(n366), .A1(\C9/DATA15_0 ), .B0(n213), .Y(n214) );
  INVX2M U100 ( .A(\intadd_1/SUM[2] ), .Y(n337) );
  NAND2BX2M U101 ( .AN(n175), .B(n28), .Y(n176) );
  NOR2BX4M U102 ( .AN(n35), .B(n253), .Y(n46) );
  CLKINVX2M U103 ( .A(n412), .Y(n284) );
  XOR2X1M U104 ( .A(n412), .B(B[4]), .Y(\DP_OP_29J1_122_2578/n25 ) );
  XOR2X1M U105 ( .A(n412), .B(B[7]), .Y(\DP_OP_29J1_122_2578/n22 ) );
  AND3X4M U106 ( .A(n39), .B(n33), .C(n115), .Y(n253) );
  CLKINVX2M U107 ( .A(n260), .Y(n314) );
  NAND2XLM U108 ( .A(n173), .B(n172), .Y(n21) );
  CLKINVX2M U109 ( .A(n400), .Y(n12) );
  NAND2XLM U110 ( .A(n281), .B(n212), .Y(n20) );
  CLKINVX2M U111 ( .A(\intadd_4/A[0] ), .Y(n10) );
  ADDFX1M U112 ( .A(n411), .B(n410), .CI(n409), .CO(n310), .S(\intadd_2/B[2] )
         );
  AND2X2M U113 ( .A(n380), .B(n414), .Y(n34) );
  AND2X1M U114 ( .A(B[0]), .B(n378), .Y(n3) );
  NAND2X4M U115 ( .A(n39), .B(n115), .Y(n30) );
  NOR2X6M U116 ( .A(B[3]), .B(n49), .Y(n39) );
  OAI2BB1X2M U117 ( .A0N(n413), .A1N(n380), .B0(n42), .Y(n43) );
  INVX8M U118 ( .A(B[7]), .Y(n161) );
  NOR2BX2M U119 ( .AN(n160), .B(n365), .Y(n162) );
  XNOR2X1M U120 ( .A(n131), .B(n130), .Y(n132) );
  XOR2X1M U121 ( .A(n83), .B(n126), .Y(n102) );
  AOI21X2M U122 ( .A0(n98), .A1(n26), .B0(n25), .Y(n99) );
  NAND2X2M U123 ( .A(n97), .B(n26), .Y(n100) );
  INVX1M U124 ( .A(n127), .Y(n129) );
  XNOR2X1M U125 ( .A(n109), .B(n107), .Y(n108) );
  ADDFX2M U126 ( .A(n95), .B(n388), .CI(n93), .CO(n90), .S(n94) );
  ADDFX2M U127 ( .A(n86), .B(n115), .CI(n84), .CO(n93), .S(n85) );
  ADDFX2M U128 ( .A(n78), .B(n392), .CI(n80), .CO(n84), .S(n77) );
  MX2X2M U129 ( .A(n74), .B(n73), .S0(n219), .Y(n86) );
  AND4X6M U130 ( .A(n63), .B(n153), .C(n161), .D(n158), .Y(n219) );
  OAI2B2X4M U131 ( .A1N(n59), .A0(n66), .B0(n68), .B1(n388), .Y(n62) );
  NOR2X2M U132 ( .A(n71), .B(n115), .Y(n58) );
  NOR2X2M U133 ( .A(n65), .B(n151), .Y(n61) );
  AOI2BB2X1M U134 ( .B0(\intadd_3/n1 ), .B1(n304), .A0N(\intadd_3/n1 ), .A1N(
        n304), .Y(n305) );
  OAI21X1M U135 ( .A0(n303), .A1(n211), .B0(n302), .Y(N186) );
  OAI2BB1X1M U136 ( .A0N(n322), .A1N(\intadd_1/SUM[4] ), .B0(n320), .Y(N188)
         );
  OAI21X1M U137 ( .A0(n334), .A1(n301), .B0(n300), .Y(n302) );
  AOI21X1M U138 ( .A0(n334), .A1(n301), .B0(n299), .Y(n300) );
  NOR2X2M U139 ( .A(n46), .B(n115), .Y(n36) );
  AOI31X1M U140 ( .A0(n206), .A1(n205), .A2(n204), .B0(n203), .Y(n207) );
  AOI222X2M U141 ( .A0(n392), .A1(n41), .B0(n392), .B1(n42), .C0(n41), .C1(n42), .Y(n37) );
  OAI211X1M U142 ( .A0(n361), .A1(n360), .B0(n359), .C0(n358), .Y(n362) );
  XOR2X1M U143 ( .A(n412), .B(B[5]), .Y(\DP_OP_29J1_122_2578/n24 ) );
  XOR2X1M U144 ( .A(n412), .B(n378), .Y(\DP_OP_29J1_122_2578/n28 ) );
  XOR2X1M U145 ( .A(n412), .B(B[6]), .Y(\DP_OP_29J1_122_2578/n23 ) );
  XOR2X1M U146 ( .A(n412), .B(B[3]), .Y(\DP_OP_29J1_122_2578/n26 ) );
  INVX1M U147 ( .A(\intadd_2/SUM[2] ), .Y(n324) );
  XOR2X1M U148 ( .A(n412), .B(B[2]), .Y(\DP_OP_29J1_122_2578/n27 ) );
  XOR2X1M U149 ( .A(n412), .B(n368), .Y(\DP_OP_29J1_122_2578/n29 ) );
  OAI21X1M U150 ( .A0(n373), .A1(n371), .B0(n372), .Y(n370) );
  INVX3M U151 ( .A(n352), .Y(n270) );
  OR2X4M U152 ( .A(n23), .B(n8), .Y(n22) );
  AOI21X1M U153 ( .A0(n393), .A1(n392), .B0(n347), .Y(n363) );
  OR3X1M U154 ( .A(n281), .B(n216), .C(n212), .Y(n364) );
  INVX1M U155 ( .A(n281), .Y(n173) );
  OR3X1M U156 ( .A(n281), .B(n280), .C(n212), .Y(n349) );
  OAI21X1M U157 ( .A0(n390), .A1(n386), .B0(n387), .Y(n385) );
  NAND2X2M U158 ( .A(n392), .B(n32), .Y(n31) );
  AND2X1M U159 ( .A(n3), .B(n7), .Y(n1) );
  OR4X1M U160 ( .A(n389), .B(n405), .C(n392), .D(n380), .Y(\intadd_4/A[0] ) );
  OR2X1M U161 ( .A(alu_function[3]), .B(alu_function[1]), .Y(n24) );
  OR4X1M U162 ( .A(n287), .B(n404), .C(n392), .D(n380), .Y(n400) );
  OR4X1M U163 ( .A(n393), .B(n392), .C(n380), .D(n381), .Y(\intadd_7/A[0] ) );
  OR4X1M U164 ( .A(n404), .B(n389), .C(n392), .D(n380), .Y(\intadd_0/A[0] ) );
  NOR2X1M U165 ( .A(n178), .B(n392), .Y(n114) );
  NOR2X1M U166 ( .A(n404), .B(n388), .Y(\intadd_5/A[0] ) );
  BUFX5M U167 ( .A(alu_function[2]), .Y(n281) );
  NOR2X1M U168 ( .A(n369), .B(n380), .Y(\intadd_7/CI ) );
  NOR2X1M U169 ( .A(n153), .B(n369), .Y(\intadd_3/A[1] ) );
  NOR2X1M U170 ( .A(n389), .B(n151), .Y(\intadd_5/B[0] ) );
  NOR2X1M U171 ( .A(n153), .B(n393), .Y(\intadd_4/B[0] ) );
  NOR2X1M U172 ( .A(n153), .B(n405), .Y(n401) );
  NOR2X1M U173 ( .A(n153), .B(n394), .Y(n398) );
  NOR2X1M U174 ( .A(n389), .B(n115), .Y(n384) );
  INVX6M U175 ( .A(enable), .Y(n211) );
  NOR2X1M U176 ( .A(n389), .B(n388), .Y(n397) );
  NOR2X1M U177 ( .A(n153), .B(n381), .Y(n375) );
  OAI2BB1X1M U178 ( .A0N(A[4]), .A1N(n380), .B0(n55), .Y(n56) );
  NOR2X1M U179 ( .A(n158), .B(n393), .Y(\intadd_0/B[0] ) );
  NOR2X3M U180 ( .A(n388), .B(n381), .Y(n372) );
  NOR2X1M U181 ( .A(n158), .B(n369), .Y(\intadd_0/B[1] ) );
  NOR2X1M U182 ( .A(n161), .B(n381), .Y(n382) );
  NOR2X1M U183 ( .A(n405), .B(n388), .Y(\intadd_0/CI ) );
  NOR2X1M U184 ( .A(n158), .B(n394), .Y(\intadd_5/CI ) );
  NOR2X3M U185 ( .A(n369), .B(n115), .Y(\intadd_6/A[0] ) );
  NOR2X1M U186 ( .A(n151), .B(n381), .Y(\intadd_6/CI ) );
  NOR2X1M U187 ( .A(n158), .B(n381), .Y(\intadd_3/CI ) );
  NOR2X1M U188 ( .A(n151), .B(n369), .Y(\intadd_1/B[1] ) );
  NOR2X1M U189 ( .A(n151), .B(n393), .Y(\intadd_1/B[0] ) );
  BUFX8M U190 ( .A(reset_n), .Y(n279) );
  NOR2X1M U191 ( .A(n405), .B(n115), .Y(\intadd_3/A[0] ) );
  NOR2X1M U192 ( .A(n151), .B(n394), .Y(\intadd_3/B[1] ) );
  NOR2X1M U193 ( .A(n161), .B(n393), .Y(n399) );
  NOR2X1M U194 ( .A(n388), .B(n369), .Y(\intadd_1/CI ) );
  NOR2X1M U195 ( .A(n394), .B(n115), .Y(n377) );
  AND2X1M U196 ( .A(A[3]), .B(A[4]), .Y(n7) );
  BUFX10M U197 ( .A(B[0]), .Y(n368) );
  INVX4M U198 ( .A(A[2]), .Y(n369) );
  INVX12M U199 ( .A(B[2]), .Y(n115) );
  INVX10M U200 ( .A(B[3]), .Y(n388) );
  NOR2BX4M U201 ( .AN(n415), .B(n289), .Y(n35) );
  AOI222X4M U202 ( .A0(n115), .A1(n52), .B0(n115), .B1(n45), .C0(n52), .C1(n45), .Y(n48) );
  NAND2XLM U203 ( .A(n106), .B(n105), .Y(n107) );
  OA22XLM U204 ( .A0(n393), .A1(n352), .B0(n380), .B1(n347), .Y(n28) );
  MX2X2M U205 ( .A(A[3]), .B(n64), .S0(n219), .Y(n78) );
  MX2X2M U206 ( .A(n71), .B(n70), .S0(n219), .Y(n95) );
  XNOR2X2M U207 ( .A(n146), .B(n145), .Y(n147) );
  OAI21X2M U208 ( .A0(n141), .A1(n140), .B0(n139), .Y(n146) );
  MX2X2M U209 ( .A(n103), .B(n102), .S0(n365), .Y(n117) );
  MX2X2M U210 ( .A(n95), .B(n94), .S0(n269), .Y(n137) );
  MX2X2M U211 ( .A(A[2]), .B(n81), .S0(n269), .Y(n109) );
  NOR2X2M U212 ( .A(n111), .B(n392), .Y(n104) );
  NAND2X2M U213 ( .A(n111), .B(n392), .Y(n105) );
  MX2X2M U214 ( .A(n133), .B(n132), .S0(n365), .Y(n152) );
  OAI21X2M U215 ( .A0(n126), .A1(n125), .B0(n124), .Y(n131) );
  MX2X2M U216 ( .A(n137), .B(n136), .S0(n365), .Y(n154) );
  CLKXOR2X2M U217 ( .A(n141), .B(n135), .Y(n136) );
  NAND2XLM U218 ( .A(n178), .B(n392), .Y(n113) );
  NOR2X2M U219 ( .A(n117), .B(n388), .Y(n120) );
  NOR2X2M U220 ( .A(n116), .B(n115), .Y(n110) );
  AO22XLM U221 ( .A0(B[2]), .A1(n369), .B0(B[3]), .B1(n394), .Y(n9) );
  NAND2X2M U222 ( .A(n137), .B(n151), .Y(n139) );
  NOR2X4M U223 ( .A(n148), .B(n153), .Y(n142) );
  NOR2X4M U224 ( .A(n137), .B(n151), .Y(n140) );
  OAI21X4M U225 ( .A0(n82), .A1(n104), .B0(n105), .Y(n88) );
  NOR2X4M U226 ( .A(n133), .B(n388), .Y(n127) );
  NOR2X4M U227 ( .A(n103), .B(n115), .Y(n125) );
  NAND2X2M U228 ( .A(n133), .B(n388), .Y(n128) );
  NAND2X2M U229 ( .A(n103), .B(n115), .Y(n124) );
  NOR2BX2M U230 ( .AN(n65), .B(n219), .Y(n96) );
  AOI21X2M U231 ( .A0(n168), .A1(n167), .B0(n166), .Y(n169) );
  OAI21X2M U232 ( .A0(n157), .A1(n156), .B0(n155), .Y(n168) );
  OAI21X2M U233 ( .A0(n165), .A1(n164), .B0(n163), .Y(n166) );
  AOI21X2M U234 ( .A0(n123), .A1(n122), .B0(n121), .Y(n171) );
  NOR2X2M U235 ( .A(n120), .B(n110), .Y(n123) );
  OAI21X2M U236 ( .A0(n27), .A1(n114), .B0(n113), .Y(n122) );
  OAI21X2M U237 ( .A0(n120), .A1(n119), .B0(n118), .Y(n121) );
  OAI21X2M U238 ( .A0(n142), .A1(n139), .B0(n143), .Y(n98) );
  NOR2X2M U239 ( .A(n142), .B(n140), .Y(n97) );
  AOI21X4M U240 ( .A0(n89), .A1(n88), .B0(n87), .Y(n141) );
  OAI21X2M U241 ( .A0(n127), .A1(n124), .B0(n128), .Y(n87) );
  NOR2X2M U242 ( .A(n125), .B(n127), .Y(n89) );
  NOR2BX8M U243 ( .AN(n50), .B(n49), .Y(n230) );
  NAND2XLM U244 ( .A(B[3]), .B(A[1]), .Y(n344) );
  NAND2BX2M U245 ( .AN(alu_function[3]), .B(alu_function[1]), .Y(n212) );
  NAND2X2M U246 ( .A(n281), .B(n216), .Y(n218) );
  NAND2XLM U247 ( .A(B[6]), .B(A[4]), .Y(n331) );
  CLKINVX1M U248 ( .A(n343), .Y(n262) );
  BUFX6M U249 ( .A(A[5]), .Y(n413) );
  NOR2X8M U250 ( .A(n283), .B(n218), .Y(n348) );
  OAI2BB2X1M U251 ( .B0(n278), .B1(n211), .A0N(n366), .A1N(\C9/DATA15_2 ), .Y(
        N181) );
  AND4XLM U252 ( .A(n277), .B(n276), .C(n275), .D(n274), .Y(n278) );
  AND4XLM U253 ( .A(n228), .B(n227), .C(n226), .D(n225), .Y(n229) );
  AND4XLM U254 ( .A(n251), .B(n250), .C(n249), .D(n248), .Y(n252) );
  AND4XLM U255 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(n261) );
  CLKINVX1M U256 ( .A(n311), .Y(n312) );
  AND2X2M U257 ( .A(n280), .B(n4), .Y(n2) );
  AND2X1M U258 ( .A(n20), .B(n21), .Y(n4) );
  AND2X2M U259 ( .A(n17), .B(n18), .Y(n5) );
  AND2X2M U260 ( .A(n19), .B(n5), .Y(n6) );
  INVX6M U261 ( .A(A[3]), .Y(n394) );
  AND3XLM U262 ( .A(n280), .B(n206), .C(n173), .Y(n8) );
  CLKINVX1M U263 ( .A(\intadd_7/A[0] ), .Y(n13) );
  NOR4X6M U264 ( .A(n287), .B(n404), .C(n115), .D(n392), .Y(n390) );
  OAI31X2M U265 ( .A0(n390), .A1(n387), .A2(n386), .B0(n385), .Y(
        \intadd_0/B[2] ) );
  BUFX5M U266 ( .A(alu_function[0]), .Y(n280) );
  NOR2X3M U267 ( .A(n404), .B(n158), .Y(n410) );
  NOR2X4M U268 ( .A(n405), .B(n151), .Y(n395) );
  CLKINVX2M U269 ( .A(n9), .Y(n14) );
  NOR2X4M U270 ( .A(n295), .B(n211), .Y(n260) );
  NOR2X6M U271 ( .A(n212), .B(n218), .Y(n293) );
  CLKINVX4M U272 ( .A(n349), .Y(n15) );
  INVX4M U273 ( .A(n364), .Y(n16) );
  ADDFX2M U274 ( .A(n310), .B(n309), .CI(n308), .CO(n316), .S(\intadd_2/B[3] )
         );
  ADDFX2M U275 ( .A(n345), .B(n344), .CI(n343), .CO(n341), .S(n346) );
  INVX6M U276 ( .A(A[4]), .Y(n405) );
  OAI31X2M U277 ( .A0(n224), .A1(n187), .A2(n186), .B0(n200), .Y(n190) );
  OAI31X2M U278 ( .A0(n373), .A1(n372), .A2(n371), .B0(n370), .Y(
        \intadd_7/B[1] ) );
  AOI221X2M U279 ( .A0(n381), .A1(n342), .B0(n115), .B1(n342), .C0(n373), .Y(
        \intadd_7/B[0] ) );
  NOR3X8M U280 ( .A(n115), .B(n381), .C(n342), .Y(n373) );
  CLKINVX4M U281 ( .A(n347), .Y(n271) );
  NOR2X4M U282 ( .A(n161), .B(n369), .Y(n387) );
  NOR2X3M U283 ( .A(B[6]), .B(n404), .Y(n197) );
  NAND2XLM U284 ( .A(n392), .B(n72), .Y(n18) );
  OAI2BB2X1M U285 ( .B0(n71), .B1(n6), .A0N(n71), .A1N(n6), .Y(n69) );
  OAI21X4M U286 ( .A0(n58), .A1(n6), .B0(n57), .Y(n66) );
  AOI21X4M U287 ( .A0(n285), .A1(n353), .B0(n211), .Y(n311) );
  CLKINVX4M U288 ( .A(n293), .Y(n353) );
  BUFX5M U289 ( .A(n217), .Y(n412) );
  CLKINVX4M U290 ( .A(n2), .Y(n285) );
  NOR2BX4M U291 ( .AN(n96), .B(n269), .Y(n160) );
  NOR2BX4M U292 ( .AN(n60), .B(n230), .Y(n65) );
  NOR2BX4M U293 ( .AN(n46), .B(n239), .Y(n60) );
  NOR2X4M U294 ( .A(n394), .B(n388), .Y(\intadd_4/CI ) );
  NOR2X1M U295 ( .A(n218), .B(n24), .Y(n23) );
  AND2X2M U296 ( .A(n160), .B(n158), .Y(n25) );
  OR2X2M U297 ( .A(n160), .B(n158), .Y(n26) );
  MXI2X1M U298 ( .A(A[1]), .B(n112), .S0(n365), .Y(n27) );
  NAND2X2M U299 ( .A(n148), .B(n153), .Y(n143) );
  INVX10M U300 ( .A(n368), .Y(n380) );
  CLKINVX1M U301 ( .A(n410), .Y(n255) );
  NAND2BX2M U302 ( .AN(alu_function[1]), .B(alu_function[3]), .Y(n172) );
  NOR3X2M U303 ( .A(n281), .B(n280), .C(n172), .Y(n29) );
  INVX2M U304 ( .A(n280), .Y(n216) );
  AOI221X2M U305 ( .A0(n286), .A1(n368), .B0(n2), .B1(n380), .C0(n293), .Y(
        n209) );
  NAND2BX2M U306 ( .AN(A[3]), .B(n368), .Y(n72) );
  OAI2BB1XLM U307 ( .A0N(A[3]), .A1N(n380), .B0(n72), .Y(n64) );
  INVX8M U308 ( .A(B[6]), .Y(n158) );
  AOI211X4M U309 ( .A0(n368), .A1(n287), .B0(n378), .C0(n30), .Y(n289) );
  NAND2BX2M U310 ( .AN(n414), .B(n368), .Y(n32) );
  NAND2BX2M U311 ( .AN(n413), .B(n368), .Y(n42) );
  XOR3XLM U312 ( .A(n392), .B(n41), .C(n42), .Y(n40) );
  OAI2BB2X4M U313 ( .B0(n37), .B1(n36), .A0N(n46), .A1N(n115), .Y(n38) );
  NAND2BX2M U314 ( .AN(A[4]), .B(n368), .Y(n55) );
  OAI2BB1X4M U315 ( .A0N(n392), .A1N(n55), .B0(n44), .Y(n45) );
  XOR3XLM U316 ( .A(n115), .B(n52), .C(n45), .Y(n51) );
  NOR2X2M U317 ( .A(n60), .B(n388), .Y(n47) );
  XOR3XLM U318 ( .A(n392), .B(n54), .C(n55), .Y(n53) );
  OAI2BB2X4M U319 ( .B0(n62), .B1(n61), .A0N(n65), .A1N(n151), .Y(n63) );
  NAND2BX2M U320 ( .AN(A[2]), .B(n368), .Y(n80) );
  XOR3XLM U321 ( .A(n388), .B(n68), .C(n66), .Y(n67) );
  XOR3XLM U322 ( .A(n392), .B(n74), .C(n72), .Y(n73) );
  CLKMX2X4M U323 ( .A(n78), .B(n77), .S0(n269), .Y(n103) );
  OAI2BB1XLM U324 ( .A0N(A[2]), .A1N(n380), .B0(n80), .Y(n81) );
  NAND2BX2M U325 ( .AN(A[1]), .B(n368), .Y(n111) );
  ADDFX2M U326 ( .A(n92), .B(n151), .CI(n90), .CO(n75), .S(n91) );
  CLKINVX1M U327 ( .A(n104), .Y(n106) );
  OAI2BB1XLM U328 ( .A0N(A[1]), .A1N(n380), .B0(n111), .Y(n112) );
  NAND2BX2M U329 ( .AN(A[0]), .B(n368), .Y(n178) );
  NAND2X1M U330 ( .A(B[7]), .B(n287), .Y(n192) );
  INVX2M U331 ( .A(n172), .Y(n206) );
  NOR2X2M U332 ( .A(alu_function[3]), .B(alu_function[1]), .Y(n210) );
  NAND3X4M U333 ( .A(n281), .B(n280), .C(n210), .Y(n347) );
  INVX6M U334 ( .A(A[0]), .Y(n381) );
  OAI22X1M U335 ( .A0(n368), .A1(n353), .B0(n174), .B1(n381), .Y(n175) );
  INVX4M U336 ( .A(A[1]), .Y(n393) );
  NAND3X2M U337 ( .A(n281), .B(n280), .C(n206), .Y(n352) );
  INVX6M U338 ( .A(n414), .Y(n404) );
  AOI22X4M U339 ( .A0(B[6]), .A1(n404), .B0(B[7]), .B1(n287), .Y(n188) );
  NOR2X2M U340 ( .A(A[4]), .B(n151), .Y(n231) );
  NAND2X2M U341 ( .A(n413), .B(n153), .Y(n243) );
  CLKINVX1M U342 ( .A(n178), .Y(n179) );
  NAND2X2M U343 ( .A(A[2]), .B(n115), .Y(n194) );
  NAND2X1M U344 ( .A(A[1]), .B(n392), .Y(n183) );
  NOR2X2M U345 ( .A(A[1]), .B(n392), .Y(n184) );
  NOR2X4M U346 ( .A(B[3]), .B(n394), .Y(n224) );
  OAI21X2M U347 ( .A0(B[4]), .A1(n405), .B0(n243), .Y(n196) );
  AOI211X2M U348 ( .A0(n14), .A1(n180), .B0(n224), .C0(n196), .Y(n181) );
  NOR2X2M U349 ( .A(n413), .B(n153), .Y(n244) );
  AOI211X2M U350 ( .A0(n231), .A1(n243), .B0(n181), .C0(n244), .Y(n182) );
  NAND2X1M U351 ( .A(n415), .B(n161), .Y(n204) );
  CLKINVX1M U352 ( .A(n204), .Y(n198) );
  NOR2X1M U353 ( .A(B[4]), .B(n405), .Y(n187) );
  NOR2X2M U354 ( .A(A[3]), .B(n388), .Y(n223) );
  OAI31X2M U355 ( .A0(n381), .A1(n184), .A2(n368), .B0(n183), .Y(n185) );
  OAI2BB2X1M U356 ( .B0(n223), .B1(n194), .A0N(n185), .A1N(n14), .Y(n186) );
  INVX4M U357 ( .A(n413), .Y(n389) );
  CLKINVX1M U358 ( .A(n188), .Y(n189) );
  AOI31X1M U359 ( .A0(n243), .A1(n190), .A2(n280), .B0(n189), .Y(n191) );
  AOI211X2M U360 ( .A0(n197), .A1(n192), .B0(n198), .C0(n191), .Y(n202) );
  NAND3XLM U361 ( .A(n361), .B(n194), .C(n193), .Y(n195) );
  NOR4X1M U362 ( .A(n198), .B(n197), .C(n196), .D(n195), .Y(n199) );
  AOI31X1M U363 ( .A0(n200), .A1(n14), .A2(n199), .B0(n280), .Y(n201) );
  NAND2X2M U364 ( .A(alu_function[3]), .B(alu_function[1]), .Y(n283) );
  OAI211X2M U365 ( .A0(A[0]), .A1(n209), .B0(n208), .C0(n207), .Y(n215) );
  NAND2BX2M U366 ( .AN(n281), .B(n210), .Y(n295) );
  INVX4M U367 ( .A(n314), .Y(n366) );
  NAND2X2M U368 ( .A(enable), .B(n15), .Y(n299) );
  NOR3X2M U369 ( .A(n299), .B(n381), .C(n380), .Y(n213) );
  NOR2X2M U370 ( .A(n295), .B(n216), .Y(n217) );
  AOI22X1M U371 ( .A0(A[2]), .A1(n348), .B0(n16), .B1(n219), .Y(n228) );
  AOI21X1M U372 ( .A0(n394), .A1(n388), .B0(n347), .Y(n222) );
  NAND2XLM U373 ( .A(n394), .B(n388), .Y(n220) );
  OAI22X1M U374 ( .A0(n285), .A1(n220), .B0(\intadd_4/CI ), .B1(n353), .Y(n221) );
  AOI211X2M U375 ( .A0(n270), .A1(A[4]), .B0(n222), .C0(n221), .Y(n226) );
  OAI21X1M U376 ( .A0(n224), .A1(n223), .B0(n286), .Y(n225) );
  OAI2BB2X1M U377 ( .B0(n229), .B1(n211), .A0N(n366), .A1N(\C9/DATA15_3 ), .Y(
        N182) );
  OAI32X2M U378 ( .A0(B[4]), .A1(A[4]), .A2(n285), .B0(n347), .B1(n151), .Y(
        n237) );
  AOI2BB2X1M U379 ( .B0(n231), .B1(n286), .A0N(n395), .A1N(n353), .Y(n233) );
  NAND4X1M U380 ( .A(n235), .B(n234), .C(n233), .D(n232), .Y(n236) );
  AOI211X2M U381 ( .A0(n413), .A1(n270), .B0(n237), .C0(n236), .Y(n238) );
  OAI2BB2X1M U382 ( .B0(n238), .B1(n211), .A0N(n260), .A1N(\C9/DATA15_4 ), .Y(
        N183) );
  NOR2X2M U383 ( .A(n413), .B(B[5]), .Y(n240) );
  AOI2BB2X1M U384 ( .B0(n414), .B1(n270), .A0N(n347), .A1N(n240), .Y(n250) );
  NAND2X2M U385 ( .A(n413), .B(B[5]), .Y(n330) );
  CLKINVX1M U386 ( .A(n330), .Y(n247) );
  NAND2X2M U387 ( .A(B[2]), .B(A[1]), .Y(n371) );
  NOR2X4M U388 ( .A(n393), .B(n392), .Y(n354) );
  INVX2M U389 ( .A(n354), .Y(n342) );
  AOI2B1X1M U390 ( .A1N(n371), .A0(n372), .B0(n373), .Y(n345) );
  NAND4X2M U391 ( .A(A[3]), .B(A[2]), .C(n378), .D(n368), .Y(n343) );
  INVX2M U392 ( .A(\intadd_7/n1 ), .Y(n339) );
  INVX2M U393 ( .A(\intadd_6/SUM[1] ), .Y(n340) );
  OAI21X1M U394 ( .A0(n341), .A1(n242), .B0(n15), .Y(n241) );
  AOI21X1M U395 ( .A0(n341), .A1(n242), .B0(n241), .Y(n246) );
  CLKINVX2M U396 ( .A(n286), .Y(n360) );
  AOI2B1X1M U397 ( .A1N(n244), .A0(n243), .B0(n360), .Y(n245) );
  AOI211X2M U398 ( .A0(n247), .A1(n22), .B0(n246), .C0(n245), .Y(n248) );
  OAI2BB2X1M U399 ( .B0(n252), .B1(n211), .A0N(n366), .A1N(\C9/DATA15_5 ), .Y(
        N184) );
  OAI222X1M U400 ( .A0(n271), .A1(n286), .B0(n271), .B1(n158), .C0(n414), .C1(
        B[6]), .Y(n257) );
  OAI2BB2X1M U401 ( .B0(n261), .B1(n211), .A0N(n260), .A1N(\C9/DATA15_6 ), .Y(
        N185) );
  NAND2X2M U402 ( .A(A[2]), .B(n378), .Y(n263) );
  AOI221X2M U403 ( .A0(n380), .A1(n263), .B0(n394), .B1(n263), .C0(n262), .Y(
        \intadd_7/A[1] ) );
  NAND2X2M U404 ( .A(A[3]), .B(n378), .Y(n264) );
  AOI221X2M U405 ( .A0(n380), .A1(n264), .B0(n405), .B1(n264), .C0(n1), .Y(
        \intadd_6/B[0] ) );
  NAND2X2M U406 ( .A(n413), .B(n378), .Y(n265) );
  AOI221X2M U407 ( .A0(n380), .A1(n265), .B0(n404), .B1(n265), .C0(n11), .Y(
        \intadd_3/B[0] ) );
  INVX4M U408 ( .A(n299), .Y(n322) );
  XNOR2X1M U409 ( .A(\DP_OP_29J1_122_2578/n9 ), .B(n284), .Y(n267) );
  AOI31X1M U410 ( .A0(n415), .A1(enable), .A2(n348), .B0(n311), .Y(n266) );
  AO21XLM U411 ( .A0(n322), .A1(\intadd_1/SUM[3] ), .B0(n268), .Y(N187) );
  AOI22X1M U412 ( .A0(A[3]), .A1(n270), .B0(n16), .B1(n269), .Y(n277) );
  OAI222X1M U413 ( .A0(n271), .A1(n286), .B0(n271), .B1(n115), .C0(A[2]), .C1(
        B[2]), .Y(n275) );
  CLKINVX1M U414 ( .A(\intadd_6/A[0] ), .Y(n273) );
  NAND2XLM U415 ( .A(n281), .B(n280), .Y(n282) );
  AOI2BB1X1M U416 ( .A0N(n283), .A1N(n282), .B0(n211), .Y(N178) );
  NOR2X2M U417 ( .A(\DP_OP_29J1_122_2578/n9 ), .B(n284), .Y(n315) );
  AOI21X6M U418 ( .A0(n315), .A1(n366), .B0(n311), .Y(n320) );
  OAI21X1M U419 ( .A0(n415), .A1(n285), .B0(n353), .Y(n298) );
  OAI21X1M U420 ( .A0(n287), .A1(n161), .B0(n286), .Y(n288) );
  CLKINVX1M U421 ( .A(n348), .Y(n291) );
  NOR2X4M U422 ( .A(n287), .B(n161), .Y(n319) );
  OAI21X1M U423 ( .A0(n291), .A1(n404), .B0(n290), .Y(n292) );
  AOI21X1M U424 ( .A0(n287), .A1(n293), .B0(n292), .Y(n294) );
  OAI2B1X1M U425 ( .A1N(\C9/DATA15_7 ), .A0(n295), .B0(n294), .Y(n296) );
  AOI211X2M U426 ( .A0(n161), .A1(n298), .B0(n297), .C0(n296), .Y(n303) );
  ADDFX2M U427 ( .A(\intadd_3/SUM[0] ), .B(\intadd_1/SUM[1] ), .CI(
        \intadd_4/SUM[0] ), .CO(n334), .S(\intadd_6/B[2] ) );
  BUFX2M U428 ( .A(\intadd_6/n1 ), .Y(n335) );
  AOI22X2M U429 ( .A0(\intadd_1/SUM[2] ), .A1(n335), .B0(n338), .B1(n337), .Y(
        n301) );
  AOI22X2M U430 ( .A0(\intadd_0/SUM[3] ), .A1(\intadd_1/n1 ), .B0(n329), .B1(
        n328), .Y(n304) );
  AOI22X2M U431 ( .A0(\intadd_2/SUM[2] ), .A1(\intadd_0/n1 ), .B0(n325), .B1(
        n324), .Y(n306) );
  AOI2BB2X2M U432 ( .B0(\intadd_5/n1 ), .B1(n306), .A0N(\intadd_5/n1 ), .A1N(
        n306), .Y(n307) );
  NOR2X1M U433 ( .A(n287), .B(n153), .Y(n411) );
  NOR2X1M U434 ( .A(n161), .B(n389), .Y(n409) );
  NOR2X1M U435 ( .A(n161), .B(n404), .Y(n309) );
  NOR2X1M U436 ( .A(n287), .B(n158), .Y(n308) );
  OAI211X2M U437 ( .A0(n316), .A1(\intadd_2/n1 ), .B0(n319), .C0(n322), .Y(
        n313) );
  OAI2B11X2M U438 ( .A1N(n315), .A0(n314), .B0(n313), .C0(n312), .Y(N194) );
  NOR2X2M U439 ( .A(n316), .B(\intadd_2/n1 ), .Y(n318) );
  AOI22X1M U440 ( .A0(n316), .A1(\intadd_2/n1 ), .B0(n319), .B1(n318), .Y(n317) );
  OAI21X2M U441 ( .A0(n319), .A1(n318), .B0(n317), .Y(n321) );
  OAI21X2M U442 ( .A0(\intadd_2/SUM[2] ), .A1(\intadd_0/n1 ), .B0(
        \intadd_5/n1 ), .Y(n323) );
  OAI21X2M U443 ( .A0(n325), .A1(n324), .B0(n323), .Y(\intadd_2/A[3] ) );
  NOR2X1M U444 ( .A(n158), .B(n389), .Y(\intadd_2/B[1] ) );
  NAND2X2M U445 ( .A(n415), .B(B[2]), .Y(n386) );
  AOI2B1X1M U446 ( .A1N(n386), .A0(n387), .B0(n390), .Y(n332) );
  OAI21X2M U447 ( .A0(\intadd_0/SUM[3] ), .A1(\intadd_1/n1 ), .B0(
        \intadd_3/n1 ), .Y(n327) );
  OAI21X2M U448 ( .A0(n329), .A1(n328), .B0(n327), .Y(\intadd_0/A[4] ) );
  ADDFX1M U449 ( .A(n332), .B(n331), .CI(n330), .CO(n326), .S(n333) );
  NOR2X1M U450 ( .A(n287), .B(n388), .Y(\intadd_2/A[0] ) );
  OAI21X2M U451 ( .A0(\intadd_1/SUM[2] ), .A1(n335), .B0(n334), .Y(n336) );
  OAI21X2M U452 ( .A0(n338), .A1(n337), .B0(n336), .Y(\intadd_1/A[3] ) );
  AOI222X2M U453 ( .A0(n341), .A1(n340), .B0(n341), .B1(n339), .C0(n340), .C1(
        n339), .Y(\intadd_6/A[2] ) );
  AOI22X1M U454 ( .A0(A[0]), .A1(n348), .B0(n354), .B1(n22), .Y(n359) );
  NOR2X1M U455 ( .A(A[1]), .B(n378), .Y(n357) );
  NAND2XLM U456 ( .A(A[1]), .B(n368), .Y(n351) );
  NAND2XLM U457 ( .A(n378), .B(A[0]), .Y(n350) );
  AOI211X2M U458 ( .A0(n351), .A1(n350), .B0(n13), .C0(n349), .Y(n356) );
  OAI22X1M U459 ( .A0(n354), .A1(n353), .B0(n369), .B1(n352), .Y(n355) );
  AOI211X2M U460 ( .A0(n357), .A1(n2), .B0(n356), .C0(n355), .Y(n358) );
  AOI211X2M U461 ( .A0(n365), .A1(n16), .B0(n363), .C0(n362), .Y(n367) );
  NOR2X1M U462 ( .A(n161), .B(n394), .Y(\intadd_2/CI ) );
  NOR2X1M U463 ( .A(n404), .B(n151), .Y(\intadd_2/B[0] ) );
  NAND2X2M U464 ( .A(A[4]), .B(n378), .Y(n374) );
  AOI221X2M U465 ( .A0(n380), .A1(n374), .B0(n389), .B1(n374), .C0(n10), .Y(
        n376) );
  ADDFX1M U466 ( .A(n377), .B(n376), .CI(n375), .CO(\intadd_1/A[1] ), .S(
        \intadd_6/B[1] ) );
  NAND2X2M U467 ( .A(n414), .B(n378), .Y(n379) );
  AOI221X2M U468 ( .A0(n380), .A1(n379), .B0(n287), .B1(n379), .C0(n12), .Y(
        n383) );
  ADDFX1M U469 ( .A(n384), .B(n383), .CI(n382), .CO(\intadd_0/A[1] ), .S(
        \intadd_4/B[1] ) );
  NAND2X2M U470 ( .A(n414), .B(B[2]), .Y(n391) );
  AOI221X2M U471 ( .A0(n392), .A1(n391), .B0(n287), .B1(n391), .C0(n390), .Y(
        n396) );
  ADDFX1M U472 ( .A(n397), .B(n396), .CI(n395), .CO(n403), .S(\intadd_3/B[2] )
         );
  ADDFX1M U473 ( .A(n12), .B(n399), .CI(n398), .CO(n402), .S(\intadd_3/A[2] )
         );
  ADDFX1M U474 ( .A(n403), .B(n402), .CI(n401), .CO(\intadd_0/A[3] ), .S(
        \intadd_3/A[3] ) );
  NOR2X1M U475 ( .A(n287), .B(n151), .Y(n408) );
  NOR2X1M U476 ( .A(n404), .B(n153), .Y(n407) );
  NOR2X1M U477 ( .A(n161), .B(n405), .Y(n406) );
  ADDFX1M U478 ( .A(n408), .B(n407), .CI(n406), .CO(\intadd_2/A[2] ), .S(
        \intadd_2/A[1] ) );
endmodule


module register_file ( clk, reset_n, address, write_data, read_en, 
        read_data_valid, read_data, register0, register1, register2, register3, 
        write_en_BAR );
  input [3:0] address;
  input [7:0] write_data;
  output [7:0] read_data;
  output [7:0] register0;
  output [7:0] register1;
  output [7:0] register2;
  output [7:0] register3;
  input clk, reset_n, read_en, write_en_BAR;
  output read_data_valid;
  wire   write_en, n337, n338, n339, n17, n18, n19, n20, n21, n22, n340, n23,
         n24, n341, n342, n343, n344, \memory[4][7] , \memory[4][6] ,
         \memory[4][5] , \memory[4][4] , \memory[4][3] , \memory[4][2] ,
         \memory[4][1] , \memory[4][0] , \memory[5][7] , \memory[5][6] ,
         \memory[5][5] , \memory[5][4] , \memory[5][3] , \memory[5][2] ,
         \memory[5][1] , \memory[5][0] , \memory[6][7] , \memory[6][6] ,
         \memory[6][5] , \memory[6][4] , \memory[6][3] , \memory[6][2] ,
         \memory[6][1] , \memory[6][0] , \memory[7][7] , \memory[7][6] ,
         \memory[7][5] , \memory[7][4] , \memory[7][3] , \memory[7][2] ,
         \memory[7][1] , \memory[7][0] , \memory[8][7] , \memory[8][6] ,
         \memory[8][5] , \memory[8][4] , \memory[8][3] , \memory[8][2] ,
         \memory[8][1] , \memory[8][0] , \memory[9][7] , \memory[9][6] ,
         \memory[9][5] , \memory[9][4] , \memory[9][3] , \memory[9][2] ,
         \memory[9][1] , \memory[9][0] , \memory[10][7] , \memory[10][6] ,
         \memory[10][5] , \memory[10][4] , \memory[10][3] , \memory[10][2] ,
         \memory[10][1] , \memory[10][0] , \memory[11][7] , \memory[11][6] ,
         \memory[11][5] , \memory[11][4] , \memory[11][3] , \memory[11][2] ,
         \memory[11][1] , \memory[11][0] , \memory[12][7] , \memory[12][6] ,
         \memory[12][5] , \memory[12][4] , \memory[12][3] , \memory[12][2] ,
         \memory[12][1] , \memory[12][0] , \memory[13][7] , \memory[13][6] ,
         \memory[13][5] , \memory[13][4] , \memory[13][3] , \memory[13][2] ,
         \memory[13][1] , \memory[13][0] , \memory[14][7] , \memory[14][6] ,
         \memory[14][5] , \memory[14][4] , \memory[14][3] , \memory[14][2] ,
         \memory[14][1] , \memory[14][0] , \memory[15][7] , \memory[15][6] ,
         \memory[15][5] , \memory[15][4] , \memory[15][3] , \memory[15][2] ,
         \memory[15][1] , \memory[15][0] , N61, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n25, n26,
         n27, n29, n31, n33, n35, n37, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336;
  assign write_en = write_en_BAR;

  DFFRQX1M read_data_valid_reg ( .D(N61), .CK(clk), .RN(n336), .Q(
        read_data_valid) );
  DFFRQX1M \memory_reg[2][7]  ( .D(n263), .CK(clk), .RN(n333), .Q(n17) );
  DFFRQX1M \memory_reg[2][6]  ( .D(n262), .CK(clk), .RN(n333), .Q(n18) );
  DFFRQX1M \memory_reg[2][5]  ( .D(n261), .CK(clk), .RN(n333), .Q(n19) );
  DFFRQX1M \memory_reg[2][4]  ( .D(n260), .CK(clk), .RN(n333), .Q(n20) );
  DFFRQX1M \memory_reg[2][3]  ( .D(n259), .CK(clk), .RN(n333), .Q(n21) );
  DFFRQX1M \memory_reg[2][2]  ( .D(n258), .CK(clk), .RN(n333), .Q(n22) );
  DFFRQX1M \memory_reg[3][7]  ( .D(n255), .CK(clk), .RN(n26), .Q(n23) );
  DFFRQX1M \memory_reg[3][6]  ( .D(n254), .CK(clk), .RN(n25), .Q(n24) );
  DFFRQX1M \memory_reg[4][7]  ( .D(n247), .CK(clk), .RN(n336), .Q(
        \memory[4][7] ) );
  DFFRQX1M \memory_reg[4][6]  ( .D(n246), .CK(clk), .RN(n26), .Q(
        \memory[4][6] ) );
  DFFRQX1M \memory_reg[4][5]  ( .D(n245), .CK(clk), .RN(n25), .Q(
        \memory[4][5] ) );
  DFFRQX1M \memory_reg[4][4]  ( .D(n244), .CK(clk), .RN(n336), .Q(
        \memory[4][4] ) );
  DFFRQX1M \memory_reg[4][3]  ( .D(n243), .CK(clk), .RN(n26), .Q(
        \memory[4][3] ) );
  DFFRQX1M \memory_reg[4][2]  ( .D(n242), .CK(clk), .RN(n25), .Q(
        \memory[4][2] ) );
  DFFRQX1M \memory_reg[4][1]  ( .D(n241), .CK(clk), .RN(n25), .Q(
        \memory[4][1] ) );
  DFFRQX1M \memory_reg[4][0]  ( .D(n240), .CK(clk), .RN(n25), .Q(
        \memory[4][0] ) );
  DFFRQX1M \memory_reg[5][7]  ( .D(n239), .CK(clk), .RN(n25), .Q(
        \memory[5][7] ) );
  DFFRQX1M \memory_reg[5][6]  ( .D(n238), .CK(clk), .RN(n25), .Q(
        \memory[5][6] ) );
  DFFRQX1M \memory_reg[5][5]  ( .D(n237), .CK(clk), .RN(n25), .Q(
        \memory[5][5] ) );
  DFFRQX1M \memory_reg[5][4]  ( .D(n236), .CK(clk), .RN(n25), .Q(
        \memory[5][4] ) );
  DFFRQX1M \memory_reg[5][3]  ( .D(n235), .CK(clk), .RN(n25), .Q(
        \memory[5][3] ) );
  DFFRQX1M \memory_reg[5][2]  ( .D(n234), .CK(clk), .RN(n25), .Q(
        \memory[5][2] ) );
  DFFRQX1M \memory_reg[5][1]  ( .D(n233), .CK(clk), .RN(n25), .Q(
        \memory[5][1] ) );
  DFFRQX1M \memory_reg[5][0]  ( .D(n232), .CK(clk), .RN(n25), .Q(
        \memory[5][0] ) );
  DFFRQX1M \memory_reg[6][7]  ( .D(n231), .CK(clk), .RN(n25), .Q(
        \memory[6][7] ) );
  DFFRQX1M \memory_reg[6][6]  ( .D(n230), .CK(clk), .RN(n25), .Q(
        \memory[6][6] ) );
  DFFRQX1M \memory_reg[6][5]  ( .D(n229), .CK(clk), .RN(n336), .Q(
        \memory[6][5] ) );
  DFFRQX1M \memory_reg[6][4]  ( .D(n228), .CK(clk), .RN(n26), .Q(
        \memory[6][4] ) );
  DFFRQX1M \memory_reg[6][3]  ( .D(n227), .CK(clk), .RN(n25), .Q(
        \memory[6][3] ) );
  DFFRQX1M \memory_reg[6][2]  ( .D(n226), .CK(clk), .RN(n336), .Q(
        \memory[6][2] ) );
  DFFRQX1M \memory_reg[6][1]  ( .D(n225), .CK(clk), .RN(n26), .Q(
        \memory[6][1] ) );
  DFFRQX1M \memory_reg[6][0]  ( .D(n224), .CK(clk), .RN(n25), .Q(
        \memory[6][0] ) );
  DFFRQX1M \memory_reg[7][7]  ( .D(n223), .CK(clk), .RN(n336), .Q(
        \memory[7][7] ) );
  DFFRQX1M \memory_reg[7][6]  ( .D(n222), .CK(clk), .RN(n26), .Q(
        \memory[7][6] ) );
  DFFRQX1M \memory_reg[7][5]  ( .D(n221), .CK(clk), .RN(n25), .Q(
        \memory[7][5] ) );
  DFFRQX1M \memory_reg[7][4]  ( .D(n220), .CK(clk), .RN(n336), .Q(
        \memory[7][4] ) );
  DFFRQX1M \memory_reg[7][3]  ( .D(n219), .CK(clk), .RN(n26), .Q(
        \memory[7][3] ) );
  DFFRQX1M \memory_reg[7][2]  ( .D(n218), .CK(clk), .RN(n26), .Q(
        \memory[7][2] ) );
  DFFRQX1M \memory_reg[7][1]  ( .D(n217), .CK(clk), .RN(n334), .Q(
        \memory[7][1] ) );
  DFFRQX1M \memory_reg[7][0]  ( .D(n216), .CK(clk), .RN(n26), .Q(
        \memory[7][0] ) );
  DFFRQX1M \memory_reg[8][7]  ( .D(n215), .CK(clk), .RN(n334), .Q(
        \memory[8][7] ) );
  DFFRQX1M \memory_reg[8][6]  ( .D(n214), .CK(clk), .RN(n336), .Q(
        \memory[8][6] ) );
  DFFRQX1M \memory_reg[8][5]  ( .D(n213), .CK(clk), .RN(n335), .Q(
        \memory[8][5] ) );
  DFFRQX1M \memory_reg[8][4]  ( .D(n212), .CK(clk), .RN(n336), .Q(
        \memory[8][4] ) );
  DFFRQX1M \memory_reg[8][3]  ( .D(n211), .CK(clk), .RN(n26), .Q(
        \memory[8][3] ) );
  DFFRQX1M \memory_reg[8][2]  ( .D(n210), .CK(clk), .RN(n334), .Q(
        \memory[8][2] ) );
  DFFRQX1M \memory_reg[8][1]  ( .D(n209), .CK(clk), .RN(n26), .Q(
        \memory[8][1] ) );
  DFFRQX1M \memory_reg[8][0]  ( .D(n208), .CK(clk), .RN(n336), .Q(
        \memory[8][0] ) );
  DFFRQX1M \memory_reg[9][7]  ( .D(n207), .CK(clk), .RN(n336), .Q(
        \memory[9][7] ) );
  DFFRQX1M \memory_reg[9][6]  ( .D(n206), .CK(clk), .RN(n335), .Q(
        \memory[9][6] ) );
  DFFRQX1M \memory_reg[9][5]  ( .D(n205), .CK(clk), .RN(n335), .Q(
        \memory[9][5] ) );
  DFFRQX1M \memory_reg[9][4]  ( .D(n204), .CK(clk), .RN(n335), .Q(
        \memory[9][4] ) );
  DFFRQX1M \memory_reg[9][3]  ( .D(n203), .CK(clk), .RN(n335), .Q(
        \memory[9][3] ) );
  DFFRQX1M \memory_reg[9][2]  ( .D(n202), .CK(clk), .RN(n335), .Q(
        \memory[9][2] ) );
  DFFRQX1M \memory_reg[9][1]  ( .D(n201), .CK(clk), .RN(n335), .Q(
        \memory[9][1] ) );
  DFFRQX1M \memory_reg[9][0]  ( .D(n200), .CK(clk), .RN(n335), .Q(
        \memory[9][0] ) );
  DFFRQX1M \memory_reg[10][7]  ( .D(n199), .CK(clk), .RN(n335), .Q(
        \memory[10][7] ) );
  DFFRQX1M \memory_reg[10][6]  ( .D(n198), .CK(clk), .RN(n335), .Q(
        \memory[10][6] ) );
  DFFRQX1M \memory_reg[10][5]  ( .D(n197), .CK(clk), .RN(n335), .Q(
        \memory[10][5] ) );
  DFFRQX1M \memory_reg[10][4]  ( .D(n196), .CK(clk), .RN(n335), .Q(
        \memory[10][4] ) );
  DFFRQX1M \memory_reg[10][3]  ( .D(n195), .CK(clk), .RN(n335), .Q(
        \memory[10][3] ) );
  DFFRQX1M \memory_reg[10][2]  ( .D(n194), .CK(clk), .RN(n334), .Q(
        \memory[10][2] ) );
  DFFRQX1M \memory_reg[10][1]  ( .D(n193), .CK(clk), .RN(n334), .Q(
        \memory[10][1] ) );
  DFFRQX1M \memory_reg[10][0]  ( .D(n192), .CK(clk), .RN(n334), .Q(
        \memory[10][0] ) );
  DFFRQX1M \memory_reg[11][7]  ( .D(n191), .CK(clk), .RN(n334), .Q(
        \memory[11][7] ) );
  DFFRQX1M \memory_reg[11][6]  ( .D(n190), .CK(clk), .RN(n334), .Q(
        \memory[11][6] ) );
  DFFRQX1M \memory_reg[11][5]  ( .D(n189), .CK(clk), .RN(n334), .Q(
        \memory[11][5] ) );
  DFFRQX1M \memory_reg[11][4]  ( .D(n188), .CK(clk), .RN(n334), .Q(
        \memory[11][4] ) );
  DFFRQX1M \memory_reg[11][3]  ( .D(n187), .CK(clk), .RN(n334), .Q(
        \memory[11][3] ) );
  DFFRQX1M \memory_reg[11][2]  ( .D(n186), .CK(clk), .RN(n334), .Q(
        \memory[11][2] ) );
  DFFRQX1M \memory_reg[11][1]  ( .D(n185), .CK(clk), .RN(n334), .Q(
        \memory[11][1] ) );
  DFFRQX1M \memory_reg[11][0]  ( .D(n184), .CK(clk), .RN(n334), .Q(
        \memory[11][0] ) );
  DFFRQX1M \memory_reg[12][7]  ( .D(n183), .CK(clk), .RN(n334), .Q(
        \memory[12][7] ) );
  DFFRQX1M \memory_reg[12][6]  ( .D(n182), .CK(clk), .RN(n26), .Q(
        \memory[12][6] ) );
  DFFRQX1M \memory_reg[12][5]  ( .D(n181), .CK(clk), .RN(n335), .Q(
        \memory[12][5] ) );
  DFFRQX1M \memory_reg[12][4]  ( .D(n180), .CK(clk), .RN(n334), .Q(
        \memory[12][4] ) );
  DFFRQX1M \memory_reg[12][3]  ( .D(n179), .CK(clk), .RN(n26), .Q(
        \memory[12][3] ) );
  DFFRQX1M \memory_reg[12][2]  ( .D(n178), .CK(clk), .RN(n335), .Q(
        \memory[12][2] ) );
  DFFRQX1M \memory_reg[12][1]  ( .D(n177), .CK(clk), .RN(n336), .Q(
        \memory[12][1] ) );
  DFFRQX1M \memory_reg[12][0]  ( .D(n176), .CK(clk), .RN(n336), .Q(
        \memory[12][0] ) );
  DFFRQX1M \memory_reg[13][7]  ( .D(n175), .CK(clk), .RN(n336), .Q(
        \memory[13][7] ) );
  DFFRQX1M \memory_reg[13][6]  ( .D(n174), .CK(clk), .RN(n334), .Q(
        \memory[13][6] ) );
  DFFRQX1M \memory_reg[13][5]  ( .D(n173), .CK(clk), .RN(n26), .Q(
        \memory[13][5] ) );
  DFFRQX1M \memory_reg[13][4]  ( .D(n172), .CK(clk), .RN(n335), .Q(
        \memory[13][4] ) );
  DFFRQX1M \memory_reg[13][3]  ( .D(n171), .CK(clk), .RN(n26), .Q(
        \memory[13][3] ) );
  DFFRQX1M \memory_reg[13][2]  ( .D(n170), .CK(clk), .RN(n334), .Q(
        \memory[13][2] ) );
  DFFRQX1M \memory_reg[13][1]  ( .D(n169), .CK(clk), .RN(n25), .Q(
        \memory[13][1] ) );
  DFFRQX1M \memory_reg[13][0]  ( .D(n168), .CK(clk), .RN(n25), .Q(
        \memory[13][0] ) );
  DFFRQX1M \memory_reg[14][7]  ( .D(n167), .CK(clk), .RN(n25), .Q(
        \memory[14][7] ) );
  DFFRQX1M \memory_reg[14][6]  ( .D(n166), .CK(clk), .RN(n25), .Q(
        \memory[14][6] ) );
  DFFRQX1M \memory_reg[14][5]  ( .D(n165), .CK(clk), .RN(n25), .Q(
        \memory[14][5] ) );
  DFFRQX1M \memory_reg[14][4]  ( .D(n164), .CK(clk), .RN(n25), .Q(
        \memory[14][4] ) );
  DFFRQX1M \memory_reg[14][3]  ( .D(n163), .CK(clk), .RN(n25), .Q(
        \memory[14][3] ) );
  DFFRQX1M \memory_reg[14][2]  ( .D(n162), .CK(clk), .RN(n25), .Q(
        \memory[14][2] ) );
  DFFRQX1M \memory_reg[14][1]  ( .D(n161), .CK(clk), .RN(n25), .Q(
        \memory[14][1] ) );
  DFFRQX1M \memory_reg[14][0]  ( .D(n160), .CK(clk), .RN(n25), .Q(
        \memory[14][0] ) );
  DFFRQX1M \memory_reg[15][7]  ( .D(n159), .CK(clk), .RN(n25), .Q(
        \memory[15][7] ) );
  DFFRQX1M \memory_reg[15][6]  ( .D(n158), .CK(clk), .RN(n335), .Q(
        \memory[15][6] ) );
  DFFRQX1M \memory_reg[15][5]  ( .D(n157), .CK(clk), .RN(n334), .Q(
        \memory[15][5] ) );
  DFFRQX1M \memory_reg[15][4]  ( .D(n156), .CK(clk), .RN(n335), .Q(
        \memory[15][4] ) );
  DFFRQX1M \memory_reg[15][3]  ( .D(n155), .CK(clk), .RN(n334), .Q(
        \memory[15][3] ) );
  DFFRQX1M \memory_reg[15][2]  ( .D(n154), .CK(clk), .RN(n335), .Q(
        \memory[15][2] ) );
  DFFRQX1M \memory_reg[15][1]  ( .D(n153), .CK(clk), .RN(n334), .Q(
        \memory[15][1] ) );
  DFFRQX1M \memory_reg[15][0]  ( .D(n152), .CK(clk), .RN(n335), .Q(
        \memory[15][0] ) );
  DFFRQX1M \read_data_reg[7]  ( .D(n151), .CK(clk), .RN(n334), .Q(read_data[7]) );
  DFFRQX1M \read_data_reg[6]  ( .D(n150), .CK(clk), .RN(n335), .Q(read_data[6]) );
  DFFRQX1M \read_data_reg[5]  ( .D(n149), .CK(clk), .RN(n334), .Q(read_data[5]) );
  DFFRQX1M \read_data_reg[4]  ( .D(n148), .CK(clk), .RN(n334), .Q(read_data[4]) );
  DFFRQX1M \read_data_reg[3]  ( .D(n147), .CK(clk), .RN(n335), .Q(read_data[3]) );
  DFFRQX1M \read_data_reg[2]  ( .D(n146), .CK(clk), .RN(n334), .Q(read_data[2]) );
  DFFRQX1M \read_data_reg[1]  ( .D(n145), .CK(clk), .RN(n334), .Q(read_data[1]) );
  DFFRQX1M \read_data_reg[0]  ( .D(n144), .CK(clk), .RN(n334), .Q(read_data[0]) );
  DFFRQX4M \memory_reg[1][4]  ( .D(n268), .CK(clk), .RN(n333), .Q(register1[4]) );
  DFFRQX4M \memory_reg[1][5]  ( .D(n269), .CK(clk), .RN(n25), .Q(register1[5])
         );
  DFFRQX4M \memory_reg[1][7]  ( .D(n271), .CK(clk), .RN(n336), .Q(register1[7]) );
  DFFRHQX8M \memory_reg[0][1]  ( .D(n273), .CK(clk), .RN(n26), .Q(register0[1]) );
  DFFSQX4M \memory_reg[2][0]  ( .D(n256), .CK(clk), .SN(n334), .Q(register2[0]) );
  DFFRHQX8M \memory_reg[0][4]  ( .D(n276), .CK(clk), .RN(n336), .Q(
        register0[4]) );
  DFFRHQX8M \memory_reg[0][2]  ( .D(n274), .CK(clk), .RN(n26), .Q(register0[2]) );
  DFFRHQX8M \memory_reg[1][2]  ( .D(n266), .CK(clk), .RN(n333), .Q(
        register1[2]) );
  DFFRHQX8M \memory_reg[0][3]  ( .D(n275), .CK(clk), .RN(n25), .Q(register0[3]) );
  DFFSQX2M \memory_reg[3][3]  ( .D(n251), .CK(clk), .SN(n334), .Q(n343) );
  DFFRQX4M \memory_reg[1][3]  ( .D(n267), .CK(clk), .RN(n333), .Q(register1[3]) );
  DFFRQX1M \memory_reg[3][1]  ( .D(n249), .CK(clk), .RN(n336), .Q(n344) );
  DFFRQX1M \memory_reg[3][4]  ( .D(n252), .CK(clk), .RN(n26), .Q(n342) );
  DFFRQX4M \memory_reg[3][0]  ( .D(n248), .CK(clk), .RN(n336), .Q(register3[0]) );
  DFFRQX2M \memory_reg[0][5]  ( .D(n277), .CK(clk), .RN(n25), .Q(register0[5])
         );
  DFFRQX4M \memory_reg[3][2]  ( .D(n250), .CK(clk), .RN(n26), .Q(register3[2])
         );
  DFFRQX1M \memory_reg[3][5]  ( .D(n253), .CK(clk), .RN(n25), .Q(n341) );
  DFFRQX4M \memory_reg[0][0]  ( .D(n272), .CK(clk), .RN(n25), .Q(register0[0])
         );
  DFFRQX1M \memory_reg[2][1]  ( .D(n257), .CK(clk), .RN(n336), .Q(n340) );
  DFFRQX1M \memory_reg[1][1]  ( .D(n265), .CK(clk), .RN(n26), .Q(n339) );
  DFFRQX1M \memory_reg[0][6]  ( .D(n278), .CK(clk), .RN(n26), .Q(n338) );
  DFFRQX1M \memory_reg[0][7]  ( .D(n279), .CK(clk), .RN(n25), .Q(n337) );
  DFFRQX2M \memory_reg[1][0]  ( .D(n264), .CK(clk), .RN(n333), .Q(register1[0]) );
  DFFRQX4M \memory_reg[1][6]  ( .D(n270), .CK(clk), .RN(n336), .Q(register1[6]) );
  BUFX10M U3 ( .A(n57), .Y(n322) );
  BUFX10M U4 ( .A(n42), .Y(n323) );
  BUFX10M U5 ( .A(n342), .Y(register3[4]) );
  BUFX10M U6 ( .A(n344), .Y(register3[1]) );
  INVX2M U7 ( .A(n33), .Y(register1[1]) );
  AOI22X1M U8 ( .A0(n322), .A1(\memory[15][7] ), .B0(n94), .B1(\memory[14][7] ), .Y(n108) );
  AOI22X1M U9 ( .A0(n322), .A1(\memory[15][6] ), .B0(n94), .B1(\memory[14][6] ), .Y(n119) );
  AOI22X1M U10 ( .A0(n322), .A1(\memory[15][2] ), .B0(n94), .B1(
        \memory[14][2] ), .Y(n130) );
  AOI22X1M U11 ( .A0(n322), .A1(\memory[15][0] ), .B0(n94), .B1(
        \memory[14][0] ), .Y(n141) );
  AOI22X1M U12 ( .A0(n322), .A1(\memory[15][3] ), .B0(n94), .B1(
        \memory[14][3] ), .Y(n288) );
  AOI22X1M U13 ( .A0(n322), .A1(\memory[15][5] ), .B0(n94), .B1(
        \memory[14][5] ), .Y(n299) );
  AOI22X1M U14 ( .A0(n322), .A1(\memory[15][4] ), .B0(n94), .B1(
        \memory[14][4] ), .Y(n310) );
  AOI22X1M U15 ( .A0(n322), .A1(\memory[15][1] ), .B0(n94), .B1(
        \memory[14][1] ), .Y(n321) );
  AOI22X1M U16 ( .A0(n102), .A1(\memory[9][7] ), .B0(n104), .B1(\memory[8][7] ), .Y(n105) );
  AOI22X1M U17 ( .A0(n102), .A1(\memory[9][6] ), .B0(n104), .B1(\memory[8][6] ), .Y(n116) );
  AOI22X1M U18 ( .A0(n102), .A1(\memory[9][2] ), .B0(n104), .B1(\memory[8][2] ), .Y(n127) );
  AOI22X1M U19 ( .A0(n102), .A1(\memory[9][0] ), .B0(n104), .B1(\memory[8][0] ), .Y(n138) );
  AOI22X1M U20 ( .A0(n102), .A1(\memory[9][3] ), .B0(n104), .B1(\memory[8][3] ), .Y(n285) );
  AOI22X1M U21 ( .A0(n102), .A1(\memory[9][5] ), .B0(n104), .B1(\memory[8][5] ), .Y(n296) );
  AOI22X1M U22 ( .A0(n102), .A1(\memory[9][1] ), .B0(n104), .B1(\memory[8][1] ), .Y(n318) );
  AOI22X1M U23 ( .A0(n102), .A1(\memory[9][4] ), .B0(n104), .B1(\memory[8][4] ), .Y(n307) );
  AOI22X1M U24 ( .A0(n96), .A1(\memory[13][4] ), .B0(n98), .B1(\memory[12][4] ), .Y(n309) );
  AOI22X1M U25 ( .A0(n96), .A1(\memory[13][7] ), .B0(n98), .B1(\memory[12][7] ), .Y(n107) );
  AOI22X1M U26 ( .A0(n96), .A1(\memory[13][6] ), .B0(n98), .B1(\memory[12][6] ), .Y(n118) );
  AOI22X1M U27 ( .A0(n96), .A1(\memory[13][2] ), .B0(n98), .B1(\memory[12][2] ), .Y(n129) );
  AOI22X1M U28 ( .A0(n96), .A1(\memory[13][0] ), .B0(n98), .B1(\memory[12][0] ), .Y(n140) );
  AOI22X1M U29 ( .A0(n96), .A1(\memory[13][3] ), .B0(n98), .B1(\memory[12][3] ), .Y(n287) );
  AOI22X1M U30 ( .A0(n96), .A1(\memory[13][5] ), .B0(n98), .B1(\memory[12][5] ), .Y(n298) );
  AOI22X1M U31 ( .A0(n96), .A1(\memory[13][1] ), .B0(n98), .B1(\memory[12][1] ), .Y(n320) );
  AOI22X1M U32 ( .A0(n323), .A1(\memory[11][7] ), .B0(n100), .B1(
        \memory[10][7] ), .Y(n106) );
  AOI22X1M U33 ( .A0(n323), .A1(\memory[11][6] ), .B0(n100), .B1(
        \memory[10][6] ), .Y(n117) );
  AOI22X1M U34 ( .A0(n323), .A1(\memory[11][2] ), .B0(n100), .B1(
        \memory[10][2] ), .Y(n128) );
  AOI22X1M U35 ( .A0(n323), .A1(\memory[11][3] ), .B0(n100), .B1(
        \memory[10][3] ), .Y(n286) );
  AOI22X1M U36 ( .A0(n323), .A1(\memory[11][5] ), .B0(n100), .B1(
        \memory[10][5] ), .Y(n297) );
  AOI22X1M U37 ( .A0(n323), .A1(\memory[11][4] ), .B0(n100), .B1(
        \memory[10][4] ), .Y(n308) );
  AOI22X1M U38 ( .A0(n323), .A1(\memory[11][1] ), .B0(n100), .B1(
        \memory[10][1] ), .Y(n319) );
  AOI22X1M U39 ( .A0(n323), .A1(\memory[11][0] ), .B0(n100), .B1(
        \memory[10][0] ), .Y(n139) );
  AOI22X1M U40 ( .A0(n102), .A1(register1[4]), .B0(n104), .B1(register0[4]), 
        .Y(n311) );
  AOI22X1M U41 ( .A0(n102), .A1(register1[0]), .B0(n104), .B1(register0[0]), 
        .Y(n142) );
  AOI22X1M U42 ( .A0(n102), .A1(register1[2]), .B0(n104), .B1(register0[2]), 
        .Y(n131) );
  AOI22X1M U43 ( .A0(n102), .A1(register1[6]), .B0(n104), .B1(register0[6]), 
        .Y(n120) );
  AOI22X1M U44 ( .A0(n102), .A1(register1[3]), .B0(n104), .B1(register0[3]), 
        .Y(n289) );
  AOI22X1M U45 ( .A0(n102), .A1(register1[5]), .B0(n104), .B1(register0[5]), 
        .Y(n300) );
  AOI22X1M U46 ( .A0(n102), .A1(register1[1]), .B0(n104), .B1(register0[1]), 
        .Y(n324) );
  AOI22X1M U47 ( .A0(n323), .A1(register3[0]), .B0(n100), .B1(register2[0]), 
        .Y(n143) );
  AOI22X1M U48 ( .A0(n323), .A1(n24), .B0(n100), .B1(n18), .Y(n121) );
  AOI22X1M U49 ( .A0(n323), .A1(register3[2]), .B0(n100), .B1(n22), .Y(n132)
         );
  AOI22X1M U50 ( .A0(n323), .A1(register3[3]), .B0(n100), .B1(n21), .Y(n290)
         );
  AOI22X1M U51 ( .A0(n323), .A1(register3[5]), .B0(n100), .B1(n19), .Y(n301)
         );
  AOI22X1M U52 ( .A0(n323), .A1(register3[4]), .B0(n100), .B1(n20), .Y(n312)
         );
  AOI22X1M U53 ( .A0(n323), .A1(register3[1]), .B0(n100), .B1(register2[1]), 
        .Y(n325) );
  AOI22X1M U54 ( .A0(n96), .A1(\memory[5][6] ), .B0(n98), .B1(\memory[4][6] ), 
        .Y(n122) );
  AOI22X1M U55 ( .A0(n96), .A1(\memory[5][2] ), .B0(n98), .B1(\memory[4][2] ), 
        .Y(n133) );
  AOI22X1M U56 ( .A0(n96), .A1(\memory[5][0] ), .B0(n98), .B1(\memory[4][0] ), 
        .Y(n280) );
  AOI22X1M U57 ( .A0(n96), .A1(\memory[5][3] ), .B0(n98), .B1(\memory[4][3] ), 
        .Y(n291) );
  AOI22X1M U58 ( .A0(n96), .A1(\memory[5][5] ), .B0(n98), .B1(\memory[4][5] ), 
        .Y(n302) );
  AOI22X1M U59 ( .A0(n96), .A1(\memory[5][4] ), .B0(n98), .B1(\memory[4][4] ), 
        .Y(n313) );
  AOI22X1M U60 ( .A0(n96), .A1(\memory[5][1] ), .B0(n98), .B1(\memory[4][1] ), 
        .Y(n326) );
  AOI22X1M U61 ( .A0(n322), .A1(\memory[7][6] ), .B0(n94), .B1(\memory[6][6] ), 
        .Y(n123) );
  AOI22X1M U62 ( .A0(n322), .A1(\memory[7][2] ), .B0(n94), .B1(\memory[6][2] ), 
        .Y(n134) );
  AOI22X1M U63 ( .A0(n322), .A1(\memory[7][0] ), .B0(n94), .B1(\memory[6][0] ), 
        .Y(n281) );
  AOI22X1M U64 ( .A0(n322), .A1(\memory[7][3] ), .B0(n94), .B1(\memory[6][3] ), 
        .Y(n292) );
  AOI22X1M U65 ( .A0(n322), .A1(\memory[7][5] ), .B0(n94), .B1(\memory[6][5] ), 
        .Y(n303) );
  AOI22X1M U66 ( .A0(n322), .A1(\memory[7][4] ), .B0(n94), .B1(\memory[6][4] ), 
        .Y(n314) );
  AOI22X1M U67 ( .A0(n102), .A1(register1[7]), .B0(n104), .B1(register0[7]), 
        .Y(n109) );
  AOI22X1M U68 ( .A0(n96), .A1(\memory[5][7] ), .B0(n98), .B1(\memory[4][7] ), 
        .Y(n111) );
  AOI22X1M U69 ( .A0(n323), .A1(n23), .B0(n100), .B1(n17), .Y(n110) );
  NAND4X2M U70 ( .A(n112), .B(n111), .C(n110), .D(n109), .Y(n113) );
  AOI22X1M U71 ( .A0(n322), .A1(\memory[7][7] ), .B0(n94), .B1(\memory[6][7] ), 
        .Y(n112) );
  AOI22X1M U72 ( .A0(n322), .A1(\memory[7][1] ), .B0(n94), .B1(\memory[6][1] ), 
        .Y(n327) );
  BUFX18M U73 ( .A(n26), .Y(n25) );
  CLKBUFX12M U74 ( .A(reset_n), .Y(n336) );
  INVX2M U75 ( .A(n339), .Y(n33) );
  INVX2M U76 ( .A(n338), .Y(n31) );
  INVX2M U77 ( .A(n337), .Y(n29) );
  INVX2M U78 ( .A(n323), .Y(n51) );
  INVX2M U79 ( .A(n322), .Y(n60) );
  INVX8M U80 ( .A(n97), .Y(n98) );
  CLKINVX1M U81 ( .A(n91), .Y(N61) );
  BUFX14M U82 ( .A(n336), .Y(n334) );
  CLKBUFX12M U83 ( .A(n336), .Y(n26) );
  OAI21X1M U84 ( .A0(n295), .A1(n331), .B0(n294), .Y(n147) );
  OAI21X1M U85 ( .A0(n332), .A1(n331), .B0(n330), .Y(n145) );
  OAI21X1M U86 ( .A0(n284), .A1(n331), .B0(n283), .Y(n144) );
  OAI21X1M U87 ( .A0(n306), .A1(n331), .B0(n305), .Y(n149) );
  OAI21X1M U88 ( .A0(n137), .A1(n331), .B0(n136), .Y(n146) );
  OAI21X1M U89 ( .A0(n317), .A1(n331), .B0(n316), .Y(n148) );
  OAI21X1M U90 ( .A0(n126), .A1(n331), .B0(n125), .Y(n150) );
  OAI21X1M U91 ( .A0(n115), .A1(n331), .B0(n114), .Y(n151) );
  AOI2BB2X1M U92 ( .B0(n65), .B1(n44), .A0N(register3[3]), .A1N(n65), .Y(n251)
         );
  AOI2BB2X1M U93 ( .B0(n55), .B1(n45), .A0N(\memory[11][7] ), .A1N(n55), .Y(
        n191) );
  AOI2BB2X1M U94 ( .B0(n65), .B1(n49), .A0N(register3[1]), .A1N(n65), .Y(n249)
         );
  AOI2BB2X1M U95 ( .B0(n62), .B1(n54), .A0N(\memory[15][5] ), .A1N(n62), .Y(
        n157) );
  AOI2BB2X1M U96 ( .B0(n55), .B1(n46), .A0N(\memory[11][6] ), .A1N(n55), .Y(
        n190) );
  AOI2BB2X1M U97 ( .B0(n62), .B1(n45), .A0N(\memory[15][7] ), .A1N(n62), .Y(
        n159) );
  AOI2BB2X1M U98 ( .B0(n62), .B1(n49), .A0N(\memory[15][1] ), .A1N(n62), .Y(
        n153) );
  AOI2BB2X1M U99 ( .B0(n65), .B1(n47), .A0N(register3[0]), .A1N(n65), .Y(n248)
         );
  AOI2BB2X1M U100 ( .B0(n62), .B1(n53), .A0N(\memory[15][2] ), .A1N(n62), .Y(
        n154) );
  AOI2BB2X1M U101 ( .B0(n59), .B1(n47), .A0N(\memory[7][0] ), .A1N(n59), .Y(
        n216) );
  AOI2BB2X1M U102 ( .B0(n62), .B1(n46), .A0N(\memory[15][6] ), .A1N(n62), .Y(
        n158) );
  AOI2BB2X1M U103 ( .B0(n62), .B1(n47), .A0N(\memory[15][0] ), .A1N(n62), .Y(
        n152) );
  AOI2BB2X1M U104 ( .B0(n55), .B1(n44), .A0N(\memory[11][3] ), .A1N(n55), .Y(
        n187) );
  AOI2BB2X1M U105 ( .B0(n62), .B1(n48), .A0N(\memory[15][4] ), .A1N(n62), .Y(
        n156) );
  AOI2BB2X1M U106 ( .B0(n62), .B1(n44), .A0N(\memory[15][3] ), .A1N(n62), .Y(
        n155) );
  AOI2BB2X1M U107 ( .B0(n55), .B1(n53), .A0N(\memory[11][2] ), .A1N(n55), .Y(
        n186) );
  AOI2BB2X1M U108 ( .B0(n55), .B1(n54), .A0N(\memory[11][5] ), .A1N(n55), .Y(
        n189) );
  AOI2BB2X1M U109 ( .B0(n59), .B1(n53), .A0N(\memory[7][2] ), .A1N(n59), .Y(
        n218) );
  AOI2BB2X1M U110 ( .B0(n65), .B1(n53), .A0N(register3[2]), .A1N(n65), .Y(n250) );
  AOI2BB2X1M U111 ( .B0(n55), .B1(n49), .A0N(\memory[11][1] ), .A1N(n55), .Y(
        n185) );
  AOI2BB2X1M U112 ( .B0(n65), .B1(n48), .A0N(register3[4]), .A1N(n65), .Y(n252) );
  AOI2BB2X1M U113 ( .B0(n59), .B1(n45), .A0N(\memory[7][7] ), .A1N(n59), .Y(
        n223) );
  AOI2BB2X1M U114 ( .B0(n59), .B1(n44), .A0N(\memory[7][3] ), .A1N(n59), .Y(
        n219) );
  AOI2BB2X1M U115 ( .B0(n55), .B1(n47), .A0N(\memory[11][0] ), .A1N(n55), .Y(
        n184) );
  AOI2BB2X1M U116 ( .B0(n65), .B1(n45), .A0N(n23), .A1N(n65), .Y(n255) );
  AOI2BB2X1M U117 ( .B0(n59), .B1(n48), .A0N(\memory[7][4] ), .A1N(n59), .Y(
        n220) );
  AOI2BB2X1M U118 ( .B0(n59), .B1(n54), .A0N(\memory[7][5] ), .A1N(n59), .Y(
        n221) );
  AOI2BB2X1M U119 ( .B0(n65), .B1(n54), .A0N(register3[5]), .A1N(n65), .Y(n253) );
  AOI2BB2X1M U120 ( .B0(n59), .B1(n46), .A0N(\memory[7][6] ), .A1N(n59), .Y(
        n222) );
  AOI2BB2X1M U121 ( .B0(n65), .B1(n46), .A0N(n24), .A1N(n65), .Y(n254) );
  AOI2BB2X1M U122 ( .B0(n59), .B1(n49), .A0N(\memory[7][1] ), .A1N(n59), .Y(
        n217) );
  AOI2BB2X1M U123 ( .B0(n55), .B1(n48), .A0N(\memory[11][4] ), .A1N(n55), .Y(
        n188) );
  INVX8M U124 ( .A(n103), .Y(n104) );
  INVX8M U125 ( .A(n99), .Y(n100) );
  INVX8M U126 ( .A(n93), .Y(n94) );
  INVX8M U127 ( .A(n101), .Y(n102) );
  INVX8M U128 ( .A(n95), .Y(n96) );
  NAND2X1M U129 ( .A(address[1]), .B(address[0]), .Y(n41) );
  INVX8M U130 ( .A(write_data[0]), .Y(n47) );
  INVX8M U131 ( .A(write_data[4]), .Y(n48) );
  INVX8M U132 ( .A(write_data[2]), .Y(n53) );
  INVX8M U133 ( .A(write_data[7]), .Y(n45) );
  INVX8M U134 ( .A(write_data[1]), .Y(n49) );
  INVX8M U135 ( .A(write_data[6]), .Y(n46) );
  INVX8M U136 ( .A(write_data[3]), .Y(n44) );
  INVX8M U137 ( .A(write_data[5]), .Y(n54) );
  NAND2X6M U138 ( .A(write_en), .B(read_en), .Y(n91) );
  CLKBUFX12M U139 ( .A(n336), .Y(n335) );
  INVX10M U140 ( .A(n27), .Y(register3[3]) );
  AND4XLM U141 ( .A(n108), .B(n107), .C(n106), .D(n105), .Y(n115) );
  AND4XLM U142 ( .A(n119), .B(n118), .C(n117), .D(n116), .Y(n126) );
  AND4XLM U143 ( .A(n130), .B(n129), .C(n128), .D(n127), .Y(n137) );
  AND4XLM U144 ( .A(n141), .B(n140), .C(n139), .D(n138), .Y(n284) );
  AND4XLM U145 ( .A(n288), .B(n287), .C(n286), .D(n285), .Y(n295) );
  AND4XLM U146 ( .A(n299), .B(n298), .C(n297), .D(n296), .Y(n306) );
  AND4XLM U147 ( .A(n321), .B(n320), .C(n319), .D(n318), .Y(n332) );
  INVX4M U148 ( .A(address[0]), .Y(n78) );
  INVX4M U149 ( .A(address[1]), .Y(n79) );
  AOI2BB2X1M U150 ( .B0(n67), .B1(n44), .A0N(\memory[5][3] ), .A1N(n67), .Y(
        n235) );
  AOI2BB2X1M U151 ( .B0(n69), .B1(n44), .A0N(\memory[4][3] ), .A1N(n69), .Y(
        n243) );
  AOI2BB2X1M U152 ( .B0(n85), .B1(n44), .A0N(\memory[10][3] ), .A1N(n85), .Y(
        n195) );
  AOI2BB2X1M U153 ( .B0(n86), .B1(n44), .A0N(\memory[9][3] ), .A1N(n86), .Y(
        n203) );
  AOI2BB2X1M U154 ( .B0(n86), .B1(n54), .A0N(\memory[9][5] ), .A1N(n86), .Y(
        n205) );
  AOI2BB2X1M U155 ( .B0(n90), .B1(n54), .A0N(register0[5]), .A1N(n90), .Y(n277) );
  AOI2BB2X1M U156 ( .B0(n67), .B1(n45), .A0N(\memory[5][7] ), .A1N(n67), .Y(
        n239) );
  AOI2BB2X1M U157 ( .B0(n73), .B1(n45), .A0N(\memory[12][7] ), .A1N(n73), .Y(
        n183) );
  AOI2BB2X1M U158 ( .B0(n64), .B1(n46), .A0N(\memory[6][6] ), .A1N(n64), .Y(
        n230) );
  AOI2BB2X1M U159 ( .B0(n73), .B1(n46), .A0N(\memory[12][6] ), .A1N(n73), .Y(
        n182) );
  AOI2BB2X1M U160 ( .B0(n89), .B1(n46), .A0N(n18), .A1N(n89), .Y(n262) );
  AOI2BB2X1M U161 ( .B0(n92), .B1(n46), .A0N(register1[6]), .A1N(n92), .Y(n270) );
  AOI2BB2X1M U162 ( .B0(n76), .B1(n48), .A0N(\memory[14][4] ), .A1N(n76), .Y(
        n164) );
  AOI2BB2X1M U163 ( .B0(n81), .B1(n48), .A0N(\memory[8][4] ), .A1N(n81), .Y(
        n212) );
  AOI2BB2X1M U164 ( .B0(n85), .B1(n48), .A0N(\memory[10][4] ), .A1N(n85), .Y(
        n196) );
  AOI2BB2X1M U165 ( .B0(n69), .B1(n47), .A0N(\memory[4][0] ), .A1N(n69), .Y(
        n240) );
  AOI2BB2X1M U166 ( .B0(n81), .B1(n47), .A0N(\memory[8][0] ), .A1N(n81), .Y(
        n208) );
  AOI2BB2X1M U167 ( .B0(n64), .B1(n49), .A0N(\memory[6][1] ), .A1N(n64), .Y(
        n225) );
  AOI2BB2X1M U168 ( .B0(n75), .B1(n49), .A0N(\memory[13][1] ), .A1N(n75), .Y(
        n169) );
  AOI2BB2X1M U169 ( .B0(n75), .B1(n53), .A0N(\memory[13][2] ), .A1N(n75), .Y(
        n170) );
  AOI2BB2X1M U170 ( .B0(n76), .B1(n53), .A0N(\memory[14][2] ), .A1N(n76), .Y(
        n162) );
  CLKINVX1M U171 ( .A(n343), .Y(n27) );
  INVX2M U172 ( .A(n29), .Y(register0[7]) );
  AOI2BB2X1M U173 ( .B0(n90), .B1(n53), .A0N(register0[2]), .A1N(n90), .Y(n274) );
  AOI2BB2X1M U174 ( .B0(n89), .B1(n47), .A0N(register2[0]), .A1N(n89), .Y(n256) );
  INVX2M U175 ( .A(n31), .Y(register0[6]) );
  CLKINVX1M U176 ( .A(n340), .Y(n35) );
  CLKINVX2M U177 ( .A(n35), .Y(register2[1]) );
  CLKINVX1M U178 ( .A(n341), .Y(n37) );
  INVX6M U179 ( .A(n37), .Y(register3[5]) );
  BUFX8M U180 ( .A(n43), .Y(n65) );
  BUFX8M U181 ( .A(n58), .Y(n59) );
  BUFX8M U182 ( .A(n52), .Y(n55) );
  BUFX8M U183 ( .A(n61), .Y(n62) );
  AOI2BB2X1M U184 ( .B0(n90), .B1(n47), .A0N(register0[0]), .A1N(n90), .Y(n272) );
  AOI2BB2X1M U185 ( .B0(n90), .B1(n46), .A0N(register0[6]), .A1N(n90), .Y(n278) );
  AOI2BB2X1M U186 ( .B0(n90), .B1(n44), .A0N(register0[3]), .A1N(n90), .Y(n275) );
  AOI2BB2X1M U187 ( .B0(n90), .B1(n48), .A0N(register0[4]), .A1N(n90), .Y(n276) );
  AOI2BB2X1M U188 ( .B0(n90), .B1(n45), .A0N(register0[7]), .A1N(n90), .Y(n279) );
  AOI2BB2X1M U189 ( .B0(n90), .B1(n49), .A0N(register0[1]), .A1N(n90), .Y(n273) );
  BUFX8M U190 ( .A(n88), .Y(n90) );
  AOI2BB2X1M U191 ( .B0(n89), .B1(n49), .A0N(register2[1]), .A1N(n89), .Y(n257) );
  AOI2BB2X1M U192 ( .B0(n89), .B1(n48), .A0N(n20), .A1N(n89), .Y(n260) );
  AOI2BB2X1M U193 ( .B0(n89), .B1(n44), .A0N(n21), .A1N(n89), .Y(n259) );
  AOI2BB2X1M U194 ( .B0(n89), .B1(n53), .A0N(n22), .A1N(n89), .Y(n258) );
  AOI2BB2X1M U195 ( .B0(n89), .B1(n54), .A0N(n19), .A1N(n89), .Y(n261) );
  AOI2BB2X1M U196 ( .B0(n89), .B1(n45), .A0N(n17), .A1N(n89), .Y(n263) );
  BUFX8M U197 ( .A(n70), .Y(n89) );
  AOI2BB2X1M U198 ( .B0(n69), .B1(n49), .A0N(\memory[4][1] ), .A1N(n69), .Y(
        n241) );
  AOI2BB2X1M U199 ( .B0(n69), .B1(n54), .A0N(\memory[4][5] ), .A1N(n69), .Y(
        n245) );
  AOI2BB2X1M U200 ( .B0(n69), .B1(n46), .A0N(\memory[4][6] ), .A1N(n69), .Y(
        n246) );
  AOI2BB2X1M U201 ( .B0(n69), .B1(n53), .A0N(\memory[4][2] ), .A1N(n69), .Y(
        n242) );
  AOI2BB2X1M U202 ( .B0(n69), .B1(n48), .A0N(\memory[4][4] ), .A1N(n69), .Y(
        n244) );
  AOI2BB2X1M U203 ( .B0(n69), .B1(n45), .A0N(\memory[4][7] ), .A1N(n69), .Y(
        n247) );
  BUFX8M U204 ( .A(n68), .Y(n69) );
  AOI2BB2X1M U205 ( .B0(n67), .B1(n48), .A0N(\memory[5][4] ), .A1N(n67), .Y(
        n236) );
  AOI2BB2X1M U206 ( .B0(n67), .B1(n53), .A0N(\memory[5][2] ), .A1N(n67), .Y(
        n234) );
  AOI2BB2X1M U207 ( .B0(n67), .B1(n46), .A0N(\memory[5][6] ), .A1N(n67), .Y(
        n238) );
  AOI2BB2X1M U208 ( .B0(n67), .B1(n47), .A0N(\memory[5][0] ), .A1N(n67), .Y(
        n232) );
  AOI2BB2X1M U209 ( .B0(n67), .B1(n54), .A0N(\memory[5][5] ), .A1N(n67), .Y(
        n237) );
  AOI2BB2X1M U210 ( .B0(n67), .B1(n49), .A0N(\memory[5][1] ), .A1N(n67), .Y(
        n233) );
  BUFX8M U211 ( .A(n66), .Y(n67) );
  AOI2BB2X1M U212 ( .B0(n64), .B1(n47), .A0N(\memory[6][0] ), .A1N(n64), .Y(
        n224) );
  AOI2BB2X1M U213 ( .B0(n64), .B1(n53), .A0N(\memory[6][2] ), .A1N(n64), .Y(
        n226) );
  AOI2BB2X1M U214 ( .B0(n64), .B1(n45), .A0N(\memory[6][7] ), .A1N(n64), .Y(
        n231) );
  AOI2BB2X1M U215 ( .B0(n64), .B1(n48), .A0N(\memory[6][4] ), .A1N(n64), .Y(
        n228) );
  AOI2BB2X1M U216 ( .B0(n64), .B1(n54), .A0N(\memory[6][5] ), .A1N(n64), .Y(
        n229) );
  AOI2BB2X1M U217 ( .B0(n64), .B1(n44), .A0N(\memory[6][3] ), .A1N(n64), .Y(
        n227) );
  BUFX8M U218 ( .A(n63), .Y(n64) );
  AOI2BB2X1M U219 ( .B0(n81), .B1(n44), .A0N(\memory[8][3] ), .A1N(n81), .Y(
        n211) );
  AOI2BB2X1M U220 ( .B0(n81), .B1(n53), .A0N(\memory[8][2] ), .A1N(n81), .Y(
        n210) );
  AOI2BB2X1M U221 ( .B0(n81), .B1(n49), .A0N(\memory[8][1] ), .A1N(n81), .Y(
        n209) );
  AOI2BB2X1M U222 ( .B0(n81), .B1(n46), .A0N(\memory[8][6] ), .A1N(n81), .Y(
        n214) );
  AOI2BB2X1M U223 ( .B0(n81), .B1(n45), .A0N(\memory[8][7] ), .A1N(n81), .Y(
        n215) );
  AOI2BB2X1M U224 ( .B0(n81), .B1(n54), .A0N(\memory[8][5] ), .A1N(n81), .Y(
        n213) );
  BUFX8M U225 ( .A(n80), .Y(n81) );
  AOI2BB2X1M U226 ( .B0(n85), .B1(n54), .A0N(\memory[10][5] ), .A1N(n85), .Y(
        n197) );
  AOI2BB2X1M U227 ( .B0(n85), .B1(n46), .A0N(\memory[10][6] ), .A1N(n85), .Y(
        n198) );
  AOI2BB2X1M U228 ( .B0(n85), .B1(n45), .A0N(\memory[10][7] ), .A1N(n85), .Y(
        n199) );
  AOI2BB2X1M U229 ( .B0(n85), .B1(n47), .A0N(\memory[10][0] ), .A1N(n85), .Y(
        n192) );
  AOI2BB2X1M U230 ( .B0(n85), .B1(n49), .A0N(\memory[10][1] ), .A1N(n85), .Y(
        n193) );
  AOI2BB2X1M U231 ( .B0(n85), .B1(n53), .A0N(\memory[10][2] ), .A1N(n85), .Y(
        n194) );
  BUFX8M U232 ( .A(n84), .Y(n85) );
  AOI2BB2X1M U233 ( .B0(n86), .B1(n48), .A0N(\memory[9][4] ), .A1N(n86), .Y(
        n204) );
  AOI2BB2X1M U234 ( .B0(n86), .B1(n47), .A0N(\memory[9][0] ), .A1N(n86), .Y(
        n200) );
  AOI2BB2X1M U235 ( .B0(n86), .B1(n53), .A0N(\memory[9][2] ), .A1N(n86), .Y(
        n202) );
  AOI2BB2X1M U236 ( .B0(n86), .B1(n49), .A0N(\memory[9][1] ), .A1N(n86), .Y(
        n201) );
  AOI2BB2X1M U237 ( .B0(n86), .B1(n46), .A0N(\memory[9][6] ), .A1N(n86), .Y(
        n206) );
  AOI2BB2X1M U238 ( .B0(n86), .B1(n45), .A0N(\memory[9][7] ), .A1N(n86), .Y(
        n207) );
  BUFX8M U239 ( .A(n82), .Y(n86) );
  AOI2BB2X1M U240 ( .B0(n73), .B1(n47), .A0N(\memory[12][0] ), .A1N(n73), .Y(
        n176) );
  AOI2BB2X1M U241 ( .B0(n73), .B1(n49), .A0N(\memory[12][1] ), .A1N(n73), .Y(
        n177) );
  AOI2BB2X1M U242 ( .B0(n73), .B1(n53), .A0N(\memory[12][2] ), .A1N(n73), .Y(
        n178) );
  AOI2BB2X1M U243 ( .B0(n73), .B1(n44), .A0N(\memory[12][3] ), .A1N(n73), .Y(
        n179) );
  AOI2BB2X1M U244 ( .B0(n73), .B1(n48), .A0N(\memory[12][4] ), .A1N(n73), .Y(
        n180) );
  AOI2BB2X1M U245 ( .B0(n73), .B1(n54), .A0N(\memory[12][5] ), .A1N(n73), .Y(
        n181) );
  BUFX8M U246 ( .A(n72), .Y(n73) );
  AOI2BB2X1M U247 ( .B0(n75), .B1(n45), .A0N(\memory[13][7] ), .A1N(n75), .Y(
        n175) );
  AOI2BB2X1M U248 ( .B0(n75), .B1(n46), .A0N(\memory[13][6] ), .A1N(n75), .Y(
        n174) );
  AOI2BB2X1M U249 ( .B0(n75), .B1(n47), .A0N(\memory[13][0] ), .A1N(n75), .Y(
        n168) );
  AOI2BB2X1M U250 ( .B0(n75), .B1(n54), .A0N(\memory[13][5] ), .A1N(n75), .Y(
        n173) );
  AOI2BB2X1M U251 ( .B0(n75), .B1(n48), .A0N(\memory[13][4] ), .A1N(n75), .Y(
        n172) );
  AOI2BB2X1M U252 ( .B0(n75), .B1(n44), .A0N(\memory[13][3] ), .A1N(n75), .Y(
        n171) );
  BUFX8M U253 ( .A(n71), .Y(n75) );
  AOI2BB2X1M U254 ( .B0(n76), .B1(n54), .A0N(\memory[14][5] ), .A1N(n76), .Y(
        n165) );
  AOI2BB2X1M U255 ( .B0(n76), .B1(n45), .A0N(\memory[14][7] ), .A1N(n76), .Y(
        n167) );
  AOI2BB2X1M U256 ( .B0(n76), .B1(n47), .A0N(\memory[14][0] ), .A1N(n76), .Y(
        n160) );
  AOI2BB2X1M U257 ( .B0(n76), .B1(n49), .A0N(\memory[14][1] ), .A1N(n76), .Y(
        n161) );
  AOI2BB2X1M U258 ( .B0(n76), .B1(n46), .A0N(\memory[14][6] ), .A1N(n76), .Y(
        n166) );
  AOI2BB2X1M U259 ( .B0(n76), .B1(n44), .A0N(\memory[14][3] ), .A1N(n76), .Y(
        n163) );
  BUFX8M U260 ( .A(n74), .Y(n76) );
  AOI2BB2X1M U261 ( .B0(n92), .B1(n53), .A0N(register1[2]), .A1N(n92), .Y(n266) );
  AOI2BB2X1M U262 ( .B0(n92), .B1(n49), .A0N(register1[1]), .A1N(n92), .Y(n265) );
  AOI2BB2X1M U263 ( .B0(n92), .B1(n47), .A0N(register1[0]), .A1N(n92), .Y(n264) );
  AOI2BB2X1M U264 ( .B0(n92), .B1(n48), .A0N(register1[4]), .A1N(n92), .Y(n268) );
  AOI2BB2X1M U265 ( .B0(n92), .B1(n54), .A0N(register1[5]), .A1N(n92), .Y(n269) );
  AOI2BB2X1M U266 ( .B0(n92), .B1(n45), .A0N(register1[7]), .A1N(n92), .Y(n271) );
  BUFX8M U267 ( .A(n56), .Y(n92) );
  NOR2X8M U268 ( .A(address[3]), .B(n91), .Y(n329) );
  AND4XLM U269 ( .A(n310), .B(n309), .C(n308), .D(n307), .Y(n317) );
  NOR2X2M U270 ( .A(address[2]), .B(n41), .Y(n42) );
  OR3X4M U271 ( .A(write_en), .B(read_en), .C(address[3]), .Y(n87) );
  NOR2X2M U272 ( .A(n51), .B(n87), .Y(n43) );
  NOR2X2M U273 ( .A(write_en), .B(read_en), .Y(n50) );
  NAND2X4M U274 ( .A(address[3]), .B(n50), .Y(n83) );
  NOR2X2M U275 ( .A(n51), .B(n83), .Y(n52) );
  INVX2M U276 ( .A(address[2]), .Y(n77) );
  NAND3X2M U277 ( .A(n79), .B(n77), .C(address[0]), .Y(n101) );
  NOR2X1M U278 ( .A(n101), .B(n87), .Y(n56) );
  NOR3X2M U279 ( .A(n79), .B(n78), .C(n77), .Y(n57) );
  NOR2X2M U280 ( .A(n60), .B(n87), .Y(n58) );
  NOR2X2M U281 ( .A(n60), .B(n83), .Y(n61) );
  NAND3X2M U282 ( .A(n78), .B(address[1]), .C(address[2]), .Y(n93) );
  NOR2X1M U283 ( .A(n93), .B(n87), .Y(n63) );
  NAND3X2M U284 ( .A(n79), .B(address[0]), .C(address[2]), .Y(n95) );
  NOR2X1M U285 ( .A(n95), .B(n87), .Y(n66) );
  NAND3X2M U286 ( .A(n79), .B(n78), .C(address[2]), .Y(n97) );
  NOR2X1M U287 ( .A(n97), .B(n87), .Y(n68) );
  NAND3X2M U288 ( .A(n78), .B(n77), .C(address[1]), .Y(n99) );
  NOR2X1M U289 ( .A(n99), .B(n87), .Y(n70) );
  NOR2X1M U290 ( .A(n95), .B(n83), .Y(n71) );
  NOR2X1M U291 ( .A(n97), .B(n83), .Y(n72) );
  NOR2X1M U292 ( .A(n93), .B(n83), .Y(n74) );
  NAND3X2M U293 ( .A(n79), .B(n78), .C(n77), .Y(n103) );
  NOR2X1M U294 ( .A(n103), .B(n83), .Y(n80) );
  NOR2X1M U295 ( .A(n101), .B(n83), .Y(n82) );
  NOR2X1M U296 ( .A(n99), .B(n83), .Y(n84) );
  NOR2X1M U297 ( .A(n103), .B(n87), .Y(n88) );
  BUFX5M U298 ( .A(n336), .Y(n333) );
  AOI2BB2X1M U299 ( .B0(n92), .B1(n44), .A0N(register1[3]), .A1N(n92), .Y(n267) );
  NAND2X4M U300 ( .A(N61), .B(address[3]), .Y(n331) );
  AOI22X1M U301 ( .A0(n329), .A1(n113), .B0(read_data[7]), .B1(n91), .Y(n114)
         );
  NAND4X1M U302 ( .A(n123), .B(n122), .C(n121), .D(n120), .Y(n124) );
  AOI22X1M U303 ( .A0(n329), .A1(n124), .B0(read_data[6]), .B1(n91), .Y(n125)
         );
  NAND4X1M U304 ( .A(n134), .B(n133), .C(n132), .D(n131), .Y(n135) );
  AOI22X1M U305 ( .A0(n329), .A1(n135), .B0(read_data[2]), .B1(n91), .Y(n136)
         );
  NAND4X1M U306 ( .A(n281), .B(n280), .C(n143), .D(n142), .Y(n282) );
  AOI22X1M U307 ( .A0(n329), .A1(n282), .B0(read_data[0]), .B1(n91), .Y(n283)
         );
  NAND4X1M U308 ( .A(n292), .B(n291), .C(n290), .D(n289), .Y(n293) );
  AOI22X1M U309 ( .A0(n329), .A1(n293), .B0(read_data[3]), .B1(n91), .Y(n294)
         );
  NAND4X1M U310 ( .A(n303), .B(n302), .C(n301), .D(n300), .Y(n304) );
  AOI22X1M U311 ( .A0(n329), .A1(n304), .B0(read_data[5]), .B1(n91), .Y(n305)
         );
  NAND4X1M U312 ( .A(n314), .B(n313), .C(n312), .D(n311), .Y(n315) );
  AOI22X1M U313 ( .A0(n329), .A1(n315), .B0(read_data[4]), .B1(n91), .Y(n316)
         );
  NAND4X1M U314 ( .A(n327), .B(n326), .C(n325), .D(n324), .Y(n328) );
  AOI22X1M U315 ( .A0(n329), .A1(n328), .B0(read_data[1]), .B1(n91), .Y(n330)
         );
endmodule


module register_7 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module register_6 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX2M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module bus_synchronizer_3 ( clk, reset_n, asynchronous_data, synchronous_data
 );
  input [0:0] asynchronous_data;
  output [0:0] synchronous_data;
  input clk, reset_n;
  wire   \output_ports[0][0] , n1;

  register_7 reg_inst_0 ( .clk(clk), .reset_n(n1), .D(asynchronous_data[0]), 
        .Q(\output_ports[0][0] ) );
  register_6 \genblk1[1].reg_inst  ( .clk(clk), .reset_n(n1), .D(
        \output_ports[0][0] ), .Q(synchronous_data[0]) );
  CLKBUFX1M U1 ( .A(reset_n), .Y(n1) );
endmodule


module register_4 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX2M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module register_5 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module bus_synchronizer_2 ( clk, reset_n, asynchronous_data, synchronous_data
 );
  input [0:0] asynchronous_data;
  output [0:0] synchronous_data;
  input clk, reset_n;
  wire   \output_ports[0][0] , n1;

  register_5 reg_inst_0 ( .clk(clk), .reset_n(n1), .D(asynchronous_data[0]), 
        .Q(\output_ports[0][0] ) );
  register_4 \genblk1[1].reg_inst  ( .clk(clk), .reset_n(n1), .D(
        \output_ports[0][0] ), .Q(synchronous_data[0]) );
  CLKBUFX1M U1 ( .A(reset_n), .Y(n1) );
endmodule


module register_2 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module register_3 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module bus_synchronizer_1 ( clk, reset_n, asynchronous_data, synchronous_data
 );
  input [0:0] asynchronous_data;
  output [0:0] synchronous_data;
  input clk, reset_n;
  wire   \output_ports[0][0] , n1;

  register_3 reg_inst_0 ( .clk(clk), .reset_n(n1), .D(asynchronous_data[0]), 
        .Q(\output_ports[0][0] ) );
  register_2 \genblk1[1].reg_inst  ( .clk(clk), .reset_n(n1), .D(
        \output_ports[0][0] ), .Q(synchronous_data[0]) );
  CLKBUFX1M U1 ( .A(reset_n), .Y(n1) );
endmodule


module data_synchronizer_1 ( clk, reset_n, asynchronous_data_valid, 
        asynchronous_data, Q_pulse_generator, synchronous_data_valid, 
        synchronous_data );
  input [7:0] asynchronous_data;
  output [7:0] synchronous_data;
  input clk, reset_n, asynchronous_data_valid;
  output Q_pulse_generator, synchronous_data_valid;
  wire   n1, n20, n21, n22, synchronized_enable, n3, n4, n5, n6, n7, n8, n9,
         n10, n2, n12, n14, n16, n17, n18, n19;

  bus_synchronizer_1 U_bus_synchronizer ( .clk(clk), .reset_n(n19), 
        .asynchronous_data(asynchronous_data_valid), .synchronous_data(
        synchronized_enable) );
  DFFRQX1M Q_pulse_generator_reg ( .D(synchronized_enable), .CK(clk), .RN(n19), 
        .Q(n1) );
  DFFRQX1M \synchronous_data_reg[4]  ( .D(n7), .CK(clk), .RN(n19), .Q(
        synchronous_data[4]) );
  DFFRHQX4M synchronous_data_valid_reg ( .D(n18), .CK(clk), .RN(n19), .Q(
        synchronous_data_valid) );
  DFFRHQX2M \synchronous_data_reg[7]  ( .D(n10), .CK(clk), .RN(n19), .Q(
        synchronous_data[7]) );
  DFFRQX2M \synchronous_data_reg[2]  ( .D(n5), .CK(clk), .RN(n19), .Q(n21) );
  DFFRQX2M \synchronous_data_reg[1]  ( .D(n4), .CK(clk), .RN(n19), .Q(n22) );
  DFFRQX2M \synchronous_data_reg[3]  ( .D(n6), .CK(clk), .RN(n19), .Q(n20) );
  DFFRQX2M \synchronous_data_reg[0]  ( .D(n3), .CK(clk), .RN(n19), .Q(
        synchronous_data[0]) );
  DFFRHQX2M \synchronous_data_reg[6]  ( .D(n9), .CK(clk), .RN(n19), .Q(
        synchronous_data[6]) );
  DFFRHQX4M \synchronous_data_reg[5]  ( .D(n8), .CK(clk), .RN(n19), .Q(
        synchronous_data[5]) );
  INVX2M U3 ( .A(n20), .Y(n2) );
  INVX2M U4 ( .A(n21), .Y(n14) );
  INVX2M U5 ( .A(n22), .Y(n12) );
  BUFX5M U6 ( .A(n16), .Y(n18) );
  INVX2M U7 ( .A(n2), .Y(synchronous_data[3]) );
  INVX2M U8 ( .A(n12), .Y(synchronous_data[1]) );
  INVX2M U9 ( .A(n14), .Y(synchronous_data[2]) );
  NOR2BX1M U10 ( .AN(synchronized_enable), .B(n1), .Y(n16) );
  BUFX5M U11 ( .A(reset_n), .Y(n19) );
  CLKINVX4M U12 ( .A(n18), .Y(n17) );
  AO22XLM U13 ( .A0(n18), .A1(asynchronous_data[6]), .B0(n17), .B1(
        synchronous_data[6]), .Y(n9) );
  AO22XLM U14 ( .A0(n18), .A1(asynchronous_data[5]), .B0(n17), .B1(
        synchronous_data[5]), .Y(n8) );
  AO22XLM U15 ( .A0(n18), .A1(asynchronous_data[7]), .B0(n17), .B1(
        synchronous_data[7]), .Y(n10) );
  AO22XLM U16 ( .A0(n18), .A1(asynchronous_data[4]), .B0(n17), .B1(
        synchronous_data[4]), .Y(n7) );
  AO22XLM U17 ( .A0(n18), .A1(asynchronous_data[3]), .B0(n17), .B1(
        synchronous_data[3]), .Y(n6) );
  AO22XLM U18 ( .A0(n18), .A1(asynchronous_data[2]), .B0(n17), .B1(
        synchronous_data[2]), .Y(n5) );
  AO22XLM U19 ( .A0(n18), .A1(asynchronous_data[1]), .B0(n17), .B1(
        synchronous_data[1]), .Y(n4) );
  AO22XLM U20 ( .A0(n18), .A1(asynchronous_data[0]), .B0(n17), .B1(
        synchronous_data[0]), .Y(n3) );
endmodule


module uart_transmitter_fsm ( clk, reset_n, par_en, data_valid, ser_en, 
        bit_sel, ser_data_index, busy );
  output [1:0] bit_sel;
  output [2:0] ser_data_index;
  input clk, reset_n, par_en, data_valid;
  output ser_en, busy;
  wire   \serial_data_transmission_state[3] , N17, N18, N19, N20, n11, n12, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n13, n14;
  wire   [1:0] current_state;
  assign bit_sel[1] = current_state[1];

  DFFRQX2M \current_state_reg[0]  ( .D(n12), .CK(clk), .RN(n14), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(n11), .CK(clk), .RN(n14), .Q(
        current_state[1]) );
  DFFRQX4M \serial_data_transmission_state_reg[0]  ( .D(N17), .CK(clk), .RN(
        n14), .Q(ser_data_index[0]) );
  DFFRQX4M \serial_data_transmission_state_reg[2]  ( .D(N19), .CK(clk), .RN(
        n14), .Q(ser_data_index[2]) );
  DFFRQX2M \serial_data_transmission_state_reg[1]  ( .D(N18), .CK(clk), .RN(
        n14), .Q(ser_data_index[1]) );
  DFFRQX2M \serial_data_transmission_state_reg[3]  ( .D(N20), .CK(clk), .RN(
        n14), .Q(\serial_data_transmission_state[3] ) );
  AOI221X2M U3 ( .A0(ser_data_index[2]), .A1(n2), .B0(n8), .B1(n1), .C0(n10), 
        .Y(N19) );
  AOI221X2M U4 ( .A0(ser_data_index[1]), .A1(ser_data_index[0]), .B0(n13), 
        .B1(n9), .C0(n10), .Y(N18) );
  AOI32X1M U5 ( .A0(n6), .A1(current_state[1]), .A2(n7), .B0(n3), .B1(n5), .Y(
        n11) );
  CLKINVX4M U6 ( .A(current_state[1]), .Y(n5) );
  NOR3X4M U7 ( .A(\serial_data_transmission_state[3] ), .B(current_state[0]), 
        .C(n5), .Y(n4) );
  NOR3X1M U8 ( .A(\serial_data_transmission_state[3] ), .B(ser_data_index[0]), 
        .C(bit_sel[0]), .Y(N17) );
  OAI21X4M U9 ( .A0(n3), .A1(n5), .B0(busy), .Y(bit_sel[0]) );
  CLKBUFX4M U10 ( .A(reset_n), .Y(n14) );
  CLKINVX2M U11 ( .A(current_state[0]), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n3), .Y(busy) );
  CLKINVX2M U13 ( .A(ser_data_index[1]), .Y(n13) );
  CLKINVX2M U14 ( .A(ser_data_index[0]), .Y(n9) );
  NOR2X2M U15 ( .A(n13), .B(n9), .Y(n2) );
  CLKINVX1M U16 ( .A(ser_data_index[2]), .Y(n8) );
  CLKINVX1M U17 ( .A(n2), .Y(n1) );
  OR2X2M U18 ( .A(\serial_data_transmission_state[3] ), .B(bit_sel[0]), .Y(n10) );
  AOI2BB1X2M U19 ( .A0N(data_valid), .A1N(busy), .B0(n4), .Y(n6) );
  NAND2X1M U20 ( .A(par_en), .B(n3), .Y(n7) );
  AO21X2M U21 ( .A0(current_state[0]), .A1(n5), .B0(n4), .Y(ser_en) );
  AOI21BXLM U22 ( .A0(busy), .A1(n7), .B0N(n6), .Y(n12) );
  NOR4X1M U23 ( .A(n13), .B(n10), .C(n9), .D(n8), .Y(N20) );
endmodule


module serializer ( clk, reset_n, parallel_data, ser_en, ser_data_index, 
        ser_data );
  input [7:0] parallel_data;
  input [2:0] ser_data_index;
  input clk, reset_n, ser_en;
  output ser_data;
  wire   n10, n1, n2, n3, n4, n5, n6, n7, n8, n9;

  DFFRQX1M ser_data_reg ( .D(n10), .CK(clk), .RN(reset_n), .Q(ser_data) );
  AOI22X1M U2 ( .A0(ser_data_index[0]), .A1(parallel_data[3]), .B0(
        parallel_data[2]), .B1(n3), .Y(n1) );
  AOI32X1M U3 ( .A0(ser_data_index[1]), .A1(ser_en), .A2(n8), .B0(n7), .B1(
        ser_en), .Y(n9) );
  AOI22X1M U4 ( .A0(ser_data_index[0]), .A1(parallel_data[1]), .B0(
        parallel_data[0]), .B1(n3), .Y(n5) );
  AOI22X1M U5 ( .A0(ser_data_index[2]), .A1(n2), .B0(n1), .B1(n4), .Y(n8) );
  AOI22X1M U6 ( .A0(ser_data_index[0]), .A1(parallel_data[7]), .B0(
        parallel_data[6]), .B1(n3), .Y(n2) );
  AOI221X2M U7 ( .A0(n6), .A1(ser_data_index[2]), .B0(n5), .B1(n4), .C0(
        ser_data_index[1]), .Y(n7) );
  AOI22X1M U8 ( .A0(ser_data_index[0]), .A1(parallel_data[5]), .B0(
        parallel_data[4]), .B1(n3), .Y(n6) );
  CLKINVX1M U9 ( .A(ser_data_index[2]), .Y(n4) );
  CLKINVX2M U10 ( .A(ser_data_index[0]), .Y(n3) );
  OAI2B1X1M U11 ( .A1N(ser_data), .A0(ser_en), .B0(n9), .Y(n10) );
endmodule


module parity_calculator ( clk, reset_n, par_type, par_en, data_valid, 
        parallel_data, par_bit );
  input [7:0] parallel_data;
  input clk, reset_n, par_type, par_en, data_valid;
  output par_bit;
  wire   n8, n1, n2, n3, n4, n5, n6, n7;

  DFFRQX1M par_bit_reg ( .D(n8), .CK(clk), .RN(reset_n), .Q(par_bit) );
  NAND2X1M U2 ( .A(data_valid), .B(par_en), .Y(n7) );
  XOR3X1M U3 ( .A(par_type), .B(parallel_data[4]), .C(parallel_data[2]), .Y(n5) );
  XOR2X1M U4 ( .A(parallel_data[0]), .B(parallel_data[5]), .Y(n1) );
  XOR3XLM U5 ( .A(parallel_data[1]), .B(parallel_data[6]), .C(n1), .Y(n2) );
  XOR3X1M U6 ( .A(parallel_data[7]), .B(parallel_data[3]), .C(n2), .Y(n4) );
  NOR2X1M U7 ( .A(n5), .B(n4), .Y(n3) );
  AOI211X2M U8 ( .A0(n5), .A1(n4), .B0(n7), .C0(n3), .Y(n6) );
  AO21XLM U9 ( .A0(n7), .A1(par_bit), .B0(n6), .Y(n8) );
endmodule


module output_mux ( bit_sel, ser_data, par_bit, mux_out );
  input [1:0] bit_sel;
  input ser_data, par_bit;
  output mux_out;
  wire   n5, n1, n3, n4;

  AOI31X1M U3 ( .A0(n4), .A1(bit_sel[0]), .A2(bit_sel[1]), .B0(n3), .Y(n5) );
  CLKINVX1M U4 ( .A(n5), .Y(n1) );
  INVX8M U5 ( .A(n1), .Y(mux_out) );
  CLKINVX1M U6 ( .A(par_bit), .Y(n4) );
  AOI21X1M U7 ( .A0(bit_sel[1]), .A1(ser_data), .B0(bit_sel[0]), .Y(n3) );
endmodule


module uart_transmitter ( clk, reset_n, par_type, par_en, data_valid, 
        parallel_data, ser_data_out, busy );
  input [7:0] parallel_data;
  input clk, reset_n, par_type, par_en, data_valid;
  output ser_data_out, busy;
  wire   ser_en, serial_data, par_bit;
  wire   [1:0] bit_sel;
  wire   [2:0] ser_data_index;

  uart_transmitter_fsm uart_transmitter_fsm_inst ( .clk(clk), .reset_n(reset_n), .par_en(par_en), .data_valid(data_valid), .ser_en(ser_en), .bit_sel(bit_sel), 
        .ser_data_index(ser_data_index), .busy(busy) );
  serializer serializer_inst ( .clk(clk), .reset_n(reset_n), .parallel_data(
        parallel_data), .ser_en(ser_en), .ser_data_index(ser_data_index), 
        .ser_data(serial_data) );
  parity_calculator parity_calculator_inst ( .clk(clk), .reset_n(reset_n), 
        .par_type(par_type), .par_en(par_en), .data_valid(data_valid), 
        .parallel_data(parallel_data), .par_bit(par_bit) );
  output_mux output_mux_inst ( .bit_sel(bit_sel), .ser_data(serial_data), 
        .par_bit(par_bit), .mux_out(ser_data_out) );
endmodule


module uart_receiver_fsm ( clk, reset_n, par_en, prescale, ser_data_in, 
        start_bit_error, stop_bit_error, par_bit_error, edge_count, 
        edge_count_done, start_bit_check_en, stop_bit_check_en, 
        par_bit_check_en, edge_counter_data_sampler_en, deserializer_en, 
        data_index, data_valid );
  input [5:0] prescale;
  input [4:0] edge_count;
  output [2:0] data_index;
  input clk, reset_n, par_en, ser_data_in, start_bit_error, stop_bit_error,
         par_bit_error, edge_count_done;
  output start_bit_check_en, stop_bit_check_en, par_bit_check_en,
         edge_counter_data_sampler_en, deserializer_en, data_valid;
  wire   \data_receiption_state[3] , n40, n41, n42, n43, n44, n45, n46, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86;
  wire   [2:0] current_state;

  DFFRQX4M \data_receiption_state_reg[1]  ( .D(n43), .CK(clk), .RN(n86), .Q(
        data_index[1]) );
  DFFRQX4M \data_receiption_state_reg[3]  ( .D(n40), .CK(clk), .RN(n86), .Q(
        \data_receiption_state[3] ) );
  DFFRQX4M \data_receiption_state_reg[0]  ( .D(n42), .CK(clk), .RN(n86), .Q(
        data_index[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(n45), .CK(clk), .RN(n86), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(n46), .CK(clk), .RN(n86), .Q(
        current_state[0]) );
  DFFRQX2M \data_receiption_state_reg[2]  ( .D(n41), .CK(clk), .RN(n86), .Q(
        data_index[2]) );
  DFFRQX4M \current_state_reg[1]  ( .D(n44), .CK(clk), .RN(n86), .Q(
        current_state[1]) );
  AOI221X2M U3 ( .A0(\data_receiption_state[3] ), .A1(n52), .B0(n51), .B1(n52), 
        .C0(n50), .Y(n42) );
  AOI221X2M U4 ( .A0(prescale[4]), .A1(n8), .B0(n28), .B1(edge_count[4]), .C0(
        prescale[5]), .Y(n14) );
  AOI221X2M U5 ( .A0(n4), .A1(prescale[0]), .B0(prescale[1]), .B1(
        edge_count[1]), .C0(n3), .Y(n7) );
  AOI22X1M U6 ( .A0(n35), .A1(edge_count[1]), .B0(n34), .B1(edge_count[0]), 
        .Y(n33) );
  AOI221X2M U7 ( .A0(n32), .A1(edge_count[3]), .B0(n31), .B1(edge_count[2]), 
        .C0(n30), .Y(n38) );
  AOI22X2M U8 ( .A0(prescale[3]), .A1(n2), .B0(n35), .B1(n29), .Y(n31) );
  OAI31X2M U9 ( .A0(start_bit_error), .A1(n62), .A2(n68), .B0(n61), .Y(n44) );
  OAI2B2X4M U10 ( .A1N(ser_data_in), .A0(n74), .B0(edge_count_done), .B1(n59), 
        .Y(n73) );
  CLKINVX4M U11 ( .A(n2), .Y(n35) );
  CLKINVX4M U12 ( .A(prescale[2]), .Y(n2) );
  OAI21X2M U13 ( .A0(n26), .A1(n25), .B0(n1), .Y(n39) );
  NOR2X3M U14 ( .A(n67), .B(n68), .Y(n78) );
  OAI221X1M U15 ( .A0(n35), .A1(edge_count[1]), .B0(n34), .B1(edge_count[0]), 
        .C0(n33), .Y(n36) );
  CLKINVX2M U16 ( .A(prescale[1]), .Y(n34) );
  CLKINVX2M U17 ( .A(prescale[3]), .Y(n29) );
  AOI31X1M U18 ( .A0(\data_receiption_state[3] ), .A1(par_en), .A2(n78), .B0(
        n77), .Y(n80) );
  AOI2BB2X1M U19 ( .B0(n55), .B1(n56), .A0N(n56), .A1N(n53), .Y(n41) );
  NOR3X8M U20 ( .A(current_state[0]), .B(current_state[1]), .C(n72), .Y(n81)
         );
  NOR3X6M U21 ( .A(current_state[0]), .B(current_state[2]), .C(n85), .Y(n58)
         );
  CLKNAND2X4M U22 ( .A(current_state[0]), .B(n72), .Y(n84) );
  AOI21X3M U23 ( .A0(current_state[2]), .A1(current_state[1]), .B0(n73), .Y(
        n76) );
  OAI211X8M U24 ( .A0(current_state[2]), .A1(n85), .B0(n20), .C0(n84), .Y(
        edge_counter_data_sampler_en) );
  CLKNAND2X2M U25 ( .A(data_index[0]), .B(n63), .Y(n66) );
  NOR3X2M U26 ( .A(current_state[1]), .B(n84), .C(n83), .Y(start_bit_check_en)
         );
  NOR3X4M U27 ( .A(current_state[1]), .B(n72), .C(n75), .Y(data_valid) );
  CLKINVX4M U28 ( .A(current_state[2]), .Y(n72) );
  OAI22X1M U29 ( .A0(edge_count[3]), .A1(n32), .B0(n31), .B1(edge_count[2]), 
        .Y(n30) );
  OAI31X4M U30 ( .A0(n29), .A1(n28), .A2(n2), .B0(n27), .Y(n32) );
  CLKINVX4M U31 ( .A(n52), .Y(n63) );
  OAI21X4M U32 ( .A0(n18), .A1(edge_count[3]), .B0(n17), .Y(n52) );
  OAI21X4M U33 ( .A0(prescale[5]), .A1(n49), .B0(n82), .Y(n83) );
  OAI32X2M U34 ( .A0(\data_receiption_state[3] ), .A1(n56), .A2(n55), .B0(n54), 
        .B1(n64), .Y(n40) );
  OAI22X1M U35 ( .A0(prescale[0]), .A1(n4), .B0(prescale[1]), .B1(
        edge_count[1]), .Y(n3) );
  OAI31X2M U36 ( .A0(n11), .A1(edge_count[2]), .A2(n10), .B0(n9), .Y(n12) );
  NAND2XLM U37 ( .A(prescale[4]), .B(n8), .Y(n5) );
  CLKINVX2M U38 ( .A(prescale[4]), .Y(n28) );
  NOR3X6M U39 ( .A(prescale[3]), .B(n35), .C(prescale[1]), .Y(n13) );
  NOR2X3M U40 ( .A(n35), .B(prescale[1]), .Y(n11) );
  AOI211X4M U41 ( .A0(n35), .A1(prescale[1]), .B0(prescale[4]), .C0(
        prescale[3]), .Y(n21) );
  OR2X1M U42 ( .A(prescale[5]), .B(n49), .Y(n1) );
  AOI2B1X2M U43 ( .A1N(n11), .A0(prescale[3]), .B0(n13), .Y(n18) );
  CLKINVX2M U44 ( .A(prescale[5]), .Y(n24) );
  CLKINVX1M U45 ( .A(edge_count[0]), .Y(n4) );
  CLKINVX1M U46 ( .A(edge_count[4]), .Y(n8) );
  OAI211X1M U47 ( .A0(prescale[4]), .A1(n24), .B0(n13), .C0(n5), .Y(n6) );
  OAI211X1M U48 ( .A0(edge_count[4]), .A1(n24), .B0(n7), .C0(n6), .Y(n16) );
  NOR2X2M U49 ( .A(n2), .B(n34), .Y(n10) );
  OAI21X1M U50 ( .A0(n11), .A1(n10), .B0(edge_count[2]), .Y(n9) );
  CLKINVX4M U51 ( .A(current_state[1]), .Y(n85) );
  OAI211X1M U52 ( .A0(n14), .A1(n13), .B0(n12), .C0(n58), .Y(n15) );
  AOI211X2M U53 ( .A0(n18), .A1(edge_count[3]), .B0(n16), .C0(n15), .Y(n17) );
  CLKINVX1M U54 ( .A(n66), .Y(n50) );
  NAND2X1M U55 ( .A(n50), .B(data_index[1]), .Y(n55) );
  CLKINVX2M U56 ( .A(data_index[2]), .Y(n56) );
  OAI2BB1XLM U57 ( .A0N(data_index[1]), .A1N(data_index[0]), .B0(n63), .Y(n19)
         );
  OAI21X2M U58 ( .A0(\data_receiption_state[3] ), .A1(n63), .B0(n19), .Y(n53)
         );
  CLKINVX1M U59 ( .A(n81), .Y(n20) );
  CLKBUFX4M U60 ( .A(reset_n), .Y(n86) );
  CLKINVX2M U61 ( .A(n21), .Y(n49) );
  CLKINVX1M U62 ( .A(n49), .Y(n22) );
  AOI31X2M U63 ( .A0(n35), .A1(prescale[4]), .A2(prescale[3]), .B0(n21), .Y(
        n23) );
  NOR3X2M U64 ( .A(n22), .B(n24), .C(n23), .Y(n48) );
  CLKINVX1M U65 ( .A(n23), .Y(n26) );
  CLKINVX1M U66 ( .A(n24), .Y(n25) );
  OAI21X1M U67 ( .A0(n29), .A1(n2), .B0(n28), .Y(n27) );
  AOI21X1M U68 ( .A0(edge_count[4]), .A1(n39), .B0(n36), .Y(n37) );
  OAI211X1M U69 ( .A0(edge_count[4]), .A1(n39), .B0(n38), .C0(n37), .Y(n47) );
  NOR2X2M U70 ( .A(n48), .B(n47), .Y(n82) );
  CLKINVX1M U71 ( .A(data_index[0]), .Y(n51) );
  AOI21X1M U72 ( .A0(n63), .A1(n56), .B0(n53), .Y(n54) );
  CLKINVX2M U73 ( .A(\data_receiption_state[3] ), .Y(n64) );
  CLKINVX1M U74 ( .A(n84), .Y(n57) );
  NAND2XLM U75 ( .A(n57), .B(n85), .Y(n62) );
  CLKINVX2M U76 ( .A(edge_count_done), .Y(n68) );
  CLKINVX1M U77 ( .A(n58), .Y(n67) );
  NOR2X2M U78 ( .A(par_en), .B(n64), .Y(n70) );
  CLKINVX1M U79 ( .A(n70), .Y(n60) );
  CLKINVX2M U80 ( .A(current_state[0]), .Y(n75) );
  NAND3X1M U81 ( .A(n75), .B(n72), .C(n85), .Y(n74) );
  NOR3X2M U82 ( .A(n58), .B(n57), .C(n81), .Y(n59) );
  AOI2BB2X1M U83 ( .B0(n78), .B1(n60), .A0N(n76), .A1N(n85), .Y(n61) );
  OAI211X1M U84 ( .A0(n64), .A1(n63), .B0(n66), .C0(data_index[1]), .Y(n65) );
  OAI21X1M U85 ( .A0(n66), .A1(data_index[1]), .B0(n65), .Y(n43) );
  NOR2X2M U86 ( .A(n67), .B(n83), .Y(deserializer_en) );
  NOR4X1M U87 ( .A(par_bit_error), .B(n84), .C(n85), .D(n68), .Y(n69) );
  AOI21X1M U88 ( .A0(n78), .A1(n70), .B0(n69), .Y(n71) );
  NAND3BX1M U89 ( .AN(stop_bit_error), .B(edge_count_done), .C(n81), .Y(n79)
         );
  OAI211X1M U90 ( .A0(n76), .A1(n72), .B0(n71), .C0(n79), .Y(n45) );
  OAI22X1M U91 ( .A0(n76), .A1(n75), .B0(n74), .B1(n73), .Y(n77) );
  OAI2B11X1M U92 ( .A1N(data_valid), .A0(ser_data_in), .B0(n80), .C0(n79), .Y(
        n46) );
  AND2X1M U93 ( .A(n82), .B(n81), .Y(stop_bit_check_en) );
  NOR3X2M U94 ( .A(n85), .B(n84), .C(n83), .Y(par_bit_check_en) );
endmodule


module deserializer ( clk, enable, reset_n, data_index, sampled_bit, 
        parallel_data );
  input [2:0] data_index;
  output [7:0] parallel_data;
  input clk, enable, reset_n, sampled_bit;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n25, n26, n27;

  DFFRQX2M \parallel_data_reg[0]  ( .D(n17), .CK(clk), .RN(n27), .Q(
        parallel_data[0]) );
  DFFRQX2M \parallel_data_reg[7]  ( .D(n24), .CK(clk), .RN(n27), .Q(
        parallel_data[7]) );
  DFFRQX2M \parallel_data_reg[1]  ( .D(n18), .CK(clk), .RN(n27), .Q(
        parallel_data[1]) );
  DFFRQX2M \parallel_data_reg[2]  ( .D(n19), .CK(clk), .RN(n27), .Q(
        parallel_data[2]) );
  DFFRQX2M \parallel_data_reg[5]  ( .D(n22), .CK(clk), .RN(n27), .Q(
        parallel_data[5]) );
  DFFRQX2M \parallel_data_reg[6]  ( .D(n23), .CK(clk), .RN(n27), .Q(
        parallel_data[6]) );
  DFFRQX2M \parallel_data_reg[4]  ( .D(n21), .CK(clk), .RN(n27), .Q(
        parallel_data[4]) );
  DFFRQX2M \parallel_data_reg[3]  ( .D(n20), .CK(clk), .RN(n27), .Q(
        parallel_data[3]) );
  NAND2BX4M U2 ( .AN(data_index[0]), .B(enable), .Y(n15) );
  CLKNAND2X4M U3 ( .A(data_index[0]), .B(enable), .Y(n6) );
  CLKBUFX4M U4 ( .A(reset_n), .Y(n27) );
  NAND2BX2M U5 ( .AN(n6), .B(sampled_bit), .Y(n8) );
  CLKINVX1M U6 ( .A(data_index[2]), .Y(n3) );
  NAND2X2M U7 ( .A(data_index[1]), .B(n3), .Y(n25) );
  OAI21X1M U8 ( .A0(n6), .A1(n25), .B0(parallel_data[3]), .Y(n1) );
  OAI21X1M U9 ( .A0(n8), .A1(n25), .B0(n1), .Y(n20) );
  NAND2X2M U10 ( .A(data_index[1]), .B(data_index[2]), .Y(n10) );
  OAI21X1M U11 ( .A0(n6), .A1(n10), .B0(parallel_data[7]), .Y(n2) );
  OAI21X1M U12 ( .A0(n8), .A1(n10), .B0(n2), .Y(n24) );
  CLKINVX1M U13 ( .A(data_index[1]), .Y(n5) );
  NAND2X2M U14 ( .A(n5), .B(n3), .Y(n14) );
  OAI21X1M U15 ( .A0(n6), .A1(n14), .B0(parallel_data[1]), .Y(n4) );
  OAI21X1M U16 ( .A0(n8), .A1(n14), .B0(n4), .Y(n18) );
  NAND2X2M U17 ( .A(data_index[2]), .B(n5), .Y(n12) );
  OAI21X1M U18 ( .A0(n6), .A1(n12), .B0(parallel_data[5]), .Y(n7) );
  OAI21X1M U19 ( .A0(n8), .A1(n12), .B0(n7), .Y(n22) );
  NAND2BX2M U20 ( .AN(n15), .B(sampled_bit), .Y(n26) );
  OAI21X1M U21 ( .A0(n15), .A1(n10), .B0(parallel_data[6]), .Y(n9) );
  OAI21X1M U22 ( .A0(n26), .A1(n10), .B0(n9), .Y(n23) );
  OAI21X1M U23 ( .A0(n15), .A1(n12), .B0(parallel_data[4]), .Y(n11) );
  OAI21X1M U24 ( .A0(n26), .A1(n12), .B0(n11), .Y(n21) );
  OAI21X1M U25 ( .A0(n15), .A1(n14), .B0(parallel_data[0]), .Y(n13) );
  OAI21X1M U26 ( .A0(n26), .A1(n14), .B0(n13), .Y(n17) );
  OAI21X1M U27 ( .A0(n15), .A1(n25), .B0(parallel_data[2]), .Y(n16) );
  OAI21X1M U28 ( .A0(n26), .A1(n25), .B0(n16), .Y(n19) );
endmodule


module edge_counter ( clk, reset_n, prescale, enable, edge_count, 
        edge_count_done );
  input [5:0] prescale;
  output [4:0] edge_count;
  input clk, reset_n, enable;
  output edge_count_done;
  wire   n20, N14, N15, N16, N17, N18, n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19;

  DFFRHQX8M \edge_count_reg[4]  ( .D(N18), .CK(clk), .RN(n19), .Q(
        edge_count[4]) );
  DFFRHQX8M \edge_count_reg[3]  ( .D(N17), .CK(clk), .RN(n19), .Q(
        edge_count[3]) );
  DFFRQX1M \edge_count_reg[0]  ( .D(N14), .CK(clk), .RN(n19), .Q(n20) );
  DFFRQX4M \edge_count_reg[2]  ( .D(N16), .CK(clk), .RN(n19), .Q(edge_count[2]) );
  DFFRQX4M \edge_count_reg[1]  ( .D(N15), .CK(clk), .RN(n19), .Q(edge_count[1]) );
  AOI221X2M U3 ( .A0(edge_count[0]), .A1(edge_count[1]), .B0(n18), .B1(n17), 
        .C0(n16), .Y(N15) );
  AOI221X2M U4 ( .A0(edge_count[4]), .A1(n12), .B0(n11), .B1(n10), .C0(n16), 
        .Y(N18) );
  AOI221X2M U5 ( .A0(edge_count[3]), .A1(n13), .B0(n9), .B1(n8), .C0(n16), .Y(
        N17) );
  CLKBUFX4M U6 ( .A(reset_n), .Y(n19) );
  NAND2BX4M U7 ( .AN(edge_count_done), .B(enable), .Y(n16) );
  OAI211X2M U8 ( .A0(prescale[3]), .A1(n6), .B0(n13), .C0(n5), .Y(n7) );
  NOR3X8M U9 ( .A(n18), .B(n17), .C(n14), .Y(n13) );
  CLKINVX1M U10 ( .A(n20), .Y(n1) );
  CLKINVX4M U11 ( .A(n1), .Y(edge_count[0]) );
  NOR4X6M U12 ( .A(prescale[0]), .B(prescale[2]), .C(prescale[1]), .D(n7), .Y(
        edge_count_done) );
  CLKINVX1M U13 ( .A(n12), .Y(n10) );
  OR2X1M U14 ( .A(prescale[4]), .B(prescale[5]), .Y(n6) );
  CLKINVX1M U15 ( .A(edge_count[0]), .Y(n18) );
  CLKINVX1M U16 ( .A(edge_count[1]), .Y(n17) );
  CLKINVX1M U17 ( .A(edge_count[2]), .Y(n14) );
  CLKINVX1M U18 ( .A(edge_count[4]), .Y(n11) );
  OAI21X1M U19 ( .A0(n11), .A1(prescale[4]), .B0(prescale[5]), .Y(n3) );
  NAND2XLM U20 ( .A(edge_count[3]), .B(n3), .Y(n4) );
  OAI21X1M U21 ( .A0(prescale[3]), .A1(n4), .B0(n6), .Y(n5) );
  CLKINVX1M U22 ( .A(edge_count[3]), .Y(n9) );
  CLKINVX1M U23 ( .A(n13), .Y(n8) );
  NOR2X2M U24 ( .A(n9), .B(n8), .Y(n12) );
  NOR2X1M U25 ( .A(edge_count[0]), .B(n16), .Y(N14) );
  NAND2XLM U26 ( .A(edge_count[0]), .B(edge_count[1]), .Y(n15) );
  AOI211X2M U27 ( .A0(n15), .A1(n14), .B0(n13), .C0(n16), .Y(N16) );
endmodule


module data_sampler ( clk, reset_n, ser_data_in, prescale, enable, edge_count, 
        sampled_bit );
  input [4:0] prescale;
  input [4:0] edge_count;
  input clk, reset_n, ser_data_in, enable;
  output sampled_bit;
  wire   \sampling_edge_number[0] , sample_enable, n12, n13, n14, n15, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55;
  wire   [2:0] samples;
  assign \sampling_edge_number[0]  = prescale[0];

  DFFRQX1M sample_enable_reg ( .D(n12), .CK(clk), .RN(n55), .Q(sample_enable)
         );
  DFFRQX2M \samples_reg[0]  ( .D(n13), .CK(clk), .RN(n55), .Q(samples[0]) );
  DFFRQX2M \samples_reg[1]  ( .D(n14), .CK(clk), .RN(n55), .Q(samples[1]) );
  DFFRQX2M \samples_reg[2]  ( .D(n15), .CK(clk), .RN(n55), .Q(samples[2]) );
  AOI221X2M U3 ( .A0(\sampling_edge_number[0] ), .A1(n41), .B0(n6), .B1(n37), 
        .C0(n5), .Y(n9) );
  AOI222X2M U4 ( .A0(prescale[3]), .A1(n21), .B0(edge_count[4]), .B1(n20), 
        .C0(n19), .C1(edge_count[3]), .Y(n23) );
  AOI222X4M U5 ( .A0(samples[1]), .A1(samples[0]), .B0(samples[1]), .B1(
        samples[2]), .C0(samples[0]), .C1(samples[2]), .Y(n1) );
  AOI22X2M U6 ( .A0(edge_count[4]), .A1(n34), .B0(n33), .B1(n32), .Y(n47) );
  AOI221X2M U7 ( .A0(n42), .A1(n41), .B0(n40), .B1(n39), .C0(n38), .Y(n45) );
  AOI221X2M U8 ( .A0(n52), .A1(n51), .B0(n50), .B1(n49), .C0(n48), .Y(n53) );
  AOI221X2M U9 ( .A0(n17), .A1(n51), .B0(n16), .B1(n49), .C0(n11), .Y(n18) );
  XNOR2X8M U10 ( .A(edge_count[3]), .B(n35), .Y(n49) );
  AOI211X4M U11 ( .A0(n27), .A1(n32), .B0(n26), .C0(n25), .Y(n29) );
  OAI211X4M U12 ( .A0(edge_count[4]), .A1(n34), .B0(enable), .C0(n7), .Y(n26)
         );
  AOI2BB2X8M U13 ( .B0(n27), .B1(n20), .A0N(n20), .A1N(n27), .Y(n34) );
  NOR2X3M U14 ( .A(prescale[2]), .B(n31), .Y(n4) );
  CLKINVX4M U15 ( .A(n36), .Y(n31) );
  NOR2X6M U16 ( .A(n54), .B(n1), .Y(sampled_bit) );
  NOR3X4M U17 ( .A(prescale[2]), .B(n31), .C(n42), .Y(n17) );
  MXI2X6M U18 ( .A(n36), .B(n31), .S0(edge_count[1]), .Y(n41) );
  NOR3X8M U19 ( .A(prescale[3]), .B(prescale[2]), .C(n31), .Y(n27) );
  AOI2B1X4M U20 ( .A1N(n4), .A0(prescale[3]), .B0(n27), .Y(n35) );
  OAI22X1M U21 ( .A0(\sampling_edge_number[0] ), .A1(n41), .B0(n37), .B1(n6), 
        .Y(n5) );
  NOR2X2M U22 ( .A(\sampling_edge_number[0] ), .B(n36), .Y(n40) );
  CLKINVX4M U23 ( .A(\sampling_edge_number[0] ), .Y(n42) );
  BUFX2M U24 ( .A(reset_n), .Y(n55) );
  CLKINVX1M U25 ( .A(sample_enable), .Y(n54) );
  CLKINVX2M U26 ( .A(prescale[1]), .Y(n36) );
  AOI21X2M U27 ( .A0(n31), .A1(prescale[2]), .B0(n4), .Y(n30) );
  CLKXOR2X2M U28 ( .A(n30), .B(edge_count[2]), .Y(n37) );
  CLKINVX2M U29 ( .A(prescale[4]), .Y(n20) );
  MXI2X2M U30 ( .A(\sampling_edge_number[0] ), .B(n42), .S0(edge_count[0]), 
        .Y(n7) );
  AOI211X2M U31 ( .A0(edge_count[4]), .A1(n34), .B0(n49), .C0(n26), .Y(n2) );
  NAND3XLM U32 ( .A(n41), .B(n37), .C(n2), .Y(n3) );
  MX2XLM U33 ( .A(ser_data_in), .B(samples[0]), .S0(n3), .Y(n13) );
  OAI21X2M U34 ( .A0(n35), .A1(n34), .B0(n49), .Y(n51) );
  CLKINVX1M U35 ( .A(n17), .Y(n16) );
  CLKINVX1M U36 ( .A(prescale[3]), .Y(n19) );
  CLKINVX1M U37 ( .A(n34), .Y(n33) );
  AOI31X2M U38 ( .A0(n4), .A1(\sampling_edge_number[0] ), .A2(n19), .B0(n33), 
        .Y(n10) );
  NOR2X2M U39 ( .A(n31), .B(n42), .Y(n6) );
  NAND2BX1M U40 ( .AN(n7), .B(enable), .Y(n43) );
  AOI21X1M U41 ( .A0(edge_count[4]), .A1(n10), .B0(n43), .Y(n8) );
  OAI211X1M U42 ( .A0(edge_count[4]), .A1(n10), .B0(n9), .C0(n8), .Y(n11) );
  MX2XLM U43 ( .A(samples[1]), .B(ser_data_in), .S0(n18), .Y(n14) );
  CLKINVX1M U44 ( .A(edge_count[4]), .Y(n32) );
  CLKINVX1M U45 ( .A(prescale[2]), .Y(n24) );
  CLKINVX1M U46 ( .A(edge_count[3]), .Y(n21) );
  AOI21X1M U47 ( .A0(n24), .A1(edge_count[2]), .B0(n41), .Y(n22) );
  OAI211X1M U48 ( .A0(n24), .A1(edge_count[2]), .B0(n23), .C0(n22), .Y(n25) );
  NAND2XLM U49 ( .A(n29), .B(ser_data_in), .Y(n28) );
  OAI2B1X1M U50 ( .A1N(samples[2]), .A0(n29), .B0(n28), .Y(n15) );
  AOI21X2M U51 ( .A0(n31), .A1(n42), .B0(n30), .Y(n52) );
  CLKINVX1M U52 ( .A(n52), .Y(n50) );
  NOR2X2M U53 ( .A(n35), .B(n50), .Y(n46) );
  CLKINVX1M U54 ( .A(n37), .Y(n39) );
  OAI22X1M U55 ( .A0(n42), .A1(n41), .B0(n39), .B1(n40), .Y(n38) );
  AOI21X1M U56 ( .A0(n47), .A1(n46), .B0(n43), .Y(n44) );
  OAI211X1M U57 ( .A0(n47), .A1(n46), .B0(n45), .C0(n44), .Y(n48) );
  OAI21BX1M U58 ( .A0(enable), .A1(n54), .B0N(n53), .Y(n12) );
endmodule


module parity_bit_checker ( clk, reset_n, enable, par_type, sampled_bit, 
        parallel_data, par_bit_error );
  input [7:0] parallel_data;
  input clk, reset_n, enable, par_type, sampled_bit;
  output par_bit_error;
  wire   n8, N11, n2, n3, n4, n5, n6, n7;

  DFFRQX1M par_bit_error_reg ( .D(N11), .CK(clk), .RN(reset_n), .Q(n8) );
  BUFX10M U3 ( .A(n8), .Y(par_bit_error) );
  XOR3X1M U4 ( .A(par_type), .B(parallel_data[0]), .C(n2), .Y(n7) );
  XOR2X1M U5 ( .A(parallel_data[3]), .B(parallel_data[1]), .Y(n2) );
  XOR2X1M U6 ( .A(parallel_data[4]), .B(parallel_data[2]), .Y(n3) );
  XOR3XLM U7 ( .A(parallel_data[7]), .B(parallel_data[6]), .C(n3), .Y(n4) );
  XOR3X1M U8 ( .A(parallel_data[5]), .B(sampled_bit), .C(n4), .Y(n6) );
  OAI21X1M U9 ( .A0(n7), .A1(n6), .B0(enable), .Y(n5) );
  AOI21X1M U10 ( .A0(n7), .A1(n6), .B0(n5), .Y(N11) );
endmodule


module start_bit_checker ( clk, reset_n, enable, sampled_bit, start_bit_error
 );
  input clk, reset_n, enable, sampled_bit;
  output start_bit_error;
  wire   N4;

  DFFRQX1M start_bit_error_reg ( .D(N4), .CK(clk), .RN(reset_n), .Q(
        start_bit_error) );
  AND2X1M U3 ( .A(sampled_bit), .B(enable), .Y(N4) );
endmodule


module stop_bit_checker ( clk, reset_n, enable, sampled_bit, stop_bit_error );
  input clk, reset_n, enable, sampled_bit;
  output stop_bit_error;
  wire   N5;

  DFFRQX1M stop_bit_error_reg ( .D(N5), .CK(clk), .RN(reset_n), .Q(
        stop_bit_error) );
  NOR2BX1M U3 ( .AN(enable), .B(sampled_bit), .Y(N5) );
endmodule


module uart_receiver ( clk, reset_n, par_type, par_en, prescale, ser_data_in, 
        data_valid, parallel_data, par_error, frame_error );
  input [5:0] prescale;
  output [7:0] parallel_data;
  input clk, reset_n, par_type, par_en, ser_data_in;
  output data_valid, par_error, frame_error;
  wire   stop_bit_error, start_bit_error, edge_count_done, start_bit_check_en,
         par_bit_check_en, stop_bit_check_en, edge_counter_data_sampler_en,
         deserializer_en, sampled_bit, n1;
  wire   [4:0] edge_count;
  wire   [2:0] data_index;

  uart_receiver_fsm uart_receiver_fsm_inst ( .clk(clk), .reset_n(n1), .par_en(
        par_en), .prescale(prescale), .ser_data_in(ser_data_in), 
        .start_bit_error(start_bit_error), .stop_bit_error(stop_bit_error), 
        .par_bit_error(par_error), .edge_count(edge_count), .edge_count_done(
        edge_count_done), .start_bit_check_en(start_bit_check_en), 
        .stop_bit_check_en(stop_bit_check_en), .par_bit_check_en(
        par_bit_check_en), .edge_counter_data_sampler_en(
        edge_counter_data_sampler_en), .deserializer_en(deserializer_en), 
        .data_index(data_index), .data_valid(data_valid) );
  deserializer deserializer_inst ( .clk(clk), .enable(deserializer_en), 
        .reset_n(n1), .data_index(data_index), .sampled_bit(sampled_bit), 
        .parallel_data(parallel_data) );
  edge_counter edge_counter_inst ( .clk(clk), .reset_n(n1), .prescale(prescale), .enable(edge_counter_data_sampler_en), .edge_count(edge_count), 
        .edge_count_done(edge_count_done) );
  data_sampler data_sampler_inst ( .clk(clk), .reset_n(n1), .ser_data_in(
        ser_data_in), .prescale(prescale[5:1]), .enable(
        edge_counter_data_sampler_en), .edge_count(edge_count), .sampled_bit(
        sampled_bit) );
  parity_bit_checker parity_bit_checker_inst ( .clk(clk), .reset_n(n1), 
        .enable(par_bit_check_en), .par_type(par_type), .sampled_bit(
        sampled_bit), .parallel_data(parallel_data), .par_bit_error(par_error)
         );
  start_bit_checker start_bit_checker_inst ( .clk(clk), .reset_n(n1), .enable(
        start_bit_check_en), .sampled_bit(sampled_bit), .start_bit_error(
        start_bit_error) );
  stop_bit_checker stop_bit_checker_inst ( .clk(clk), .reset_n(n1), .enable(
        stop_bit_check_en), .sampled_bit(sampled_bit), .stop_bit_error(
        stop_bit_error) );
  CLKBUFX4M U1 ( .A(reset_n), .Y(n1) );
  OR2X8M U2 ( .A(stop_bit_error), .B(start_bit_error), .Y(frame_error) );
endmodule


module uart ( transmitter_clk, receiver_clk, reset_n, par_en, par_type, 
        prescale, transmitter_parallel_data_valid, transmitter_parallel_data, 
        receiver_ser_data, transmitter_ser_data, transmitter_busy, 
        receiver_parallel_data_valid, receiver_parallel_data, 
        receiver_par_error, receiver_frame_error );
  input [5:0] prescale;
  input [7:0] transmitter_parallel_data;
  output [7:0] receiver_parallel_data;
  input transmitter_clk, receiver_clk, reset_n, par_en, par_type,
         transmitter_parallel_data_valid, receiver_ser_data;
  output transmitter_ser_data, transmitter_busy, receiver_parallel_data_valid,
         receiver_par_error, receiver_frame_error;
  wire   n1;

  uart_transmitter uart_transmitter_inst ( .clk(transmitter_clk), .reset_n(n1), 
        .par_type(par_type), .par_en(par_en), .data_valid(
        transmitter_parallel_data_valid), .parallel_data(
        transmitter_parallel_data), .ser_data_out(transmitter_ser_data), 
        .busy(transmitter_busy) );
  uart_receiver uart_receiver_inst ( .clk(receiver_clk), .reset_n(n1), 
        .par_type(par_type), .par_en(par_en), .prescale(prescale), 
        .ser_data_in(receiver_ser_data), .data_valid(
        receiver_parallel_data_valid), .parallel_data(receiver_parallel_data), 
        .par_error(receiver_par_error), .frame_error(receiver_frame_error) );
  BUFX2M U1 ( .A(reset_n), .Y(n1) );
endmodule


module clock_divider ( ref_clk, reset_n, clk_divider_en, division_ratio, 
        output_clk );
  input [5:0] division_ratio;
  input ref_clk, reset_n, clk_divider_en;
  output output_clk;
  wire   enable, divided_clk, odd_toggle, n22, n23, n24, n25, n26, n27, n28,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57;
  wire   [4:0] counter;

  DFFRQX1M \counter_reg[3]  ( .D(n23), .CK(ref_clk), .RN(n56), .Q(counter[3])
         );
  DFFSX2M odd_toggle_reg ( .D(n28), .CK(ref_clk), .SN(n56), .Q(odd_toggle), 
        .QN(n57) );
  DFFRQX4M \counter_reg[4]  ( .D(n22), .CK(ref_clk), .RN(n56), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[1]  ( .D(n25), .CK(ref_clk), .RN(n56), .Q(counter[1])
         );
  DFFRQX2M \counter_reg[2]  ( .D(n24), .CK(ref_clk), .RN(n56), .Q(counter[2])
         );
  DFFRQX2M divided_clk_reg ( .D(n27), .CK(ref_clk), .RN(n56), .Q(divided_clk)
         );
  CLKMX2X8M U32 ( .A(ref_clk), .B(divided_clk), .S0(enable), .Y(output_clk) );
  DFFRQX2M \counter_reg[0]  ( .D(n26), .CK(ref_clk), .RN(n56), .Q(counter[0])
         );
  AOI221X2M U3 ( .A0(n9), .A1(n8), .B0(n21), .B1(n7), .C0(n6), .Y(n17) );
  AOI32X1M U4 ( .A0(n15), .A1(n14), .A2(n13), .B0(division_ratio[1]), .B1(n31), 
        .Y(n16) );
  CLKINVX1M U5 ( .A(n29), .Y(n2) );
  CLKINVX1M U6 ( .A(n2), .Y(n3) );
  OAI22X1M U7 ( .A0(n14), .A1(n55), .B0(counter[0]), .B1(division_ratio[1]), 
        .Y(n29) );
  AOI221X2M U8 ( .A0(counter[4]), .A1(n20), .B0(n44), .B1(division_ratio[5]), 
        .C0(n19), .Y(n30) );
  OAI31X2M U9 ( .A0(n5), .A1(division_ratio[5]), .A2(counter[4]), .B0(n4), .Y(
        n18) );
  OAI21X1M U10 ( .A0(n5), .A1(counter[4]), .B0(division_ratio[5]), .Y(n4) );
  AOI2B1X4M U11 ( .A1N(n34), .A0(n33), .B0(n39), .Y(n38) );
  AOI221X4M U12 ( .A0(odd_toggle), .A1(n34), .B0(n57), .B1(n32), .C0(n33), .Y(
        n39) );
  NAND2X3M U13 ( .A(n20), .B(n5), .Y(enable) );
  OAI21X1M U14 ( .A0(n55), .A1(enable), .B0(n54), .Y(n26) );
  OAI31X2M U15 ( .A0(n42), .A1(divided_clk), .A2(n38), .B0(n37), .Y(n27) );
  OAI31X2M U16 ( .A0(counter[2]), .A1(n53), .A2(n52), .B0(n51), .Y(n24) );
  OAI31X2M U17 ( .A0(n42), .A1(odd_toggle), .A2(n41), .B0(n40), .Y(n28) );
  AOI2BB2X1M U18 ( .B0(n46), .B1(n47), .A0N(n47), .A1N(n43), .Y(n23) );
  OAI32X2M U19 ( .A0(counter[4]), .A1(n47), .A2(n46), .B0(n45), .B1(n44), .Y(
        n22) );
  CLKINVX4M U20 ( .A(counter[3]), .Y(n47) );
  OAI31X2M U21 ( .A0(division_ratio[4]), .A1(division_ratio[3]), .A2(n44), 
        .B0(n10), .Y(n13) );
  AOI2BB2X4M U22 ( .B0(division_ratio[4]), .B1(n47), .A0N(n47), .A1N(
        division_ratio[4]), .Y(n21) );
  NOR2X2M U23 ( .A(division_ratio[1]), .B(n12), .Y(n8) );
  NOR3X4M U24 ( .A(division_ratio[3]), .B(division_ratio[1]), .C(n12), .Y(n7)
         );
  NOR4X4M U25 ( .A(division_ratio[4]), .B(division_ratio[3]), .C(
        division_ratio[1]), .D(n12), .Y(n5) );
  CLKINVX1M U26 ( .A(division_ratio[5]), .Y(n20) );
  CLKBUFX4M U27 ( .A(division_ratio[2]), .Y(n12) );
  CLKINVX1M U28 ( .A(division_ratio[1]), .Y(n14) );
  CLKINVX2M U29 ( .A(counter[0]), .Y(n55) );
  CLKINVX2M U30 ( .A(counter[2]), .Y(n35) );
  OAI2BB2X2M U31 ( .B0(n35), .B1(division_ratio[3]), .A0N(division_ratio[3]), 
        .A1N(n35), .Y(n19) );
  CLKINVX1M U33 ( .A(n19), .Y(n9) );
  OAI22X1M U34 ( .A0(n8), .A1(n9), .B0(n21), .B1(n7), .Y(n6) );
  CLKINVX2M U35 ( .A(counter[1]), .Y(n11) );
  NAND2X1M U36 ( .A(n12), .B(n11), .Y(n15) );
  CLKINVX2M U37 ( .A(counter[4]), .Y(n44) );
  NOR2X1M U38 ( .A(n12), .B(n11), .Y(n10) );
  OAI21X2M U39 ( .A0(n12), .A1(n11), .B0(n15), .Y(n31) );
  NAND4BX2M U40 ( .AN(n3), .B(n18), .C(n17), .D(n16), .Y(n34) );
  CLKINVX1M U41 ( .A(division_ratio[0]), .Y(n33) );
  NAND4BX1M U42 ( .AN(n31), .B(n30), .C(n21), .D(n3), .Y(n32) );
  NAND2X2M U43 ( .A(n38), .B(enable), .Y(n53) );
  CLKINVX2M U44 ( .A(n53), .Y(n48) );
  NAND2X1M U45 ( .A(counter[1]), .B(counter[0]), .Y(n52) );
  NOR2X2M U46 ( .A(n35), .B(n52), .Y(n36) );
  NAND2X1M U47 ( .A(n48), .B(n36), .Y(n46) );
  OAI21X2M U48 ( .A0(n36), .A1(n53), .B0(enable), .Y(n43) );
  CLKINVX2M U49 ( .A(enable), .Y(n42) );
  OAI21X1M U50 ( .A0(n42), .A1(n38), .B0(divided_clk), .Y(n37) );
  CLKINVX1M U51 ( .A(n39), .Y(n41) );
  NAND2XLM U52 ( .A(odd_toggle), .B(n41), .Y(n40) );
  AOI21X1M U53 ( .A0(n48), .A1(n47), .B0(n43), .Y(n45) );
  NAND2X1M U54 ( .A(n48), .B(n55), .Y(n54) );
  NAND2X1M U55 ( .A(enable), .B(n54), .Y(n49) );
  NOR2X2M U56 ( .A(counter[1]), .B(n53), .Y(n50) );
  AO22XLM U57 ( .A0(counter[1]), .A1(n49), .B0(counter[0]), .B1(n50), .Y(n25)
         );
  OAI21X1M U58 ( .A0(n50), .A1(n49), .B0(counter[2]), .Y(n51) );
  CLKBUFX4M U59 ( .A(reset_n), .Y(n56) );
endmodule


module register_0 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module register_1 ( clk, reset_n, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, reset_n;


  DFFRQX1M \Q_reg[0]  ( .D(D[0]), .CK(clk), .RN(reset_n), .Q(Q[0]) );
endmodule


module bus_synchronizer_0 ( clk, reset_n, asynchronous_data, synchronous_data
 );
  input [0:0] asynchronous_data;
  output [0:0] synchronous_data;
  input clk, reset_n;
  wire   \output_ports[0][0] ;

  register_1 reg_inst_0 ( .clk(clk), .reset_n(reset_n), .D(
        asynchronous_data[0]), .Q(\output_ports[0][0] ) );
  register_0 \genblk1[1].reg_inst  ( .clk(clk), .reset_n(reset_n), .D(
        \output_ports[0][0] ), .Q(synchronous_data[0]) );
endmodule


module data_synchronizer_0 ( clk, reset_n, asynchronous_data_valid, 
        asynchronous_data, Q_pulse_generator, synchronous_data_valid, 
        synchronous_data );
  input [7:0] asynchronous_data;
  output [7:0] synchronous_data;
  input clk, reset_n, asynchronous_data_valid;
  output Q_pulse_generator, synchronous_data_valid;
  wire   synchronized_enable, n2, n3, n4, n5, n6, n7, n8, n9, n1, n10, n11,
         n12;

  bus_synchronizer_0 U_bus_synchronizer ( .clk(clk), .reset_n(n12), 
        .asynchronous_data(asynchronous_data_valid), .synchronous_data(
        synchronized_enable) );
  DFFRQX1M Q_pulse_generator_reg ( .D(synchronized_enable), .CK(clk), .RN(n12), 
        .Q(Q_pulse_generator) );
  DFFRQX1M synchronous_data_valid_reg ( .D(n11), .CK(clk), .RN(n12), .Q(
        synchronous_data_valid) );
  DFFRQX2M \synchronous_data_reg[5]  ( .D(n7), .CK(clk), .RN(n12), .Q(
        synchronous_data[5]) );
  DFFRQX2M \synchronous_data_reg[4]  ( .D(n6), .CK(clk), .RN(n12), .Q(
        synchronous_data[4]) );
  DFFRQX2M \synchronous_data_reg[3]  ( .D(n5), .CK(clk), .RN(n12), .Q(
        synchronous_data[3]) );
  DFFRQX2M \synchronous_data_reg[2]  ( .D(n4), .CK(clk), .RN(n12), .Q(
        synchronous_data[2]) );
  DFFRQX2M \synchronous_data_reg[1]  ( .D(n3), .CK(clk), .RN(n12), .Q(
        synchronous_data[1]) );
  DFFRQX2M \synchronous_data_reg[0]  ( .D(n2), .CK(clk), .RN(n12), .Q(
        synchronous_data[0]) );
  DFFRQX2M \synchronous_data_reg[7]  ( .D(n9), .CK(clk), .RN(n12), .Q(
        synchronous_data[7]) );
  DFFRQX2M \synchronous_data_reg[6]  ( .D(n8), .CK(clk), .RN(n12), .Q(
        synchronous_data[6]) );
  BUFX5M U3 ( .A(n1), .Y(n11) );
  BUFX6M U4 ( .A(reset_n), .Y(n12) );
  NOR2BX1M U5 ( .AN(synchronized_enable), .B(Q_pulse_generator), .Y(n1) );
  CLKINVX4M U6 ( .A(n11), .Y(n10) );
  AO22XLM U7 ( .A0(n11), .A1(asynchronous_data[1]), .B0(n10), .B1(
        synchronous_data[1]), .Y(n3) );
  AO22XLM U8 ( .A0(n11), .A1(asynchronous_data[5]), .B0(n10), .B1(
        synchronous_data[5]), .Y(n7) );
  AO22XLM U9 ( .A0(n11), .A1(asynchronous_data[7]), .B0(n10), .B1(
        synchronous_data[7]), .Y(n9) );
  AO22XLM U10 ( .A0(n11), .A1(asynchronous_data[6]), .B0(n10), .B1(
        synchronous_data[6]), .Y(n8) );
  AO22XLM U11 ( .A0(n11), .A1(asynchronous_data[4]), .B0(n10), .B1(
        synchronous_data[4]), .Y(n6) );
  AO22XLM U12 ( .A0(n11), .A1(asynchronous_data[3]), .B0(n10), .B1(
        synchronous_data[3]), .Y(n5) );
  AO22XLM U13 ( .A0(n11), .A1(asynchronous_data[2]), .B0(n10), .B1(
        synchronous_data[2]), .Y(n4) );
  AO22XLM U14 ( .A0(n11), .A1(asynchronous_data[0]), .B0(n10), .B1(
        synchronous_data[0]), .Y(n2) );
endmodule


module reset_synchronizer_0 ( clk, reset_n, reset_synchronized );
  input clk, reset_n;
  output reset_synchronized;
  wire   \Q[0] ;

  DFFRQX1M \Q_reg[0]  ( .D(1'b1), .CK(clk), .RN(reset_n), .Q(\Q[0] ) );
  DFFRQX2M \Q_reg[1]  ( .D(\Q[0] ), .CK(clk), .RN(reset_n), .Q(
        reset_synchronized) );
endmodule


module system_top ( ref_clk, uart_clk, reset_n, ser_data_in, ser_data_out, 
        frame_error, par_error );
  input ref_clk, uart_clk, reset_n, ser_data_in;
  output ser_data_out, frame_error, par_error;
  wire   ref_reset_n_synchronized, alu_result_valid,
         register_file_read_data_valid,
         uart_transmitter_q_pulse_generator_sync, uart_transmitter_busy_sync,
         receiver_parallel_data_valid_sync, alu_en, alu_clk_en,
         transmitter_parallel_data_valid, register_file_write_en,
         register_file_read_en, alu_clk, uart_transmitter_busy,
         uart_transmitter_q_pulse_generator, receiver_parallel_data_valid,
         uart_reset_n_synchronized, uart_transmitter_clk,
         transmitter_parallel_data_valid_sync, n1, n2;
  wire   [15:0] alu_result;
  wire   [7:0] register_file_read_data;
  wire   [7:0] receiver_parallel_data_sync;
  wire   [3:0] alu_function;
  wire   [7:0] transmitter_parallel_data;
  wire   [7:0] register_file_write_data;
  wire   [3:0] register_file_address;
  wire   [7:0] alu_operand_a;
  wire   [7:0] alu_operand_b;
  wire   [7:0] uart_parity_config;
  wire   [7:0] uart_prescale_config;
  wire   [7:0] receiver_parallel_data;
  wire   [7:0] transmitter_parallel_data_sync;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  reset_synchronizer_1 reset_synchronizer_inst_0 ( .clk(ref_clk), .reset_n(
        reset_n), .reset_synchronized(ref_reset_n_synchronized) );
  system_controller system_controller_inst ( .clk(ref_clk), .reset_n(n2), 
        .alu_result_valid(alu_result_valid), .alu_result(alu_result), 
        .register_file_read_data_valid(register_file_read_data_valid), 
        .register_file_read_data(register_file_read_data), 
        .transmitter_busy_sync(uart_transmitter_busy_sync), 
        .transmitter_q_pulse_generator(uart_transmitter_q_pulse_generator_sync), .receiver_parallel_data_valid_sync(receiver_parallel_data_valid_sync), 
        .receiver_parallel_data_sync(receiver_parallel_data_sync), 
        .alu_function(alu_function), .alu_en(alu_en), .alu_clk_en(alu_clk_en), 
        .transmitter_parallel_data_valid(transmitter_parallel_data_valid), 
        .transmitter_parallel_data(transmitter_parallel_data), 
        .register_file_address(register_file_address), 
        .register_file_write_data(register_file_write_data), 
        .register_file_read_en(register_file_read_en), 
        .register_file_write_en_BAR(register_file_write_en) );
  clock_gating_cell clock_gating_cell_inst ( .clk(ref_clk), .clk_en(alu_clk_en), .gated_clk(alu_clk) );
  alu alu_inst ( .clk(alu_clk), .reset_n(n2), .A(alu_operand_a), .B(
        alu_operand_b), .alu_function(alu_function), .enable(alu_en), 
        .alu_result_valid(alu_result_valid), .alu_result(alu_result) );
  register_file register_file_inst ( .clk(ref_clk), .reset_n(n2), .address(
        register_file_address), .write_data(register_file_write_data), 
        .read_en(register_file_read_en), .read_data_valid(
        register_file_read_data_valid), .read_data(register_file_read_data), 
        .register0(alu_operand_a), .register1(alu_operand_b), .register2({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        uart_parity_config[1:0]}), .register3({SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, uart_prescale_config[5:0]}), .write_en_BAR(
        register_file_write_en) );
  bus_synchronizer_3 bus_synchronizer_inst_0 ( .clk(ref_clk), .reset_n(n2), 
        .asynchronous_data(uart_transmitter_busy), .synchronous_data(
        uart_transmitter_busy_sync) );
  bus_synchronizer_2 bus_synchronizer_inst_1 ( .clk(ref_clk), .reset_n(n2), 
        .asynchronous_data(uart_transmitter_q_pulse_generator), 
        .synchronous_data(uart_transmitter_q_pulse_generator_sync) );
  data_synchronizer_1 data_synchronizer_inst_0 ( .clk(ref_clk), .reset_n(n2), 
        .asynchronous_data_valid(receiver_parallel_data_valid), 
        .asynchronous_data(receiver_parallel_data), .synchronous_data_valid(
        receiver_parallel_data_valid_sync), .synchronous_data(
        receiver_parallel_data_sync) );
  reset_synchronizer_0 reset_synchronizer_inst_1 ( .clk(uart_clk), .reset_n(
        reset_n), .reset_synchronized(uart_reset_n_synchronized) );
  uart uart_inst ( .transmitter_clk(uart_transmitter_clk), .receiver_clk(
        uart_clk), .reset_n(uart_reset_n_synchronized), .par_en(
        uart_parity_config[0]), .par_type(uart_parity_config[1]), .prescale(
        uart_prescale_config[5:0]), .transmitter_parallel_data_valid(
        transmitter_parallel_data_valid_sync), .transmitter_parallel_data(
        transmitter_parallel_data_sync), .receiver_ser_data(n1), 
        .transmitter_ser_data(ser_data_out), .transmitter_busy(
        uart_transmitter_busy), .receiver_parallel_data_valid(
        receiver_parallel_data_valid), .receiver_parallel_data(
        receiver_parallel_data), .receiver_par_error(par_error), 
        .receiver_frame_error(frame_error) );
  clock_divider clock_divider_inst ( .ref_clk(uart_clk), .reset_n(
        uart_reset_n_synchronized), .clk_divider_en(1'b1), .division_ratio(
        uart_prescale_config[5:0]), .output_clk(uart_transmitter_clk) );
  data_synchronizer_0 data_synchronizer_inst_1 ( .clk(uart_transmitter_clk), 
        .reset_n(uart_reset_n_synchronized), .asynchronous_data_valid(
        transmitter_parallel_data_valid), .asynchronous_data(
        transmitter_parallel_data), .Q_pulse_generator(
        uart_transmitter_q_pulse_generator), .synchronous_data_valid(
        transmitter_parallel_data_valid_sync), .synchronous_data(
        transmitter_parallel_data_sync) );
  CLKBUFX4M U3 ( .A(ser_data_in), .Y(n1) );
  CLKBUFX4M U4 ( .A(ref_reset_n_synchronized), .Y(n2) );
endmodule

