module merge_sorting_tree_tb;

    reg [255:0] din;     // 8*32bit
    reg [7:0] enq;       // select which way to enqueue
    reg clk;             // posedge
    reg irst;            // input buffer reset
    reg frst;            // fifo reset
    reg deq;             // dequeue this tree
    wire [31:0] dout;
    wire [7:0] full;     // this tree is full
    wire empty;           // this tree (f01 node) is empty

    wire [31:0] d00, d01, d02, d03, d04, d05, d06, d07;
    assign {d00, d01, d02, d03, d04, d05, d06, d07} = din;

    wire f01_enq, f01_deq, f01_empty, f01_full; wire [31:0] f01_din, f01_dout;
    wire f02_enq, f02_deq, f02_empty, f02_full; wire [31:0] f02_din, f02_dout;
    wire f03_enq, f03_deq, f03_empty, f03_full; wire [31:0] f03_din, f03_dout;
    wire f04_enq, f04_deq, f04_empty, f04_full; wire [31:0] f04_din, f04_dout;
    wire f05_enq, f05_deq, f05_empty, f05_full; wire [31:0] f05_din, f05_dout;
    wire f06_enq, f06_deq, f06_empty, f06_full; wire [31:0] f06_din, f06_dout;
    wire f07_enq, f07_deq, f07_empty, f07_full; wire [31:0] f07_din, f07_dout;
    wire f08_enq, f08_deq, f08_empty, f08_full; wire [31:0] f08_din, f08_dout;
    wire f09_enq, f09_deq, f09_empty, f09_full; wire [31:0] f09_din, f09_dout;
    wire f10_enq, f10_deq, f10_empty, f10_full; wire [31:0] f10_din, f10_dout;
    wire f11_enq, f11_deq, f11_empty, f11_full; wire [31:0] f11_din, f11_dout;
    wire f12_enq, f12_deq, f12_empty, f12_full; wire [31:0] f12_din, f12_dout;
    wire f13_enq, f13_deq, f13_empty, f13_full; wire [31:0] f13_din, f13_dout;
    wire f14_enq, f14_deq, f14_empty, f14_full; wire [31:0] f14_din, f14_dout;
    wire f15_enq, f15_deq, f15_empty, f15_full; wire [31:0] f15_din, f15_dout;

    InputBuffer in08(d00, enq[0], clk, irst, f08_full, f08_din, full[0], f08_enq);
    InputBuffer in09(d01, enq[1], clk, irst, f09_full, f09_din, full[1], f09_enq);
    InputBuffer in10(d02, enq[2], clk, irst, f10_full, f10_din, full[2], f10_enq);
    InputBuffer in11(d03, enq[3], clk, irst, f11_full, f11_din, full[3], f11_enq);
    InputBuffer in12(d04, enq[4], clk, irst, f12_full, f12_din, full[4], f12_enq);
    InputBuffer in13(d05, enq[5], clk, irst, f13_full, f13_din, full[5], f13_enq);
    InputBuffer in14(d06, enq[6], clk, irst, f14_full, f14_din, full[6], f14_enq);
    InputBuffer in15(d07, enq[7], clk, irst, f15_full, f15_din, full[7], f15_enq);

    FIFO2 #32 f01(f01_din, f01_enq, clk, frst, f01_deq, f01_dout, f01_empty, f01_full);
    FIFO2 #32 f02(f02_din, f02_enq, clk, frst, f02_deq, f02_dout, f02_empty, f02_full);
    FIFO2 #32 f03(f03_din, f03_enq, clk, frst, f03_deq, f03_dout, f03_empty, f03_full);
    FIFO2 #32 f04(f04_din, f04_enq, clk, frst, f04_deq, f04_dout, f04_empty, f04_full);
    FIFO2 #32 f05(f05_din, f05_enq, clk, frst, f05_deq, f05_dout, f05_empty, f05_full);
    FIFO2 #32 f06(f06_din, f06_enq, clk, frst, f06_deq, f06_dout, f06_empty, f06_full);
    FIFO2 #32 f07(f07_din, f07_enq, clk, frst, f07_deq, f07_dout, f07_empty, f07_full);
    FIFO2 #32 f08(f08_din, f08_enq, clk, frst, f08_deq, f08_dout, f08_empty, f08_full);
    FIFO2 #32 f09(f09_din, f09_enq, clk, frst, f09_deq, f09_dout, f09_empty, f09_full);
    FIFO2 #32 f10(f10_din, f10_enq, clk, frst, f10_deq, f10_dout, f10_empty, f10_full);
    FIFO2 #32 f11(f11_din, f11_enq, clk, frst, f11_deq, f11_dout, f11_empty, f11_full);
    FIFO2 #32 f12(f12_din, f12_enq, clk, frst, f12_deq, f12_dout, f12_empty, f12_full);
    FIFO2 #32 f13(f13_din, f13_enq, clk, frst, f13_deq, f13_dout, f13_empty, f13_full);
    FIFO2 #32 f14(f14_din, f14_enq, clk, frst, f14_deq, f14_dout, f14_empty, f14_full);
    FIFO2 #32 f15(f15_din, f15_enq, clk, frst, f15_deq, f15_dout, f15_empty, f15_full);

    MergeComparator M01(f02_dout, f03_dout, !f02_empty, !f03_empty, f01_full, f01_din, f01_enq, f02_deq, f03_deq);
    MergeComparator M02(f04_dout, f05_dout, !f04_empty, !f05_empty, f02_full, f02_din, f02_enq, f04_deq, f05_deq);
    MergeComparator M03(f06_dout, f07_dout, !f06_empty, !f07_empty, f03_full, f03_din, f03_enq, f06_deq, f07_deq);
    MergeComparator M04(f08_dout, f09_dout, !f08_empty, !f09_empty, f04_full, f04_din, f04_enq, f08_deq, f09_deq);
    MergeComparator M05(f10_dout, f11_dout, !f10_empty, !f11_empty, f05_full, f05_din, f05_enq, f10_deq, f11_deq);
    MergeComparator M06(f12_dout, f13_dout, !f12_empty, !f13_empty, f06_full, f06_din, f06_enq, f12_deq, f13_deq);
    MergeComparator M07(f14_dout, f15_dout, !f14_empty, !f15_empty, f07_full, f07_din, f07_enq, f14_deq, f15_deq);

    assign f01_deq = deq;
    assign dout = f01_dout;
    assign empty = f01_empty;

    // reg [255:0] din,     // 8*32bit
    // reg [7:0] enq,       // select which way to enqueue
    // reg clk,             // posedge
    // reg irst,            // input buffer reset
    // reg frst,            // fifo reset
    // reg deq,             // dequeue this tree
    // wire [31:0] dout,
    // wire [7:0] full,     // this tree is full
    // wire empty;           // this tree (f01 node) is empty

    initial begin
        clk = 0;
        din = 0;
        irst = 0;
        frst = 0;
        deq = 0;
        enq = 0;

        #30
        irst = 1;
        frst = 1;

        #2
        irst = 0;
        frst = 0;

        #2 
        din = 256'h183baf339ec40b32183baf339ec40b32183baf339ec40b32183baf339ec40b32;
        
        enq = 8'hff;

        #50 deq = 1;
        #50 $finish;
    end
    
    always begin
        #1 clk = ~clk;
    end

endmodule