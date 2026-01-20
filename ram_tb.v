module sync_ram_tb;

reg clk;
reg we, re;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

sync_ram uut (
    .clk(clk),
    .we(we),
    .re(re),
    .addr(addr),
    .din(din),
    .dout(dout)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, sync_ram_tb);

    clk = 0;
    we = 0; re = 0;
    addr = 0; din = 0;

    // WRITE data
    #10 we = 1; addr = 4'd2; din = 8'hAA;
    #10 we = 1; addr = 4'd4; din = 8'h55;

    // STOP write
    #10 we = 0;

    // READ data
    #10 re = 1; addr = 4'd2;
    #10 re = 1; addr = 4'd4;

    #20 $finish;
end

endmodule
