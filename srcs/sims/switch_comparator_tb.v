module switch_comparator_tb;

    reg [31:0] a,b;
    wire [31:0] aa,bb;
    SwitchComparator cmp(a,b,aa,bb);
    initial
    begin
        a = 32'd0;
        b = 32'd0;
        #10 a = 32'd3543;
        #10 b = 32'd12523;
        #10 b = 32'd153;
        #10 $finish;
    end
endmodule
