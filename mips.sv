module mips(
    input wire clk,
    input wire reset,
    input wire [9:0] derreference,
    input wire [1:0] select,
	output logic [31:0] word
);

	wire regDst, jump, memRead, memToReg, memWrite, aluSrc, regWrite, isAluOutputZero;
	wire [31:0] instruction, writeData, aluInput0, aluInput1, branch, memoryWritedata, resultOutput, readData;
	wire [5:0] func;
	wire [1:0] aluOp, branchC;

	wire [31:0] ioInstruction [255:0];
   wire [31:0] ioRegisters [31:0];
   wire [31:0] ioMemory [1023:0];

   controller controller0 (reset, instruction[31:26], regDst, jump, branchC, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	instructionFetch instructionFetch0 (clk, reset, branch, jump, branchC, isAluOutputZero, instruction, ioInstruction);
	instructionDecode instructionDecode0 (clk, reset, regDst, aluSrc, regWrite, instruction[25:0], writeData, aluInput0, aluInput1, memoryWritedata, branch, func, ioRegisters);
	executing executing0 (clk, reset, aluOp, aluInput0, aluInput1, func, resultOutput, isAluOutputZero);
	memory memory0 (clk, reset, memWrite, resultOutput, memoryWritedata, readData, ioMemory);
	writeBack writeBack0 (memToReg, resultOutput, readData, writeData);

	infoChooser infoChooser0 (ioInstruction, ioRegisters, ioMemory, derreference, select, word);

endmodule