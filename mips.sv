module mips(
    input wire clk,
    input wire reset,
    input wire [9:0] derreference,
    input wire [1:0] select,
	output logic [31:0] word
);

	wire regDst, jump, memRead, memToReg, memWrite, aluSrc, regWrite, isAluOutputZero;
	wire [31:0] instruction, writeData, readRegister0, readRegister1, immediateExtended, resultOutput, readData;
	wire [5:0] func;
	wire [1:0] branch;
	wire [3:0] aluOp;

	wire [31:0] ioInstruction [255:0];
	wire [31:0] ioRegisters [31:0];
	wire [31:0] ioHiLo [1:0];
	wire [31:0] ioMemory [1023:0];

	controller controller0 (reset, instruction[31:26], regDst, jump, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	instructionFetch instructionFetch0 (clk, reset, immediateExtended, jump, branch, isAluOutputZero, instruction, ioInstruction);
	instructionDecode instructionDecode0 (clk, reset, regDst, regWrite, instruction[25:0], writeData, readRegister0, readRegister1, immediateExtended, func, ioRegisters);
	executing executing0 (clk, reset, aluSrc, aluOp, readRegister0, readRegister1, immediateExtended, func, resultOutput, isAluOutputZero, ioHiLo);
	memory memory0 (clk, reset, memWrite, resultOutput, readRegister1, readData, ioMemory);
	writeBack writeBack0 (memToReg, resultOutput, readData, writeData);

	infoChooser infoChooser0 (ioInstruction, ioRegisters, ioHiLo, ioMemory, derreference, select, word);

endmodule