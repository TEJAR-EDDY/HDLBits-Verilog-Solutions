module top_module(
    input clk, 
    input load, 
    input [9:0] data, 
    output tc
);

    reg [9:0] counter;

    always @(posedge clk) begin
        if (load) begin
            counter <= data;        // Load value on rising clock if load is high
        end else if (counter != 0) begin
            counter <= counter - 1; // Decrement if not already zero
        end
        // Else, do nothing if counter is 0
    end

    assign tc = (counter == 0);     // Terminal count output

endmodule
