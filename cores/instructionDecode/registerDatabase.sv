module registerDatabase(
    input logic clk,
    input logic reset,
    input logic regWrite,
    input logic [25:21] readRegister1,
    input logic [20:16] readRegister2,
    input logic [15:11] writeRegister,
    input logic [31:0] writeData,
    output logic [31:0] readData1,
    output logic [31:0] readData2,
    output wire [31:0] ioRegisters [31:0]
);

logic [31:0] registers [31:0];

assign ioRegisters = registers;

assign readData1 = registers[readRegister1];
assign readData2 = registers[readRegister2];

always_ff @(posedge clk) begin

    if(reset) begin
        $readmemb("cores/instructionDecode/registers.txt",registers);
    end

    else begin
        if (regWrite) begin
            registers[writeRegister] <= writeData;
        end
    end
end










endmodule