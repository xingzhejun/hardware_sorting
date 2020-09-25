module FIFO2 #(parameter WIDTH = 32)(
    input wire [WIDTH-1:0] din,
    input wire enq,                 // enqueue this fifo
    input wire clk,                 // i/o at posedge
    input wire rst,                 // reset when rst == 1
    input wire deq,                 // dequeue this fifo
    output wire [WIDTH-1:0] dout,
    output wire empty,              // this fifo is empty
    output wire full,               // this fifo is full
    output reg out_cnt              // used for counting output
    );
    // fifo of width 32 and depth 2
    // don't consider overflow and underflow. others handle it.

    reg head, tail;
    reg [1:0] cnt;
    reg [WIDTH-1:0] mem [1:0];
    
    assign empty = (cnt == 2'd0);
    assign full = (cnt == 2'd2);
    assign dout = mem[head];

    // register file does not support asynchronous reset
    always @(posedge clk) begin
        if(rst) begin
            cnt <= 2'd0;
            head <= 0;
            tail <= 0;
            out_cnt <= 0;
        end else begin
            case ({enq, deq})
                2'b01: begin
                    head <= ~head;
                    cnt <= cnt - 1;
                    out_cnt = ~out_cnt;
                end
                2'b10: begin
                    mem[tail] <= din;
                    tail <= ~tail;
                    cnt <= cnt + 1;
                end
                2'b11: begin
                    mem[tail] <= din;
                    head <= ~head;
                    tail <= ~tail;
                    out_cnt = ~out_cnt;
                end
            endcase
        end
    end

endmodule