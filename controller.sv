import libInstructions::*;

module controller(
                  input logic reset,
                  input logic [31:26] instruction,
                  output logic regDst,
                  output logic jump,
                  output logic [1:0] branch,
                  output logic memRead,
                  output logic memToReg,
                  output logic [1:0] aluOp,
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
            aluOp <= 0;
            memWrite <= 0;
            aluSrc <= 0;
            regWrite <= 0;
        end

        else begin

            if(instruction==6'b000000) begin // R type
                regDst <= 1;
                jump <= 0;
                branch <= 0;
                memRead <= 0;
                memToReg <= 0;
                aluOp <= 1;
                memWrite <= 0;
                aluSrc <= 0;
                regWrite <= 1;
            end

            else if(instruction==6'b101011) begin // SW
                regDst <= 0;
                jump <= 0;
                branch <= 0;
                memRead <= 0;
                memToReg <= 0;
                aluOp <= 2;
                memWrite <= 1;
                aluSrc <= 1;
                regWrite <= 0;
            end

            else if(instruction==6'b100011) begin // LW
                regDst <= 0;
                jump <= 0;
                branch <= 0;
                memRead <= 1;
                memToReg <= 1;
                aluOp <= 2;
                memWrite <= 0;
                aluSrc <= 1;
                regWrite <= 1;
            end

            else if(instruction==6'b000100) begin // BEQ
                regDst <= 0;
                jump <= 0;
                branch <= 1;
                memRead <= 0;
                memToReg <= 0;
                aluOp <= 3;
                memWrite <= 0;
                aluSrc <= 0;
                regWrite <= 0;
            end

            else if(instruction==6'b000010) begin // JUMP
                regDst <= 0;
                jump <= 1;
                branch <= 0;
                memRead <= 0;
                memToReg <= 0;
                aluOp <= 0;
                memWrite <= 0;
                aluSrc <= 0;
                regWrite <= 0;
            end

            else begin
                regDst <= 0;
                jump <= 0;
                branch <= 0;
                memRead <= 0;
                memToReg <= 0;
                aluOp <= 0;
                memWrite <= 0;
                aluSrc <= 0;
                regWrite <= 0;
            end

        end
    end

endmodule