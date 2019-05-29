module hiLoRegister(
    input logic clk,
    input logic reset,
    input logic regHiLoWrite,
    input logic [31:0] inputHilo [1:0],
    output logic [31:0] outputHi,
    output logic [31:0] outputLo
);

logic [31:0] hiLo [1:0];

assign outputHi = hiLo[0];
assign outputLo = hiLo[1];

always_ff @(posedge clk) begin

    if(reset) begin
        $readmemb("cores/executing/hiLoregister.txt",hiLo);
    end

    if(~reset && regHiLoWrite) begin
        hiLo <= inputHilo;
    end
end










endmodule