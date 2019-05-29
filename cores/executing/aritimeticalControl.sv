import libAlu::*;
import libFunctions::*;

module aritimeticalControl(
    input logic clk,
    input logic reset,
    input logic [1:0] aluOp,
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
        if (aluOp==1) begin // R type
            case(func)
                FUNC_ADD:begin
                    aluControl <= ALU_ADD;
                    regHiLoWrite <= 0;
                end
                FUNC_SUB:begin
                    aluControl <= ALU_SUB;
                    regHiLoWrite <= 0;
                end
                FUNC_AND:begin
                    aluControl <= ALU_AND;
                    regHiLoWrite <= 0;
                end
                FUNC_OR:begin
                    aluControl <= ALU_OR;
                    regHiLoWrite <= 0;
                end
                FUNC_SLT:begin
                    aluControl <= ALU_SLT;
                    regHiLoWrite <= 0;
                end
                FUNC_MULT:begin
                    aluControl <= ALU_MULT;
                    regHiLoWrite <= 1;
                end
                FUNC_DIV:begin
                    aluControl <= ALU_DIV;
                    regHiLoWrite <= 1;
                end
                FUNC_MFHI:begin
                    aluControl <= ALU_MFHI;
                    regHiLoWrite <= 0;
                end
                FUNC_MFLO:begin
                    aluControl <= ALU_MFLO;
                    regHiLoWrite <= 0;
                end
                default:begin 
                    aluControl <= ALU_ZERO;
                    regHiLoWrite <= 0;
                end
            endcase
        end

        else if (aluOp==2) begin // addi
            aluControl <= ALU_ADD;
            regHiLoWrite <= 0;
        end

        else if (aluOp==3) begin // beq and bne
            aluControl <= ALU_SUB;
            regHiLoWrite <= 0;
        end

        else begin
            aluControl <= ALU_ZERO;
            regHiLoWrite <= 0;
        end
    end
end




endmodule