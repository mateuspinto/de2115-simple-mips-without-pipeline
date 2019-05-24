module writeBack(
    input logic memToReg,
    input logic [31:0] aluOutput,
    input logic [31:0] memoryOutput,
    output logic [31:0] registerDatabaseInput
);

mux2_1_32bits muxWriteBack (memToReg, aluOutput, memoryOutput, registerDatabaseInput);


endmodule