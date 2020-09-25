module SwitchComparator (
    input wire [31:0] a_in,
    input wire [31:0] b_in,
    output wire [31:0] a_out,
    output wire [31:0] b_out
    );
    // make sure b_out <= a_out
    assign a_out = (a_in < b_in) ? b_in : a_in;
    assign b_out = (a_in < b_in) ? a_in : b_in;
    
endmodule
