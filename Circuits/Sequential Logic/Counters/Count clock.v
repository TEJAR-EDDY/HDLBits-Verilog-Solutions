module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
//Split BCD digits for easier access
    wire [3:0] sec_ones = ss[3:0];
    wire [3:0] sec_tens = ss[7:4];
    wire [3:0] min_ones = mm[3:0];
    wire [3:0] min_tens = mm[7:4];
    wire [3:0] hour_ones = hh[3:0];
    wire [3:0] hour_tens = hh[7:4];

    always @(posedge clk) begin
        if (reset) begin
            // Reset to 12:00:00 AM
            ss <= 8'h00;
            mm <= 8'h00;
            hh <= 8'h12;
            pm <= 1'b0;
        end
        else if (ena) begin
            // ---- SECONDS ----
            if (sec_ones == 4'd9) begin
                ss[3:0] <= 4'd0;
                if (sec_tens == 4'd5) begin
                    ss[7:4] <= 4'd0;

                    // ---- MINUTES ----
                    if (min_ones == 4'd9) begin
                        mm[3:0] <= 4'd0;
                        if (min_tens == 4'd5) begin
                            mm[7:4] <= 4'd0;

                            // ---- HOURS ----
                            if (hh == 8'h11) begin
                                hh <= 8'h12; // 11 ? 12
                                pm <= ~pm;   // Toggle AM/PM
                            end
                            else if (hh == 8'h12) begin
                                hh <= 8'h01; // 12 ? 01
                            end
                            else if (hour_ones == 4'd9) begin
                                hh[3:0] <= 4'd0;
                                hh[7:4] <= hh[7:4] + 1;
                            end
                            else begin
                                hh[3:0] <= hh[3:0] + 1;
                            end

                        end else begin
                            mm[7:4] <= mm[7:4] + 1;
                        end
                    end else begin
                        mm[3:0] <= mm[3:0] + 1;
                    end

                end else begin
                    ss[7:4] <= ss[7:4] + 1;
                end
            end else begin
                ss[3:0] <= ss[3:0] + 1;
            end
        end
    end

//endmodule
endmodule
