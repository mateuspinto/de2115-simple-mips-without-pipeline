import libAlu::*;

module mdlu(
    input logic reset,
    input logic [3:0] control,
    input logic [31:0] numberA,
    input logic [31:0] numberB,
    output logic [31:0] outputHiLo [1:0]
    );

    always_comb begin

        if(reset) begin
            {outputHiLo[0], outputHiLo[1]} <= 0;
        end

        else begin
            case (control)
                ALU_MULT: {outputHiLo[0], outputHiLo[1]} <= numberA * numberB;
                ALU_DIV: begin 
                    outputHiLo[0] <= numberA / numberB;
                    outputHiLo[1] <= numberA % numberB;
                end
                default:  {outputHiLo[0], outputHiLo[1]} <= 0;
            endcase
        end
    end
        
endmodule