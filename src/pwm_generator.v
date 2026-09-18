module pwm_generator (
    input wire clk,
    input wire rst,
    input wire [7:0] duty_cycle, // 0 = 0%, 255 = ~100%
    output reg pwm_out
);
    reg [7:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 8'd0;
            pwm_out <= 1'b0;
        end else begin
            counter <= counter + 1;
            // Si el contador es menor al duty cycle, la salida es ALTA
            pwm_out <= (counter < duty_cycle) ? 1'b1 : 1'b0;
        end
    end
endmodule