module MergeComparator(
    input wire [31:0] din_1,    
    input wire [31:0] din_2,
    input wire valid_1,
    input wire valid_2,
    input wire full,            // output fifo is full
    output wire [31:0] dout,
    output wire enq,            // enqueue output fifo
    output wire deq_1,          // dequeue input 1
    output wire deq_2           // dequeue input 2
    );
    wire cmp = (din_1 < din_2);

    assign dout = cmp ? din_1 : din_2;
    assign enq = (!full && valid_1 && valid_2);
    assign deq_1 = cmp && enq;
    assign deq_2 = !cmp && enq;
    
endmodule
