module InputBuffer (
    input wire [31:0] din,
    input wire i_enq,           // enqueue this buffer
    input wire clk,             // i/o at posedge
    input wire rst,             // reset when rst == 1
    input wire full,            // output fifo is full
    output wire [31:0] dout,
    output wire i_full,         // this buffer is full
    output wire enq             // enqueue output fifo
    );
    // input buffer for merge sorter tree
    // output the first 16 inputs, then output uint32max
    
    wire [31:0] f_dout;
    wire f_deq, f_empty;
    reg [4:0] ecnt;
    reg ecntz;

    wire f_full;
    wire f_cnt;
    FIFO2 #32 fifo2(.clk(clk), .rst(rst), .enq(i_enq), .deq(f_deq), .din(din), 
                    .dout(f_dout), .empty(f_empty), .full(f_full), .out_cnt(f_cnt));

    assign i_full = f_deq ? 0 : f_full;

    assign enq = !full && (!f_empty || ecntz);
    assign f_deq = enq && (ecnt != 0);

    assign dout = ecntz ? 32'hffffffff : f_dout;    // output uint32_max after the first 16 numbers 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            ecnt <= 5'd16;
            ecntz <= 0;
        end else begin
            if(ecnt != 0 && enq) begin
                ecnt <= ecnt - 1;
            end
            if(ecnt == 1 && enq) begin
                ecntz <= 1;
            end
        end
    end

endmodule