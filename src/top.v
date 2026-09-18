module top (
    input wire clk,                 // clk
    input wire rst,                 // reset
    input wire [7:0] dip_switch,    // 8 DIP Switch
    output wire [3:0] an,           // anode control
    output wire [6:0] seg,          // segs
    output wire dp                  // dp
);

    // Mandamos el dip_switch a los 2 dígitos derechos. Los 2 izquierdos los dejamos en 0.
    wire [15:0] display_data = {4'h0, 4'h0, dip_switch[7:4], dip_switch[3:0]};

    display_multiplexer display_unit (
        .clk(clk),
        .rst(rst),
        .data(display_data),
        .dp_in(4'b0010), // dp off
        .sel_dig(an),
        .seg(seg),
        .dp(dp)
    );

endmodule