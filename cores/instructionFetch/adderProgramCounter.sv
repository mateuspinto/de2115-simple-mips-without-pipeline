module adderProgramCounter(
    input logic clk,
    input logic reset,
    input logic [31:0] pcInput,
    output logic [31:0] pcOutput
);

always_comb begin

    if(reset) begin
        pcOutput <= 0;
    end

    else begin
        pcOutput <= pcInput + 4;
    end
    
end

endmodule