 `timescale 1ps / 1ps
`define PERIOD 10000

module sorter_tb;
    reg clk;
    reg ena;
    reg rst;
    wire [31:0] dout;
    wire [7:0] out_cnt;
    wire finished;
    wire started;
    reg [31:0] fp;
    
    Sorter sorter(clk, ena, rst, dout, out_cnt, started, finished);

    always begin
        #(`PERIOD/2) clk = ~clk;
    end

    initial begin
        fp = $fopen("sorter_out.txt","w");
        clk = 0;
        ena = 0;
        rst = 0;
        #(30*`PERIOD) rst = 1;
        #(2*`PERIOD) rst = 0;
        #(2*`PERIOD) ena = 1;

        #(400*`PERIOD) 
        $fclose("sorter_out.txt");
        $finish;
    end

    always @ (out_cnt) begin
        if(out_cnt <= 8'd127 & ena) begin
            $fdisplay(fp, "%d", dout);
        end
    end 

    always @(posedge started ) begin
        $fdisplay(fp, "%d", dout);      // write the first output when out_cnt == 0
    end


endmodule