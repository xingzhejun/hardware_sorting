module input_buffer_tb;

    reg clk;
    reg [31:0] din;
    reg i_enq;
    reg rst;
    reg full;
    wire [31:0] dout;
    wire i_full;
    wire enq;
    wire [4:0] ecnt;

    InputBuffer input_buffer(din, i_enq, clk, rst, full, dout, i_full, ecnt, enq);
    // module InputBuffer (
    // input wire [31:0] din,
    // input wire i_enq,           // enqueue this buffer
    // input wire clk,             // i/o at posedge
    // input wire rst,             // reset when rst == 1
    // input wire full,            // output fifo is full
    // output wire [31:0] dout,
    // output wire i_full,         // this buffer is full
    // output wire enq             // enqueue output fifo
    // );

    initial clk=1;
    always begin
        #1 clk=~clk;
    end
    initial begin
    // reg clk;
    // reg [31:0] din;
    // reg i_enq;
    // reg rst;
    // reg full;
    // wire [31:0] dout;
    // wire [31:0] i_full;
    // wire enq;
        din=32'd4532;
        i_enq = 0;
        full = 0;
        rst=0;
        #20 rst=1;
        #2 rst=0;
        #10 i_enq = 1;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #2 din=32'd32651;
        #2 din=32'd65432;
        #20 $finish;
    end


endmodule
