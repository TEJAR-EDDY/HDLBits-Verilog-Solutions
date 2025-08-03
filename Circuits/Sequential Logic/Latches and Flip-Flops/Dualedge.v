module top_module (
    input clk,
    input d,
    output q
);reg p,n;
    always @ (posedge clk)begin
        p <= d;
  end
    always @ (negedge clk)begin
       n <= d;
     end
 //	assign q = clk & p | ~clk & n;
    assign q=clk?p:n;

endmodule
