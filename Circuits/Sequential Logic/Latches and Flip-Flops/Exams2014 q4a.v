module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
 	wire mux1_out = E ? w : Q;      // First MUX: shift or hold
    wire mux2_out = L ? R : mux1_out; // Second MUX: load or (shift/hold)

    always @(posedge clk) begin
        Q <= mux2_out;
    end
endmodule
