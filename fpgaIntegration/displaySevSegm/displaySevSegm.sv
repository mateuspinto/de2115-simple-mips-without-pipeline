module displaySevSegm(
	 input wire clk,
    input wire [31:0] binary,
    output wire [6:0] disp0,
    output wire [6:0] disp1,
    output wire [6:0] disp2,
    output wire [6:0] disp3,
    output wire [6:0] disp4,
    output wire [6:0] disp5,
    output wire [6:0] disp6,
    output wire [6:0] disp7
);

binaryToHexSevSegm binaryToHexSevSegm0 (clk, binary[3:0], disp0);
binaryToHexSevSegm binaryToHexSevSegm1 (clk, binary[7:4], disp1);
binaryToHexSevSegm binaryToHexSevSegm2 (clk, binary[11:8], disp2);
binaryToHexSevSegm binaryToHexSevSegm3 (clk, binary[15:12], disp3);
binaryToHexSevSegm binaryToHexSevSegm4 (clk, binary[19:16], disp4);
binaryToHexSevSegm binaryToHexSevSegm5 (clk, binary[23:20], disp5);
binaryToHexSevSegm binaryToHexSevSegm6 (clk, binary[27:24], disp6);
binaryToHexSevSegm binaryToHexSevSegm7 (clk, binary[31:28], disp7);


endmodule