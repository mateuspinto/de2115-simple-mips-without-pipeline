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

endpackage

package libInstructions;

parameter J = 6'b000010;
parameter BEQ = 6'b000100;
parameter ADD = 6'b000000;
parameter SUB = 6'b000000;
parameter AND = 6'b100100;
parameter OR = 6'b100101;
parameter SLT = 6'b101010;
parameter LW = 6'b100011;
parameter SW = 6'b101011;

endpackage

package libFunctions;

parameter FUNC_ADD = 6'b100000; 
parameter FUNC_SUB = 6'b100010;
parameter FUNC_AND = 6'b100100;
parameter FUNC_OR = 6'b100101;
parameter FUNC_SLT = 6'b101010;
parameter FUNC_MULT = 6'b011000;
parameter FUNC_DIV = 6'b011010;

endpackage