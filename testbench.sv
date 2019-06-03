module testbench();

	logic clk, reset;
	
	logic regDst, jump, memRead, memToReg, memWrite, aluSrc, regWrite, isAluOutputZero;
	logic [31:0] instruction, writeData, readRegister0, readRegister1, immediateExtended, resultOutput, readData, aluIn2Display, pcDisplay;
	logic [5:0] func;
	logic [1:0] branch;
	logic [3:0] aluOp;

	wire [31:0] ioInstruction [255:0];
	wire [31:0] ioRegisters [31:0];
	wire [31:0] ioHiLo [1:0];
	wire [31:0] ioMemory [1023:0];

	initial begin
		$display("\n-------------------------------");
	end
	
	always begin
		clk <= 1; #1;
		clk<=0; #1;
		$display("\nInstrucao:%b", instruction);
		$display("\nSaida PC:%b", pcDisplay);
		$display("\nEntrada 1 - ALU:%b", readRegister0);
		$display("\nEntrada 2 - ALU:%b", aluIn2Display);
		$display("\nSaida ALU:%b", resultOutput);
		$display("\n-------------------------------\n");
	end

	initial begin
		$dumpfile("mips.vcd");
      	$dumpvars(0, testbench);
		reset<=1; #1;
		reset<=0; #1;
	end

	controller controller0 (reset, instruction[31:26], regDst, jump, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
	instructionFetch instructionFetch0 (clk, reset, immediateExtended, jump, branch, isAluOutputZero, instruction, ioInstruction, pcDisplay);
	instructionDecode instructionDecode0 (clk, reset, regDst, regWrite, instruction[25:0], writeData, readRegister0, readRegister1, immediateExtended, func, ioRegisters);
	executing executing0 (clk, reset, aluSrc, aluOp, readRegister0, readRegister1, immediateExtended, func, resultOutput, isAluOutputZero, ioHiLo, aluIn2Display);
	memory memory0 (clk, reset, memWrite, resultOutput, readRegister1, readData, ioMemory);
	writeBack writeBack0 (memToReg, resultOutput, readData, writeData);

endmodule