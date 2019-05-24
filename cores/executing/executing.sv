module executing(
    input logic clk,
    input logic reset,
    input logic [1:0] aluOp,
    input logic [31:0] aluInput0,
    input logic [31:0] aluInput1,
    input logic [5:0] func,
    output logic [31:0] resultOutput,
    output logic isAluOutputZero
);

logic [3:0] aluControl;
logic [3:0] mdluControl;

aritimeticalControl aritimeticalControl0 (clk, reset, aluOp, func, aluControl);
alu alu0 (reset, aluControl, aluInput0, aluInput1, resultOutput, isAluOutputZero);

endmodule