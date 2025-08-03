module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
parameter A=0,B=1;
    reg state,next;
    always @ (posedge clk or posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next;
    end
    always@(*)begin 
        case(state)
            A:next=x?B:A;
            B:next=1;
        endcase
    end
     assign z = (state && !x) || (!state && x);
endmodule
