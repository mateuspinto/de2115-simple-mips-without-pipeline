import libAlu::*;

module alu(
    input logic reset,
    input logic [3:0] control,
    input logic [31:0] numberA,
    input logic [31:0] numberB,
    output logic [31:0] result,
    output logic zero);

    always_comb begin

        if(reset) begin
            result <= 0;
        end

        else begin
            case (control)
                //Aritimetical Operations
                ALU_ADD: result <= numberA + numberB;
                ALU_SUB: result <= numberA - numberB;

                //Logical operations
                ALU_AND: result <= numberA & numberB;
                ALU_OR:  result <= numberA | numberB;
                ALU_XOR: result <= numberA ^ numberB;
                ALU_NOR: result <= ~numberA | ~numberB;


                ALU_LUI: result <= {numberB[15:0],{16'b0}};
                ALU_SLL: result <= numberB << numberA[4:0];
                ALU_SLT: result <= (numberA[31] != numberB[31]) ? ({{31'b0}, numberA[31]}) : ({{31'b0}, numberA < numberB});
                ALU_SRA: result <= $signed(numberB) >>> numberA[4:0];
                ALU_SRL: result <= numberB >> numberA[4:0];
                ALU_ZERO: result <= 0;
                default:  result <= 0;
            endcase
        end
    end
        
    assign zero = (result == 0);
        
endmodule