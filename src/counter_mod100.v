module counter_mod100 (
    input wire clk,
    input wire rst,
    input wire en,
    output wire [3:0] units,
    output wire [3:0] tens
);
    wire tc_units;

    // Unidades
    counter_mod10 count_u (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(units),
        .tc(tc_units)
    );

    // Decenas (se habilita solo cuando las unidades llegan a 9)
    counter_mod10 count_t (
        .clk(clk),
        .rst(rst),
        .en(tc_units), 
        .count(tens),
        .tc() // No lo usamos aquí, pero serviría para un mod 1000
    );
endmodule