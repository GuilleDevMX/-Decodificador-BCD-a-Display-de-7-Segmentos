module sumador_3b (
    input wire [2:0] a,
    input wire [2:0] b,
    output wire [3:0] suma
);
    assign suma = a + b;
endmodule