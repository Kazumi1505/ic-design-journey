// ============================================================
// Lab 02 - Counter (sequential)
// ------------------------------------------------------------
// Bo dem len WIDTH bit, co:
//   - rst : reset DONG BO (synchronous), tich cuc muc 1
//   - en  : enable, bang 0 thi giu nguyen gia tri
//
// Day la vien gach cua hau het mach so: thanh ghi + cong.
// ============================================================
`timescale 1ns/1ps

module counter #(
    parameter WIDTH = 4
) (
    input  wire             clk,
    input  wire             rst,
    input  wire             en,
    output reg  [WIDTH-1:0] count
);

    // always @(posedge clk) => logic tuan tu, suy ra thanh ghi (flip-flop)
    // Dung "nonblocking" (<=) trong khoi tuan tu. Day la quy tac bat buoc.
    always @(posedge clk) begin
        if (rst)
            count <= {WIDTH{1'b0}};
        else if (en)
            count <= count + 1'b1;   // tu dong tran (wrap) khi het WIDTH bit
    end

endmodule
