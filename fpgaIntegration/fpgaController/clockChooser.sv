module clockChooser(
    input wire select,
    input wire fpgaClock,
    input wire manualClock,
    output logic clk
);


always_comb begin
    case(select)

        0: begin
            clk <= fpgaClock;
        end

        1: begin
            clk <= manualClock;
        end

    endcase
end


endmodule