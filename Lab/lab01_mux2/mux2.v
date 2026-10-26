// ============================================================
// Lab 01 - MUX 2:1 (combinational)
// ------------------------------------------------------------
// y = sel ? b : a
//
// Day la mach to hop (combinational) don gian nhat trong
// digital design. Khong co clock, khong co trang thai.
// ============================================================
`timescale 1ns/1ps

module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire y
);

    // assign = continuous assignment: mo ta phan cung to hop
    assign y = sel ? b : a;

endmodule
