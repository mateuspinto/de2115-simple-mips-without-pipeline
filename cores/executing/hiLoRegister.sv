module hiLoRegister(
    input logic clk,
    input logic reset,
    input logic regHiLoWrite,
    input logic [31:0] inputHilo [1:0],
    output logic [31:0] outputHi,
    output logic [31:0] outputLo,
    output wire [31:0] ioHiLo [1:0]
);

logic [31:0] hiLo [1:0];

assign outputHi = hiLo[0];
assign outputLo = hiLo[1];
assign ioHiLo = hiLo;

always_ff @(posedge clk) begin

    if(reset) begin
        $readmemb("cores/executing/hiLoregister.txt",hiLo);
    end

    else begin
        if (regHiLoWrite) begin
            hiLo <= inputHilo;
        end
    end
end










endmodule