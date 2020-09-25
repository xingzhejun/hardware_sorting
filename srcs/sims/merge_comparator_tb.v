module merge_comparator_tb;

    reg [31:0] a_in;
    reg [31:0] b_in;
    reg ena;
    reg clk;
    wire [31:0] data_out;
    wire pop_a;
    wire pop_b;
    wire valid;

    MergeComparator cmp(a_in,b_in,ena,clk,data_out,pop_a,pop_b,valid);

    initial
    begin
        clk = 0;
        ena = 0;
        a_in = 32'd3524;
        b_in = 32'd242;

        #110
        ena = 1;
        #10 a_in = 32'd241;
        #10 a_in = 32'd3532;
        #10 b_in = 32'd39139;
        #10 b_in = 32'd234;

        
        ena = 0;

        
        #10 a_in = 32'd241;
        #10 a_in = 32'd3532;
        #10 b_in = 32'd39139;
        #10 b_in = 32'd234;

        #10 $finish;
    end

    always
    begin
        #2 clk = ~clk;

    end


endmodule