// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 

    always @(*) begin
        // Default all outputs to 0
        left = 0;
        down = 0;
        right = 0;
        up = 0;

        // Set the correct output based on scancode
        case (scancode)
            16'he06b: left  = 1;
            16'he072: down  = 1;
            16'he074: right = 1;
            16'he075: up    = 1;
            // No need for default because all outputs already set to 0
        endcase
    end
endmodule
