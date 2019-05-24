module branchController(
    input logic [1:0] branch,
    input logic zero,
    output logic branchDemux
);

always_comb begin
    if(branch==1)begin //beq
        branchDemux <= zero;
    end

    else if(branch==2)begin //bne
        branchDemux <= ~zero;
    end

    else begin
        branchDemux <= 0;
    end
end

endmodule