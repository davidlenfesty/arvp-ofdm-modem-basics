`default_nettype none
`timescale 1ns/1ps

module s_to_p_tb ();

// Tak
localparam IN_WIDTH = 8;
localparam OUT_WIDTH = 4;

reg clk;
reg rst;

reg [IN_WIDTH-1:0] i_data;
reg i_valid;
wire i_ready;

wire [IWIDTH*OWIDTH-1:0] o_data;
wire o_valid;
reg o_ready;

s_to_p uut(
    .clk        (clk        ),
    .rst        (rst        ),
    .i_data     (i_data     ),
    .i_valid    (i_valid    ),
    .i_ready    (i_ready    ),
    .o_data     (o_data     ),
    .o_valid    (o_valid    ),
    .o_ready    (o_ready    )
);

reg [IN_WIDTH-1:0] good_in_data [4] = {
    8'hDE, 8'hAD, 8'hBE, 8'hEF
};

reg [3:0] cntr;

initial begin
    clk = 0;
    rst = 1;
    cntr = 0;
end

always #5 clk = !clk;

always @(posedge clk) begin
    if (rst) rst <= 0;

    
end

endmodule

`default_nettype wire
