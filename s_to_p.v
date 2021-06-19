`default_nettype none

module s_to_p #(
    parameter IWIDTH = 8,
    parameter OWIDTH = 4
) (
    input wire clk,
    input wire rst,

    input wire [IWIDTH-1:0] i_data,
    input wire i_valid,
    output reg i_ready,

    output reg [IWIDTH*OWIDTH-1:0] o_data,
    output reg o_valid,
    input wire o_ready
);

reg [OWIDTH:0] cntr;

always @(posedge clk) begin

    if (rst) begin
        cntr    <= 0;
        i_ready <= 0;
        o_data  <= 0;
        o_valid <= 0;

    end else begin
        i_ready <= 0;

        // If our output buffer isn't full, we want to be reading in any valid data
        if (cntr < OWIDTH) begin
            i_ready <= 1;
            if (i_valid & cntr < OWIDTH) begin
                cntr <= cntr + 1;
                o_data[(cntr * IWIDTH * OWIDTH) +: IWIDTH] <= i_data;
            end
        end else begin
            o_valid <= 1;
            if (o_ready & o_valid) cntr <= 0;
        end
    end
end

endmodule

`default_nettype wire
