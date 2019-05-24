module displaySevSegm(
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

binaryToHexSevSegm binaryToHexSevSegm0 (binary[3:0], disp0);
binaryToHexSevSegm binaryToHexSevSegm1 (binary[7:4], disp1);
binaryToHexSevSegm binaryToHexSevSegm2 (binary[11:8], disp2);
binaryToHexSevSegm binaryToHexSevSegm3 (binary[15:12], disp3);
binaryToHexSevSegm binaryToHexSevSegm4 (binary[19:16], disp4);
binaryToHexSevSegm binaryToHexSevSegm5 (binary[23:20], disp5);
binaryToHexSevSegm binaryToHexSevSegm6 (binary[27:24], disp6);
binaryToHexSevSegm binaryToHexSevSegm7 (binary[31:28], disp7);


endmodule