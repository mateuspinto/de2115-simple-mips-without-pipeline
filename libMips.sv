package libMdlu;

    parameter MDLU_MULT = 0;
    parameter MDLU_DIV = 1;
    parameter MDLU_ZERO = 2;

endpackage

package libAlu;

    parameter ALU_ADD = 0;
    parameter ALU_AND = 1;
    parameter ALU_LUI = 2;
    parameter ALU_OR = 3;
    parameter ALU_SLL = 4;
    parameter ALU_SLT = 5;
    parameter ALU_SRA = 6;
    parameter ALU_SRL = 7;
    parameter ALU_SUB = 8;
    parameter ALU_ZERO = 9;
    parameter ALU_MULT = 10;
    parameter ALU_DIV = 11;
    parameter ALU_MFHI = 12;
    parameter ALU_MFLO = 13;
    parameter ALU_NOR = 14;
    parameter ALU_XOR = 15;

endpackage

package libInstructions;

    parameter R =    6'b000000;
    parameter J =    6'b000010;

    // I Type functions
    parameter BEQ =  6'b000100;
    parameter BNE =  6'b000101;
    parameter SLT =  6'b101010;
    parameter LW =   6'b100011;
    parameter SW =   6'b101011;
    parameter LUI =  6'b001111;

    parameter ADDI = 6'b001000;
    parameter ANDI = 6'b001100;
    parameter ORI =  6'b001101;
    parameter XORI = 6'b001110;
    parameter SLTI = 6'b001010;

endpackage

package libFunctions;

    parameter FUNC_ADD = 6'b100000; 
    parameter FUNC_SUB = 6'b100010;
    parameter FUNC_SLLV = 6'b000100;
    parameter FUNC_SRLV = 6'b000110;
    parameter FUNC_SRAV = 6'b000011;

    //Aritimetical Operations
    parameter FUNC_AND = 6'b100100;
    parameter FUNC_OR = 6'b100101;
    parameter FUNC_XOR = 6'b100110;
    parameter FUNC_SLT = 6'b101010;

    //Mult and Div Funcs
    parameter FUNC_MULT = 6'b011000;
    parameter FUNC_DIV = 6'b011010;
    parameter FUNC_MFHI = 6'b010000;
    parameter FUNC_MFLO = 6'b010010;

endpackage

package libAritimeticalControl;

    parameter ARCTRL_ZERO = 0;

    // R type functions
    parameter ARCTRL_FUNC = 1;

    //Aritimetical Operations
    parameter ARCTRL_ADD = 2;
    parameter ARCTRL_SUB = 3;
    parameter ARCTRL_LU = 4;

    //Logical operations
    parameter ARCTRL_AND = 5;
    parameter ARCTRL_OR = 6;
    parameter ARCTRL_XOR = 7;
    parameter ARCTRL_SLT = 8;

endpackage