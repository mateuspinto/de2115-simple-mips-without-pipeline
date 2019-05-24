module memory(
    input logic clk,
    input logic reset,
    input logic memWrite,
    input logic [31:0] address,
    input logic [31:0] writeData,
    output logic [31:0] readData,
    output wire [31:0] ioMemory [1023:0]
    );

memoryDatabase memoryDatabase0 (clk, reset, memWrite, address, writeData, readData, ioMemory);

endmodule