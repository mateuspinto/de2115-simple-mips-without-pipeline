import libAlu::*;
import libFunctions::*;

module aritimeticalControl(
    input logic clk,
    input logic reset,
    input logic [1:0] aluOp,
    input logic [5:0] func,
    output logic [3:0] aluControl
);

always_comb begin

    if (reset) begin
        aluControl <= ALU_ZERO;
    end

    else begin
        if (aluOp==1) begin // R type
            case(func)
                FUNC_ADD: aluControl <= ALU_ADD;
                FUNC_SUB: aluControl <= ALU_SUB;
                FUNC_AND: aluControl <= ALU_AND;
                FUNC_OR: aluControl <= ALU_OR;
                FUNC_SLT: aluControl <= ALU_SLT;
                default: aluControl <= ALU_ZERO;
            endcase
        end

        else if (aluOp==2) begin // addi
            aluControl <= ALU_ADD;
        end

        else if (aluOp==3) begin // beq and bne
            aluControl <= ALU_SUB;
        end

        else begin
            aluControl <= ALU_ZERO;
        end
    end
end




endmodule