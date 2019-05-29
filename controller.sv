import libInstructions::*;
import libAritimeticalControl::*;

module controller(
                  input logic reset,
                  input logic [31:26] instruction,
                  output logic regDst,
                  output logic jump,
                  output logic [1:0] branch,
                  output logic memRead,
                  output logic memToReg,
                  output logic [3:0] aluOp,
                  output logic memWrite,
                  output logic aluSrc,
                  output logic regWrite
                  );

    always_comb begin

        if(reset) begin
            regDst <= 0;
            jump <= 0;
            branch <= 0;
            memRead <= 0;
            memToReg <= 0;
            aluOp <= ARCTRL_ZERO;
            memWrite <= 0;
            aluSrc <= 0;
            regWrite <= 0;
        end

        else begin

            case(instruction)

                R: begin
                    regDst <= 1;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_FUNC;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 1;
                end

                ADDI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_ADD;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                ANDI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_AND;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                ORI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_OR;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                XORI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_XOR;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                SLTI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_SLT;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                LUI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_LU;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                SW: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_ADD;
                    memWrite <= 1;
                    aluSrc <= 1;
                    regWrite <= 0;
                end

                LW: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 1;
                    memToReg <= 1;
                    aluOp <= ARCTRL_ADD;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                BEQ: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 1;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_SUB;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end

                BNE: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 2;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_SUB;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end

                J: begin
                    regDst <= 0;
                    jump <= 1;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_ZERO;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end
                
                default: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= 0;
                    memRead <= 0;
                    memToReg <= 0;
                    aluOp <= ARCTRL_ZERO;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end
            endcase

        end
    end

endmodule