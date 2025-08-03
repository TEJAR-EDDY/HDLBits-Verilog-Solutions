module top_module(
    input clk,
    input in,
    input reset,
    output out); //
   reg [1:0] next,state;
    
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;

    // State transition logic
    always@(*)begin
        case(state)
            A:next=in?B:A;
            B:next=in?B:C;
            C:next=in?D:A;
            D:next=in?B:C;
        endcase
    end


    // State flip-flops with synchronous reset
    always@(posedge clk)
        begin
            if(reset)
                state<=A;
            else
                state<=next;
        end

    // Output logic
    assign out=(state===D);

endmodule
