module alu(input logic [31:0] A, B,
    input logic [2:0] F,
    output logic [31:0] Y,
    output logic Zero);

    logic [31:0] S, Bout;

    assign Bout = F[2] ? ~B : B;
    assign S = A + Bout + F[2];

    always_comb
        case (F[1:0])
            2'b00: Y <=A & Bout;
            2'b01: Y <=A | Bout;
            2'b10: Y <=S;
            2'b11: Y <=S[31];
        endcase
    assign Zero = (Y == 32'b0);
endmodule

