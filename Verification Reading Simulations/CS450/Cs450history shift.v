module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output reg [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            predict_history <= 32'd0;

        else if (train_mispredicted)
            // Rollback to train_history and shift in actual taken result
            predict_history <= {train_history[30:0], train_taken};

        else if (predict_valid)
            // Shift in predicted result
            predict_history <= {predict_history[30:0], predict_taken};
    end

endmodule
