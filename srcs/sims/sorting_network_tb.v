module sorting_network_tb;


    reg [31:0] data_in [0:15];
    reg clk;
    reg ena;
    reg rst;
    wire [31:0] data_out [0:15];
    wire valid;

    SortingNetwork sorting_network(data_in[0], data_in[1], data_in[2], data_in[3], 
    data_in[4], data_in[5], data_in[6], data_in[7], data_in[8], data_in[9], data_in[10], 
    data_in[11], data_in[12], data_in[13], data_in[14], data_in[15], clk, ena, rst, 
    data_out[0], data_out[1], data_out[2], data_out[3], data_out[4], data_out[5], 
    data_out[6], data_out[7], data_out[8], data_out[9], data_out[10], data_out[11], 
    data_out[12], data_out[13], data_out[14], data_out[15], valid);

    initial
    begin
        clk = 0;
        rst = 1;
        for(integer i = 0; i < 16; i = i + 1)
            data_in[i] = 32'd0;
        data_in[1] = 32'd3524;
        data_in[3] = 32'd242;
        data_in[6] = 32'd9132;
        data_in[8] = 32'd7132;
        data_in[12] = 32'd9381;
        ena = 0;
        #100 rst = 0;
        #2 rst = 1;
        ena = 1;

        #200 $finish;
    end

    always
    begin
        #2 clk = ~clk;

    end


endmodule