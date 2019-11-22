module regfile(input logic clk,
    input logic we3,
    input logic [4:0] ra1, ra2, wa3,
    input logic [31:0] wd3,
    output logic [31:0] rd1, rd2);
    logic [31:0] rf[18:0];
    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clk
    // register 0 hardwired to 0
    assign rf[0] = 0;
    always_ff @(posedge clk)
        if (we3) rf[wa3] <= wd3;
    assign rd1 = rf[ra1];
    assign rd2 = rf[ra2];
endmodule
