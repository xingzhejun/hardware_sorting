module InputModule (
    input wire [511:0] din,     // sorting network output
    input wire clk, 
    input wire rst, 
    input wire valid,           // sorting network output valid
    input wire full,            // merge sorter tree input buffer is full
    output wire [31:0] im_dout, // this module's data output
    output wire ib_enq,
    output wire req             // data request
    );
    reg [511:0] dout_t;         // shift register to feed 32bit data
    reg [3:0] cnte;             // the number of enqueued elements in one block
    reg cntez;                  // cnte == 0  ?
    reg cntef;                  // cnte == 15 ?
    
    wire [511:0] dout;
    wire f_emp, f_full;
    wire f_enq = valid;                     // (!f_full && d_douten); 
    wire f_deq = (ib_enq && cntef);         // old version may have a bug here!!
    
    assign ib_enq = (~full) & (~f_emp);     // enqueue signal for the next module
    assign req = (f_emp || f_deq);          // note!!!    
    assign im_dout = cntez ? dout[31:0]: dout_t[31:0];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnte <= 0;
        end else begin
            if (ib_enq) cnte <= cnte + 1;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cntez <= 1;
        end else begin
        case ({ib_enq, (cnte == 4'd15)})
            2'b10: cntez <= 0;
            2'b11: cntez <= 1;
        endcase
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cntef <= 0;
        end else begin
        case ({ib_enq, (cnte == 4'd14)})
            2'b10: cntef <= 0;
            2'b11: cntef <= 1;
        endcase
        end
    end
    always @(posedge clk) begin
        case ({ib_enq, cntez})
            2'b10: dout_t <= {32'b0, dout_t[511:32]};
            2'b11: dout_t <= {32'b0, dout[511:32]};
        endcase
    end

    wire f_cnt;

    FIFO2 #512 fifo2(.clk(clk), .rst(rst), .enq(f_enq), .deq(f_deq), .din(din), 
                        .dout(dout), .empty(f_emp), .full(f_full), .out_cnt(f_cnt));
endmodule