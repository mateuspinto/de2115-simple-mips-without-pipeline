module instructionFetch(
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] branchInput,
    input  logic        jump,
    input  logic [1:0]  branchC,
    input  logic        zero,
    output logic [31:0] instruction,
    output wire [31:0] ioInstruction [255:0]
    );

logic [31:0] pcOutputDemuxBranch, pc4, pcOutput, branchOutput, adder_32bitsOutput, pcInput;
logic [27:0] pcJump;
logic freeze, branchDemux;

instructionMemory instructionMemory0 (clk, reset, pcOutput, instruction, ioInstruction);
programCounter programCounter0 (clk, reset, freeze, pcInput, pcOutput);

// Branch
adderProgramCounter adderProgramCounter0 (clk, reset, pcOutput, pc4); 
shiftLef_2_32bits shiftLef_2_32bitsBranch (branchInput, branchOutput); 
adder_32bits adder_32bits0 (branchOutput, pc4, adder_32bitsOutput);
branchController branchController0 (branchC, zero, branchDemux);
mux2_1_32bits mux2_1_32bitsBranch (branchDemux, pc4, adder_32bitsOutput, pcOutputDemuxBranch);

// Jumps
shiftLeft_2_26_28_bits shiftLeft_2_26_28_bits0 (instruction[25:0], pcJump);
mux2_1_32bits mux2_1_32bitsJump (jump, pcOutputDemuxBranch, {pc4[31:28], pcJump}, pcInput);

endmodule