// ============================================================
// Lab 03 - Sequence detector "1011" (FSM dang Moore)
// ------------------------------------------------------------
// Nhan tin hieu din moi chu ky clock. Khi 4 bit gan nhat
// (theo thu tu thoi gian) tao thanh chuoi 1011 thi found = 1.
//
// Kieu thiet ke: 3 khoi (3-block FSM style) - day la style
// chuan trong cong nghiep, hay hoc that ky:
//   1. Khoi thanh ghi trang thai  (sequential)
//   2. Khoi tinh trang thai ke tiep (combinational)
//   3. Khoi tinh output           (combinational hoac sequential)
//
// Y nghia cac trang thai = "tien to dai nhat cua 1011 da thay":
//   S0 = chua co gi        S1 = "1"
//   S2 = "10"              S3 = "101"
//   S4 = "1011"  -> found = 1
// ============================================================
`timescale 1ns/1ps

module seq_detect_1011 (
    input  wire clk,
    input  wire rst,     // reset dong bo, tich cuc muc 1
    input  wire din,
    output wire found
);

    localparam S0 = 3'd0;
    localparam S1 = 3'd1;
    localparam S2 = 3'd2;
    localparam S3 = 3'd3;
    localparam S4 = 3'd4;

    reg [2:0] state;
    reg [2:0] next_state;

    // ---------- 1. Thanh ghi trang thai ----------
    always @(posedge clk) begin
        if (rst) state <= S0;
        else     state <= next_state;
    end

    // ---------- 2. Logic trang thai ke tiep ----------
    // Xu ly chong lan (overlap): sau "1011" ma gap bit 1 thi
    // tien to moi la "1" (S1), gap bit 0 thi la "10" (S2).
    always @(*) begin
        case (state)
            S0: next_state = din ? S1 : S0;
            S1: next_state = din ? S1 : S2;
            S2: next_state = din ? S3 : S0;
            S3: next_state = din ? S4 : S2;
            S4: next_state = din ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // ---------- 3. Output (Moore: chi phu thuoc trang thai) ----------
    assign found = (state == S4);

endmodule
