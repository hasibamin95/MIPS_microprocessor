module testbench();
    logic clk;
    logic reset;
    logic [31:0] writedata, dataadr;
    logic memwrite;
    // instantiate device to be tested
    top dut (clk, reset, writedata, dataadr, memwrite);
    // initialize test
    initial
    begin
        reset <= 1; # 22; reset <= 0;
    end
    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    // check results
    always @(negedge clk)
    begin
        if (memwrite) begin
                $display("Simulation succeeded");
                $stop;
        end
    end

endmodule
