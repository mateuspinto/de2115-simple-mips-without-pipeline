module instructionDecode(
    input logic clk,
    input logic reset,
    input logic regDst,
    input logic aluSrc,
    input logic regWrite,
    input logic [25:0] instruction,
    input logic [31:0] writeData,
    output logic [31:0] aluInput0,
    output logic [31:0] aluInput1,
    output logic [31:0] memoryWriteData,
    output logic [31:0] branch,
    output logic [5:0] func,
    output wire [31:0] ioRegisters [31:0]
);

logic [4:0] muxOutputWriteRegister;

registerDatabase registerDatabase0 (clk, reset, regWrite, instruction[25:21], instruction[20:16], muxOutputWriteRegister, writeData, aluInput0, memoryWriteData, ioRegisters);
signalExtender16_32bits signalExtender16_32bitsBranch (instruction[15:0], branch);
mux2_1_5bits muxWriteRegister (regDst, instruction[20:16], instruction[15:11], muxOutputWriteRegister);
mux2_1_32bits muxData2 (aluSrc, memoryWriteData, branch, aluInput1);

assign func = instruction[5:0];

endmodule