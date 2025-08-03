module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
  always @(posedge clk) begin
        if (L)
            Q <= r_in;     // Load external value when L = 1
        else
            Q <= q_in;     // Load from previous flip-flop when L = 0
    end
endmodule
