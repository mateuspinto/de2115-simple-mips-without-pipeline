module executing(
    input logic clk,
    input logic reset,
    input logic aluSrc,
    input logic [3:0] aluOp,
    input logic [31:0] readRegister0,
    input logic [31:0] readRegister1,
    input logic [31:0] immediateExtended,
    input logic [5:0] func,
    output logic [31:0] resultOutput,
    output logic isAluOutputZero,
    output wire [31:0] ioHiLo [1:0],
    output wire [31:0] aluIn2Display
);

wire [3:0] aluControl;
wire [3:0] mdluControl;
wire [31:0] outputHiLo [1:0];
wire [31:0] outputHi;
wire [31:0] outputLo;
wire [31:0] resultAluOutput;
wire [31:0] aluInput1;
wire regHiLoWrite;

assign aluIn2Display=aluInput1;

mux2_1_32bits mux2_1_32bits0 (aluSrc, readRegister1, immediateExtended, aluInput1);

aritimeticalControl aritimeticalControl0 (reset, aluOp, func, aluControl, regHiLoWrite);
alu alu0 (reset, aluControl, readRegister0, aluInput1, resultAluOutput, isAluOutputZero);

// Mult and div components
mdlu mdlu0 (reset, aluControl, readRegister0, readRegister1, outputHiLo);
hiLoRegister hiLoRegister0 (clk, reset, regHiLoWrite, outputHiLo, outputHi, outputLo, ioHiLo);

// Select result from MDLU or ALU
outputExecuting outputExecuting0 (aluControl, outputHi, outputLo, resultAluOutput, resultOutput);

endmodule