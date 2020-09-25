module fifo_tb;

    reg clk;

    wire full;
    reg [31:0] din;
    reg [31:0] wr_en;
    wire empty;
    wire [31:0] dout;
    reg rd_en;
    reg rst;
    wire wr_clk;
    wire rd_clk;
    wire wr_rst_busy;
    wire rd_rst_busy;

    FIFO fifo(
    .full(full),
    .din(din),
    .wr_en(wr_en),
    .empty(empty),
    .dout(dout),
    .rd_en(rd_en),
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .wr_rst_busy(wr_rst_busy),
    .rd_rst_busy(rd_rst_busy)
    );

    initial clk=1;
    always begin
        #1 clk=~clk;
    end
    assign wr_clk=clk;
    assign rd_clk=~clk;
    initial begin
    //     // 
    //     full;
    // reg [31:0] din;
    // reg [31:0] wr_en;
    // wire empty;
    // wire [31:0] dout;
    // reg rd_en;
    // reg rst;
    // reg wr_clk;
    // reg rd_clk;
    // wire wr_rst_busy;
    // wire rd_rst_busy;
        din=32'd4532;
        wr_en=0;
        rd_en=0;
        rst=0;
        #100 rst=1;
        #2 rst=0;
        #30
        #25 wr_en=1;
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
        #2 wr_en=0;
        #5 rd_en=1;
        #50 $finish;
    end


endmodule
