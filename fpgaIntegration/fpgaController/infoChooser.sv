module infoChooser(
    input wire [31:0] ioInstruction [255:0],
    input wire [31:0] ioRegisters [31:0],
    input wire [31:0] ioMemory [1023:0],
    input wire [9:0] derreference,
    input wire [1:0] select,
    output logic [31:0] word
);


always_comb begin
    case(select)
        0: begin
            word <= ioInstruction[derreference[7:0]];
        end

        1: begin
            word <= ioRegisters[derreference[4:0]];
        end

        2: begin
            word <= ioMemory[derreference];
        end
        
        default: begin
            word <= 0;
        end
    endcase
end












endmodule