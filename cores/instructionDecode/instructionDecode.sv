module instructionDecode(
    input logic clk,
    input logic reset,
    input logic regDst,
    input logic regWrite,
    input logic [25:0] instruction,
    input logic [31:0] writeData,
    output logic [31:0] readRegister0,
    output logic [31:0] readRegister1,
    output logic [31:0] immediateExtended,
    output logic [5:0] func,
    output wire [31:0] ioRegisters [31:0]
);

wire [4:0] muxOutputWriteRegister;

registerDatabase registerDatabase0 (clk, reset, regWrite, instruction[25:21], instruction[20:16], muxOutputWriteRegister, writeData, readRegister0, readRegister1, ioRegisters);

signalExtender16_32bits signalExtender16_32bitsBranch (instruction[15:0], immediateExtended); // Extend immediate from 16 to 32 bits
mux2_1_5bits muxWriteRegister (regDst, instruction[20:16], instruction[15:11], muxOutputWriteRegister); // Select RD

assign func = instruction[5:0];

endmodule