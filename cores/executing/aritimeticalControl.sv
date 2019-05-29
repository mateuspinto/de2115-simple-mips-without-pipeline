import libAlu::*;
import libFunctions::*;
import libAritimeticalControl::*;

module aritimeticalControl(
    input logic reset,
    input logic [3:0] aluOp,
    input logic [5:0] func,
    output logic [3:0] aluControl,
    output logic regHiLoWrite
);

always_comb begin

    if (reset) begin
        aluControl <= ALU_ZERO;
        regHiLoWrite <= 0;
    end

    else begin

        case(aluOp)

            ARCTRL_FUNC: begin // For R instructions

                case(func)
                FUNC_ADD: begin
                    aluControl <= ALU_ADD;
                    regHiLoWrite <= 0;
                end

                FUNC_SUB: begin
                    aluControl <= ALU_SUB;
                    regHiLoWrite <= 0;
                end

                FUNC_AND: begin
                    aluControl <= ALU_AND;
                    regHiLoWrite <= 0;
                end

                FUNC_OR: begin
                    aluControl <= ALU_OR;
                    regHiLoWrite <= 0;
                end

                FUNC_XOR: begin
                    aluControl <= ALU_XOR;
                    regHiLoWrite <= 0;
                end

                FUNC_SLT: begin
                    aluControl <= ALU_SLT;
                    regHiLoWrite <= 0;
                end

                FUNC_MULT: begin
                    aluControl <= ALU_MULT;
                    regHiLoWrite <= 1;
                end

                FUNC_DIV: begin
                    aluControl <= ALU_DIV;
                    regHiLoWrite <= 1;
                end

                FUNC_MFHI: begin
                    aluControl <= ALU_MFHI;
                    regHiLoWrite <= 0;
                end

                FUNC_MFLO: begin
                    aluControl <= ALU_MFLO;
                    regHiLoWrite <= 0;
                end

                FUNC_SLLV: begin
                    aluControl <= ALU_SLL;
                    regHiLoWrite <= 0;
                end

                FUNC_SRLV: begin
                    aluControl <= ALU_SRL;
                    regHiLoWrite <= 0;
                end

                FUNC_SRAV: begin
                    aluControl <= ALU_SRA;
                    regHiLoWrite <= 0;
                end

                default: begin 
                    aluControl <= ALU_ZERO;
                    regHiLoWrite <= 0;
                end

                endcase

            end // End of the R type functions

            ARCTRL_ADD: begin
                aluControl <= ALU_ADD;
                regHiLoWrite <= 0;
            end

            ARCTRL_SUB: begin
                aluControl <= ALU_SUB;
                regHiLoWrite <= 0;
            end

            ARCTRL_LU: begin
                aluControl <= ALU_LUI;
                regHiLoWrite <= 0;
            end

            ARCTRL_AND: begin
                aluControl <= ALU_AND;
                regHiLoWrite <= 0;
            end

            ARCTRL_OR: begin
                aluControl <= ALU_OR;
                regHiLoWrite <= 0;
            end

            ARCTRL_XOR: begin
                aluControl <= ALU_XOR;
                regHiLoWrite <= 0;
            end

            ARCTRL_SLT: begin
                aluControl <= ALU_SLT;
                regHiLoWrite <= 0;
            end
            
            default: begin 
                    aluControl <= ALU_ZERO;
                    regHiLoWrite <= 0;
            end

        endcase
    end
end




endmodule