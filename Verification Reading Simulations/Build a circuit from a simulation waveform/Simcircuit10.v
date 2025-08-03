module top_module (
    input clk,
    input a,
    input b,
    output reg q,      // Make q a reg
    output reg state  
);

    always @ (posedge clk)
        if (a == b)
            state <= a;

    always @ (*)
        if (a == b)
            q = state;
        else
            q = ~state;

endmodule
