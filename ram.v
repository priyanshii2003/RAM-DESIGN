module sync_ram (
    input clk,
    input we,
    input re,
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] mem [0:15];   // 16 x 8-bit RAM

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;   // Write operation

        if (re)
            dout <= mem[addr];  // Read operation
    end

endmodule
