module testbench();

	logic clk, reset, regDst, jump, memRead, memToReg, memWrite, aluSrc, regWrite, isAluOutputZero;
	logic [31:0] instruction, writeData, aluInput0, aluInput1, branch, memoryWritedata, resultOutput, readData;
	logic [5:0] func;
	logic [3:0] aluOp;
	logic [1:0] branchC;

	always begin
		clk <= 1; #1;
		clk<=0; #1;
	end

	initial begin
		reset<=1; #1;
		reset<=0; #1;
	end

	controller controller0 (reset, instruction[31:26], regDst, jump, branchC, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	instructionFetch instructionFetch0 (clk, reset, branch, jump, branchC, isAluOutputZero, instruction);
	instructionDecode instructionDecode0 (clk, reset, regDst, aluSrc, regWrite, instruction[25:0], writeData, aluInput0, aluInput1, memoryWritedata, branch, func);
	executing executing0 (clk, reset, aluOp, aluInput0, aluInput1, func, resultOutput, isAluOutputZero);
	memory memory0 (clk, reset, memWrite, resultOutput, memoryWritedata, readData);
	writeBack writeBack0 (memToReg, resultOutput, readData, writeData);

endmodule