module counter_mod10 (
    input wire clk,
    input wire rst,
    input wire en,          // Habilitador de cuenta
    output reg [3:0] count,
    output wire tc          // Terminal Count (pulso al llegar a 9)
);
    assign tc = (count == 4'd9) && en;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'd0;
        end else if (en) begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 1;
        end
    end
endmodule