module executing(
    input logic clk,
    input logic reset,
    input logic [3:0] aluOp,
    input logic [31:0] aluInput0,
    input logic [31:0] aluInput1,
    input logic [5:0] func,
    output logic [31:0] resultOutput,
    output logic isAluOutputZero,
    output wire [31:0] ioHiLo [1:0]
);

logic [3:0] aluControl;
logic [3:0] mdluControl;
logic [31:0] outputHiLo [1:0];
logic [31:0] outputHi;
logic [31:0] outputLo;
logic [31:0] resultAluOutput;
logic regHiLoWrite;

aritimeticalControl aritimeticalControl0 (reset, aluOp, func, aluControl, regHiLoWrite);
alu alu0 (reset, aluControl, aluInput0, aluInput1, resultAluOutput, isAluOutputZero);

// Mult and div components
mdlu mdlu0 (reset, aluControl, aluInput0, aluInput1, outputHiLo);
hiLoRegister hiLoRegister0 (clk, reset, regHiLoWrite, outputHiLo, outputHi, outputLo, ioHiLo);
outputExecuting outputExecuting0 (aluControl, outputHi, outputLo, resultAluOutput, resultOutput);

endmodule