          module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
parameter A = 0, B = 1;

 reg state, next;
    reg [1:0] count;
    reg [1:0] count1;

    always @(*) begin
  		case(state)
   			A : next = (s) ? B : A;
   			B : next = B;
  endcase
 end

 always @(posedge clk) begin
  if (reset) begin
   state <= A;
            count=0;
            count1=0;
  end
  else begin 
      state <= next;
        
      if(state==B) begin
                if(count1==3)begin
                    count=0;
                    count1=0;
                end
                if(w==1) count=count+1;
                    count1=count1+1;
             end
    end
 end    


    assign z = ((count == 2) & (count1 == 3) );
endmodulemodule top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    // Declare state variables
    reg [2:0] state, next_state;

    // Synchronous state transition with synchronous reset
    always @(posedge clk) begin
        if (reset)
            state <= 3'b000;
        else
            state <= next_state;
    end

    // Next state logic based on the table
    always @(*) begin
        case (state)
            3'b000: next_state = (x ? 3'b001 : 3'b000);
            3'b001: next_state = (x ? 3'b100 : 3'b001);
            3'b010: next_state = (x ? 3'b001 : 3'b010);
            3'b011: next_state = (x ? 3'b010 : 3'b001);
            3'b100: next_state = (x ? 3'b100 : 3'b011);
            default: next_state = 3'b000; // safety fallback
        endcase
    end

    // Output logic based on the present state
    assign z = (state == 3'b011 || state == 3'b100);

endmodule
