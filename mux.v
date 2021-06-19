module mux #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] in [WIDTH],
    input wire [$clog2(WIDTH)-1:0] select,
    output wire [WIDTH-1:0] out
);

assign out = in[select];

endmodule