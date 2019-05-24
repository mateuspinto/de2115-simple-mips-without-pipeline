module mux2_1_5bits(
    input logic control,
    input logic [4:0] input0,
    input logic [4:0] input1,
    output logic [4:0] output0
);

always_comb begin
    case(control)

    0: begin
        output0 <= input0;
    end

    1: begin
        output0 <= input1;
    end

    endcase
    
end

endmodule

module shiftLef_2_32bits(
    input logic [31:0] input0,
    output logic [31:0] output0
);

always_comb begin
    output0 <= 2 << input0;
end

endmodule

module shiftLeft_2_26_28_bits(
    input logic [25:0] input0,
    output logic [27:0] output0
);

always_comb begin
    output0[27:2] <= input0;
    output0[1:0] <= 0;
end

endmodule

module adder_32bits(
    input logic [31:0] input0,
    input logic [31:0] input1,
    output logic [31:0] output0
);

always_comb begin
    output0 <= input0 + input1;
end

endmodule

module mux2_1_32bits(
    input logic control,
    input logic [31:0] input0,
    input logic [31:0] input1,
    output logic [31:0] output0
);

always_comb begin
    case(control)

    0: begin
        output0 <= input0;
    end

    1: begin
        output0 <= input1;
    end

    endcase
    
end

endmodule

module signalExtender16_32bits(
    input logic [15:0] preExtended,
    output logic [31:00] postExtended
);

always_comb begin

    case(preExtended[15])

    1: begin
        postExtended[31:16] <= '{default:1};
        postExtended[15:0] <= preExtended;
    end

    0: begin
        postExtended[31:16] <= '{default:0};
        postExtended[15:0] <= preExtended;
    end

    endcase

end

endmodule