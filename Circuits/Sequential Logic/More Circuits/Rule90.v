module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
integer i;
     reg[511:0]q_next;
    always@(posedge clk)begin
        if(load)
            q<=data;
        else begin
            q_next[0]=q[1];
            for(i=1;i<511;i++)begin
                q_next[i]=q[i-1]^q[i+1];
            end
            q_next[511]=q[510];
            q<=q_next;
        end
    end
        
            
endmodule
