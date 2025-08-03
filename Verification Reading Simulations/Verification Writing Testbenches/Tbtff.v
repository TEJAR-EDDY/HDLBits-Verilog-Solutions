module top_module();

    // Testbench signals
    reg clk;
    reg reset;
    reg t;
    wire q;

    // Instantiate the T flip-flop
    tff uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    // Generate clock with period 10 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle every 5 units
    end

    // Stimulus
    initial begin
        // Initialize inputs
        reset = 1; t = 0;
        #10;       // Hold reset high for one clock edge

        reset = 0; // Release reset
        t = 1;     // Start toggling

        #10;       // Allow one toggle to '1'

        t = 0;     // Stop toggling

        #20;       // Wait a bit
        $finish;
    end

endmodule
