module imem(input logic [5:0] a,
    output logic [31:0] rd);
    logic [31:0] RAM[11:0];

    initial
    $readmemh("/home/vlsi13/cds_digital/mips_final/memfile.txt", RAM);
    assign rd = RAM[a]; // word aligned
endmodule
