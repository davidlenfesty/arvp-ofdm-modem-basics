module tb (

);

reg [7:0] in;
reg [2:0] sel;
wire       out;

mux mux8 (
    .in     (in ),
    .select (sel),
    .out    (out)
);

reg [7:0] cnt;


// ----- Here there be modulation

data_collector data(...signals);
qam_modulation qam(..signals);
ser_to_par stop(..signals);
ifft ifft_inst(..signals);
cyclic prefix(..signals);

// ---- end modulation


initial begin
    in = 'hAA;

    for (cnt = 0; cnt < 7; cnt = cnt + 1) begin
        #5 sel = cnt;

        if (cnt == (sel % 2)) begin
            $display("Index %d works!", cnt);
        end else begin
            $display("Index %d failed! Value: %d", cnt, out);
        end
    end
    $finish();
end

endmodule