module SortingNetwork (
    input wire [511:0] data_in,     // 16*32bit, is splitted afterward
    input wire clk,                 // posedge triggered
    input wire ena,                 // enable sorting
    input wire rst,                 // reset when rst == 1
    output reg [511:0] data_out,   // 16*32bit, is splitted afterward
    output wire valid               // data_out is valid after 12 clock cycles enabled 
    );
    // pipelined synchronous Batcher’s odd-even merge sort network with 16-inputs and 16-outputs  

    // valid signal
    reg [3:0] cnt;
    assign valid = (cnt >= 4'd12);

    // pipeline registers
    wire [31:0] data_in_1 [0:15];
    wire [31:0] data_out_1 [0:15];
    wire [31:0] data_in_2 [0:15];
    wire [31:0] data_out_2 [0:15];
    wire [31:0] data_in_3 [0:15];
    wire [31:0] data_out_3 [0:15];
    wire [31:0] data_in_4 [0:15];
    wire [31:0] data_out_4 [0:15];
    wire [31:0] data_in_5 [0:15];
    wire [31:0] data_out_5 [0:15];
    wire [31:0] data_in_6 [0:15];
    wire [31:0] data_out_6 [0:15];
    wire [31:0] data_in_7 [0:15];
    wire [31:0] data_out_7 [0:15];
    wire [31:0] data_in_8 [0:15];
    wire [31:0] data_out_8 [0:15];
    wire [31:0] data_in_9 [0:15];
    wire [31:0] data_out_9 [0:15];
    wire [31:0] data_in_10 [0:15];
    wire [31:0] data_out_10 [0:15];
    
    reg [511:0] reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10;
    assign {data_in_1[0], data_in_1[1], data_in_1[2], data_in_1[3], 
            data_in_1[4], data_in_1[5], data_in_1[6], data_in_1[7], 
            data_in_1[8], data_in_1[9], data_in_1[10], data_in_1[11], 
            data_in_1[12], data_in_1[13], data_in_1[14], data_in_1[15]} = reg1;
    assign {data_in_2[0], data_in_2[1], data_in_2[2], data_in_2[3], 
            data_in_2[4], data_in_2[5], data_in_2[6], data_in_2[7], 
            data_in_2[8], data_in_2[9], data_in_2[10], data_in_2[11], 
            data_in_2[12], data_in_2[13], data_in_2[14], data_in_2[15]} = reg2;
    assign {data_in_3[0], data_in_3[1], data_in_3[2], data_in_3[3], 
            data_in_3[4], data_in_3[5], data_in_3[6], data_in_3[7], 
            data_in_3[8], data_in_3[9], data_in_3[10], data_in_3[11], 
            data_in_3[12], data_in_3[13], data_in_3[14], data_in_3[15]} = reg3;
    assign {data_in_4[0], data_in_4[1], data_in_4[2], data_in_4[3], 
            data_in_4[4], data_in_4[5], data_in_4[6], data_in_4[7], 
            data_in_4[8], data_in_4[9], data_in_4[10], data_in_4[11], 
            data_in_4[12], data_in_4[13], data_in_4[14], data_in_4[15]} = reg4;
    assign {data_in_5[0], data_in_5[1], data_in_5[2], data_in_5[3], 
            data_in_5[4], data_in_5[5], data_in_5[6], data_in_5[7], 
            data_in_5[8], data_in_5[9], data_in_5[10], data_in_5[11], 
            data_in_5[12], data_in_5[13], data_in_5[14], data_in_5[15]} = reg5;
    assign {data_in_6[0], data_in_6[1], data_in_6[2], data_in_6[3], 
            data_in_6[4], data_in_6[5], data_in_6[6], data_in_6[7], 
            data_in_6[8], data_in_6[9], data_in_6[10], data_in_6[11], 
            data_in_6[12], data_in_6[13], data_in_6[14], data_in_6[15]} = reg6;
    assign {data_in_7[0], data_in_7[1], data_in_7[2], data_in_7[3], 
            data_in_7[4], data_in_7[5], data_in_7[6], data_in_7[7], 
            data_in_7[8], data_in_7[9], data_in_7[10], data_in_7[11], 
            data_in_7[12], data_in_7[13], data_in_7[14], data_in_7[15]} = reg7;
    assign {data_in_8[0], data_in_8[1], data_in_8[2], data_in_8[3], 
            data_in_8[4], data_in_8[5], data_in_8[6], data_in_8[7], 
            data_in_8[8], data_in_8[9], data_in_8[10], data_in_8[11], 
            data_in_8[12], data_in_8[13], data_in_8[14], data_in_8[15]} = reg8;
    assign {data_in_9[0], data_in_9[1], data_in_9[2], data_in_9[3], 
            data_in_9[4], data_in_9[5], data_in_9[6], data_in_9[7], 
            data_in_9[8], data_in_9[9], data_in_9[10], data_in_9[11], 
            data_in_9[12], data_in_9[13], data_in_9[14], data_in_9[15]} = reg9;
    assign {data_in_10[0], data_in_10[1], data_in_10[2], data_in_10[3], 
            data_in_10[4], data_in_10[5], data_in_10[6], data_in_10[7], 
            data_in_10[8], data_in_10[9], data_in_10[10], data_in_10[11], 
            data_in_10[12], data_in_10[13], data_in_10[14], data_in_10[15]} = reg10;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cnt <= 0;
        end else if (ena) begin
            
            // 
            reg1 <= data_in;
            reg2 <= {data_out_1[0], data_out_1[1], data_out_1[2], data_out_1[3], 
                    data_out_1[4], data_out_1[5], data_out_1[6], data_out_1[7], 
                    data_out_1[8], data_out_1[9], data_out_1[10], data_out_1[11], 
                    data_out_1[12], data_out_1[13], data_out_1[14], data_out_1[15]};
            reg3 <= {data_out_2[0], data_out_2[1], data_out_2[2], data_out_2[3], 
                    data_out_2[4], data_out_2[5], data_out_2[6], data_out_2[7], 
                    data_out_2[8], data_out_2[9], data_out_2[10], data_out_2[11], 
                    data_out_2[12], data_out_2[13], data_out_2[14], data_out_2[15]};
            reg4 <= {data_out_3[0], data_out_3[1], data_out_3[2], data_out_3[3], 
                    data_out_3[4], data_out_3[5], data_out_3[6], data_out_3[7], 
                    data_out_3[8], data_out_3[9], data_out_3[10], data_out_3[11], 
                    data_out_3[12], data_out_3[13], data_out_3[14], data_out_3[15]};
            reg5 <= {data_out_4[0], data_out_4[1], data_out_4[2], data_out_4[3], 
                    data_out_4[4], data_out_4[5], data_out_4[6], data_out_4[7], 
                    data_out_4[8], data_out_4[9], data_out_4[10], data_out_4[11], 
                    data_out_4[12], data_out_4[13], data_out_4[14], data_out_4[15]};
            reg6 <= {data_out_5[0], data_out_5[1], data_out_5[2], data_out_5[3], 
                    data_out_5[4], data_out_5[5], data_out_5[6], data_out_5[7], 
                    data_out_5[8], data_out_5[9], data_out_5[10], data_out_5[11], 
                    data_out_5[12], data_out_5[13], data_out_5[14], data_out_5[15]};
            reg7 <= {data_out_6[0], data_out_6[1], data_out_6[2], data_out_6[3], 
                    data_out_6[4], data_out_6[5], data_out_6[6], data_out_6[7], 
                    data_out_6[8], data_out_6[9], data_out_6[10], data_out_6[11], 
                    data_out_6[12], data_out_6[13], data_out_6[14], data_out_6[15]};
            reg8 <= {data_out_7[0], data_out_7[1], data_out_7[2], data_out_7[3], 
                    data_out_7[4], data_out_7[5], data_out_7[6], data_out_7[7], 
                    data_out_7[8], data_out_7[9], data_out_7[10], data_out_7[11], 
                    data_out_7[12], data_out_7[13], data_out_7[14], data_out_7[15]};
            reg9 <= {data_out_8[0], data_out_8[1], data_out_8[2], data_out_8[3], 
                    data_out_8[4], data_out_8[5], data_out_8[6], data_out_8[7], 
                    data_out_8[8], data_out_8[9], data_out_8[10], data_out_8[11], 
                    data_out_8[12], data_out_8[13], data_out_8[14], data_out_8[15]};
            reg10 <= {data_out_9[0], data_out_9[1], data_out_9[2], data_out_9[3], 
                    data_out_9[4], data_out_9[5], data_out_9[6], data_out_9[7], 
                    data_out_9[8], data_out_9[9], data_out_9[10], data_out_9[11], 
                    data_out_9[12], data_out_9[13], data_out_9[14], data_out_9[15]};

            data_out <= {data_out_10[0], data_out_10[1], data_out_10[2], data_out_10[3], 
                    data_out_10[4], data_out_10[5], data_out_10[6], data_out_10[7], 
                    data_out_10[8], data_out_10[9], data_out_10[10], data_out_10[11], 
                    data_out_10[12], data_out_10[13], data_out_10[14], data_out_10[15]};
            if (cnt >= 4'd15) begin
                cnt <= 4'd12;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

    // add switch comparators
    // -----------------------stage 1----------------------- //
    SwitchComparator cmp1_1(data_in_1[0], data_in_1[1], data_out_1[0], data_out_1[1]);
    SwitchComparator cmp1_2(data_in_1[2], data_in_1[3], data_out_1[2], data_out_1[3]);
    SwitchComparator cmp1_3(data_in_1[4], data_in_1[5], data_out_1[4], data_out_1[5]);
    SwitchComparator cmp1_4(data_in_1[6], data_in_1[7], data_out_1[6], data_out_1[7]);
    SwitchComparator cmp1_5(data_in_1[8], data_in_1[9], data_out_1[8], data_out_1[9]);
    SwitchComparator cmp1_6(data_in_1[10], data_in_1[11], data_out_1[10], data_out_1[11]);
    SwitchComparator cmp1_7(data_in_1[12], data_in_1[13], data_out_1[12], data_out_1[13]);
    SwitchComparator cmp1_8(data_in_1[14], data_in_1[15], data_out_1[14], data_out_1[15]);
    // -----------------------stage 2----------------------- //
    SwitchComparator cmp2_1(data_in_2[0], data_in_2[2], data_out_2[0], data_out_2[2]);
    SwitchComparator cmp2_2(data_in_2[1], data_in_2[3], data_out_2[1], data_out_2[3]);
    SwitchComparator cmp2_3(data_in_2[4], data_in_2[6], data_out_2[4], data_out_2[6]);
    SwitchComparator cmp2_4(data_in_2[5], data_in_2[7], data_out_2[5], data_out_2[7]);
    SwitchComparator cmp2_5(data_in_2[8], data_in_2[10], data_out_2[8], data_out_2[10]);
    SwitchComparator cmp2_6(data_in_2[9], data_in_2[11], data_out_2[9], data_out_2[11]);
    SwitchComparator cmp2_7(data_in_2[12], data_in_2[14], data_out_2[12], data_out_2[14]);
    SwitchComparator cmp2_8(data_in_2[13], data_in_2[15], data_out_2[13], data_out_2[15]);
    // -----------------------stage 3----------------------- //
    SwitchComparator cmp3_1(data_in_3[1], data_in_3[2], data_out_3[1], data_out_3[2]);
    SwitchComparator cmp3_2(data_in_3[5], data_in_3[6], data_out_3[5], data_out_3[6]);
    SwitchComparator cmp3_3(data_in_3[9], data_in_3[10], data_out_3[9], data_out_3[10]);
    SwitchComparator cmp3_4(data_in_3[13], data_in_3[14], data_out_3[13], data_out_3[14]);
    assign data_out_3[0] = data_in_3[0];
    assign data_out_3[3] = data_in_3[3];
    assign data_out_3[4] = data_in_3[4];
    assign data_out_3[7] = data_in_3[7];
    assign data_out_3[8] = data_in_3[8];
    assign data_out_3[11] = data_in_3[11];
    assign data_out_3[12] = data_in_3[12];
    assign data_out_3[15] = data_in_3[15];
    // -----------------------stage 4----------------------- //
    SwitchComparator cmp4_1(data_in_4[0], data_in_4[4], data_out_4[0], data_out_4[4]);
    SwitchComparator cmp4_2(data_in_4[1], data_in_4[5], data_out_4[1], data_out_4[5]);
    SwitchComparator cmp4_3(data_in_4[2], data_in_4[6], data_out_4[2], data_out_4[6]);
    SwitchComparator cmp4_4(data_in_4[3], data_in_4[7], data_out_4[3], data_out_4[7]);
    SwitchComparator cmp4_5(data_in_4[8], data_in_4[12], data_out_4[8], data_out_4[12]);
    SwitchComparator cmp4_6(data_in_4[9], data_in_4[13], data_out_4[9], data_out_4[13]);
    SwitchComparator cmp4_7(data_in_4[10], data_in_4[14], data_out_4[10], data_out_4[14]);
    SwitchComparator cmp4_8(data_in_4[11], data_in_4[15], data_out_4[11], data_out_4[15]);
    // -----------------------stage 5----------------------- //
    SwitchComparator cmp5_1(data_in_5[3], data_in_5[5], data_out_5[3], data_out_5[5]);
    SwitchComparator cmp5_2(data_in_5[4], data_in_5[6], data_out_5[4], data_out_5[6]);
    SwitchComparator cmp5_3(data_in_5[10], data_in_5[12], data_out_5[10], data_out_5[12]);
    SwitchComparator cmp5_4(data_in_5[11], data_in_5[13], data_out_5[11], data_out_5[13]);
    assign data_out_5[0] = data_in_5[0];
    assign data_out_5[1] = data_in_5[1];
    assign data_out_5[2] = data_in_5[2];
    assign data_out_5[7] = data_in_5[7];
    assign data_out_5[8] = data_in_5[8];
    assign data_out_5[9] = data_in_5[9];
    assign data_out_5[14] = data_in_5[14];
    assign data_out_5[15] = data_in_5[15];
    // -----------------------stage 6----------------------- //
    SwitchComparator cmp6_1(data_in_6[1], data_in_6[2], data_out_6[1], data_out_6[2]);
    SwitchComparator cmp6_2(data_in_6[3], data_in_6[4], data_out_6[3], data_out_6[4]);
    SwitchComparator cmp6_3(data_in_6[5], data_in_6[6], data_out_6[5], data_out_6[6]);
    SwitchComparator cmp6_4(data_in_6[9], data_in_6[10], data_out_6[9], data_out_6[10]);
    SwitchComparator cmp6_5(data_in_6[11], data_in_6[12], data_out_6[11], data_out_6[12]);
    SwitchComparator cmp6_6(data_in_6[13], data_in_6[14], data_out_6[13], data_out_6[14]);
    assign data_out_6[0] = data_in_6[0];
    assign data_out_6[7] = data_in_6[7];
    assign data_out_6[8] = data_in_6[8];
    assign data_out_6[15] = data_in_6[15];
    // -----------------------stage 7----------------------- //
    SwitchComparator cmp7_1(data_in_7[0], data_in_7[8], data_out_7[0], data_out_7[8]);
    SwitchComparator cmp7_2(data_in_7[1], data_in_7[9], data_out_7[1], data_out_7[9]);
    SwitchComparator cmp7_3(data_in_7[2], data_in_7[10], data_out_7[2], data_out_7[10]);
    SwitchComparator cmp7_4(data_in_7[3], data_in_7[11], data_out_7[3], data_out_7[11]);
    SwitchComparator cmp7_5(data_in_7[4], data_in_7[12], data_out_7[4], data_out_7[12]);
    SwitchComparator cmp7_6(data_in_7[5], data_in_7[13], data_out_7[5], data_out_7[13]);
    SwitchComparator cmp7_7(data_in_7[6], data_in_7[14], data_out_7[6], data_out_7[14]);
    SwitchComparator cmp7_8(data_in_7[7], data_in_7[15], data_out_7[7], data_out_7[15]);
    // -----------------------stage 8----------------------- //
    SwitchComparator cmp8_1(data_in_8[4], data_in_8[8], data_out_8[4], data_out_8[8]);
    SwitchComparator cmp8_2(data_in_8[5], data_in_8[9], data_out_8[5], data_out_8[9]);
    SwitchComparator cmp8_3(data_in_8[6], data_in_8[10], data_out_8[6], data_out_8[10]);
    SwitchComparator cmp8_4(data_in_8[7], data_in_8[11], data_out_8[7], data_out_8[11]);
    assign data_out_8[0] = data_in_8[0];
    assign data_out_8[1] = data_in_8[1];
    assign data_out_8[2] = data_in_8[2];
    assign data_out_8[3] = data_in_8[3];
    assign data_out_8[12] = data_in_8[12];
    assign data_out_8[13] = data_in_8[13];
    assign data_out_8[14] = data_in_8[14];
    assign data_out_8[15] = data_in_8[15];
    // -----------------------stage 9----------------------- //
    SwitchComparator cmp9_1(data_in_9[2], data_in_9[4], data_out_9[2], data_out_9[4]);
    SwitchComparator cmp9_2(data_in_9[3], data_in_9[5], data_out_9[3], data_out_9[5]);
    SwitchComparator cmp9_3(data_in_9[6], data_in_9[8], data_out_9[6], data_out_9[8]);
    SwitchComparator cmp9_4(data_in_9[7], data_in_9[9], data_out_9[7], data_out_9[9]);
    SwitchComparator cmp9_5(data_in_9[10], data_in_9[12], data_out_9[10], data_out_9[12]);
    SwitchComparator cmp9_6(data_in_9[11], data_in_9[13], data_out_9[11], data_out_9[13]);
    assign data_out_9[0] = data_in_9[0];
    assign data_out_9[1] = data_in_9[1];
    assign data_out_9[14] = data_in_9[14];
    assign data_out_9[15] = data_in_9[15];
    // -----------------------stage 10----------------------- //
    SwitchComparator cmp10_1(data_in_10[1], data_in_10[2], data_out_10[1], data_out_10[2]);
    SwitchComparator cmp10_2(data_in_10[3], data_in_10[4], data_out_10[3], data_out_10[4]);
    SwitchComparator cmp10_3(data_in_10[5], data_in_10[6], data_out_10[5], data_out_10[6]);
    SwitchComparator cmp10_4(data_in_10[7], data_in_10[8], data_out_10[7], data_out_10[8]);
    SwitchComparator cmp10_5(data_in_10[9], data_in_10[10], data_out_10[9], data_out_10[10]);
    SwitchComparator cmp10_6(data_in_10[11], data_in_10[12], data_out_10[11], data_out_10[12]);
    SwitchComparator cmp10_7(data_in_10[13], data_in_10[14], data_out_10[13], data_out_10[14]);
    assign data_out_10[0] = data_in_10[0];
    assign data_out_10[15] = data_in_10[15];
    // --------------------------end------------------------- //
endmodule