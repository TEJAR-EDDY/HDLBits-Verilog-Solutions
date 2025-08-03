module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q 
);

    reg [15:0] grid[15:0];       // 16x16 grid

    integer i, j;

    // Flattened output
    genvar row, col;
    generate
        for (row = 0; row < 16; row = row + 1) begin: flatten_rows
            for (col = 0; col < 16; col = col + 1) begin: flatten_cols
                assign q[row*16 + col] = grid[row][col];
            end
        end
    endgenerate

  always @(posedge clk) begin
    if (load) begin
        for (i = 0; i < 16; i = i + 1) begin
            grid[i] <= data[i*16 +: 16];
        end
    end else begin
        reg [15:0] new_grid[15:0];
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                integer up, down, left, right, neighbors;

                up    = (i == 0)  ? 15 : i - 1;
                down  = (i == 15) ?  0 : i + 1;
                left  = (j == 0)  ? 15 : j - 1;
                right = (j == 15) ?  0 : j + 1;

                neighbors = 
                    grid[up][left]   + grid[up][j]   + grid[up][right] +
                    grid[i][left]                   + grid[i][right] +
                    grid[down][left] + grid[down][j] + grid[down][right];

                case (neighbors)
                    2: new_grid[i][j] = grid[i][j];
                    3: new_grid[i][j] = 1;
                    default: new_grid[i][j] = 0;
                endcase
            end
        end

        for (i = 0; i < 16; i = i + 1)
            grid[i] <= new_grid[i];
    end
end


endmodule
