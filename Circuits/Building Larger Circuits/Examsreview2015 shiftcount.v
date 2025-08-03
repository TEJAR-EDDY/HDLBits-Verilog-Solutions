module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    assign out=in[sel];
endmodule
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    always@(posedge clk)
        if(shift_ena)
            q<={q[2:0],data};
    else if(count_ena)
        q<=q-1;
   else 
       q<=q;
endmodule
