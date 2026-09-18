module top (
    input wire clk,                 // clk
    input wire rst,                 // reset
    input wire [7:0] dip_switch,    // 8 DIP Switch
    output wire [3:0] an,           // anode control
    output wire [6:0] seg,          // segs
    output wire dp                  // dp
);

    // El orden del los displays toman en orden viceversa a como se asigna en el arreglo display_data[15:00].
    // display_data[15:12]	Display 1
    // display_data[11:8]	Display 2
    // display_data[7:4]	Display 3
    // display_data[3:0]	Display 4
    

    // Se habilita los datos de despliegue solo para el display 1 y los demás se habilitan en 0.
    wire [15:0] display_data = {dip_switch[3:0], 4'h0, 4'h0, 4'h0};

    display_multiplexer display_unit (
        .clk(clk),
        .rst(rst),
        .data(display_data),
        .dp_in(4'b0000), // Puntos decimales apagados para desplegar los datos puramente positivos
        .sel_dig(an),
        .seg(seg),
        .dp(dp)
    );

endmodule