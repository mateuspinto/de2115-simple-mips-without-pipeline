import libAlu::*;

module outputExecuting(
    input logic [3:0] control,
    input logic [31:0] input0,
    input logic [31:0] input1,
    input logic [31:0] input2,
    output logic [31:0] output0
);
    always_comb begin

        case(control)

            ALU_MFHI: begin
                output0 <= input0;
            end

            ALU_MFLO: begin
                output0 <= input1;
            end

            default: begin
                output0 <= input2;
            end

        endcase

    end

endmodule