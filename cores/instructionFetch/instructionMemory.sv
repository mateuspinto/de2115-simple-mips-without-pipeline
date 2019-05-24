module instructionMemory(
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] address,
    output logic [31:0] instruction,
    output wire [31:0] ioInstruction [255:0]
);

    logic [31:0] instructionMemory [255:0];

    assign instruction = instructionMemory[address[31:2]];
    assign ioInstruction = instructionMemory;

    always_ff @(posedge clk) begin
        if(reset) begin
        	$readmemb("cores/instructionFetch/instruction.txt",instructionMemory);
        end
    end
    
endmodule