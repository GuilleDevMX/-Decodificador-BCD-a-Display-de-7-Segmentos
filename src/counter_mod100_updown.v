module counter_mod100_updown (
    input wire clk,
    input wire rst,
    input wire en,
    input wire up_down,
    output reg [3:0] units,
    output reg [3:0] tens
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            units <= 4'd0;
            tens <= 4'd0;
        end else if (en) begin
            if (up_down) begin // Ascendente
                if (units == 4'd9) begin
                    units <= 4'd0;
                    if (tens == 4'd9) tens <= 4'd0;
                    else tens <= tens + 1;
                end else begin
                    units <= units + 1;
                end
            end else begin // Descendente
                if (units == 4'd0) begin
                    units <= 4'd9;
                    if (tens == 4'd0) tens <= 4'd9;
                    else tens <= tens - 1;
                end else begin
                    units <= units - 1;
                end
            end
        end
    end
endmodule