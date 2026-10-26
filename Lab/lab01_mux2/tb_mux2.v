// ============================================================
// Testbench cho mux2 - kieu "self-checking"
// ------------------------------------------------------------
// Y tuong quan trong nhat cua ca lo trinh:
//   KHONG BAO GIO tin vao waveform bang mat thuong.
//   Hay de testbench TU KIEM TRA va in ra PASS/FAIL.
//
// Testbench nay duyet het 2^3 = 8 to hop dau vao (exhaustive).
// ============================================================
`timescale 1ns/1ps

module tb_mux2;

    reg  a, b, sel;
    wire y;

    integer errors = 0;
    integer i;
    reg expected;

    // Noi DUT (Device Under Test) vao testbench
    mux2 dut (
        .a   (a),
        .b   (b),
        .sel (sel),
        .y   (y)
    );

    initial begin
        // Xuat waveform de xem bang GTKWave
        $dumpfile("mux2.vcd");
        $dumpvars(0, tb_mux2);

        $display("========================================");
        $display(" TB mux2: duyet 8 to hop dau vao");
        $display("========================================");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, sel} = i[2:0];
            #1;                                   // cho tin hieu on dinh
            expected = sel ? b : a;               // mo hinh tham chieu (reference model)
            $display(" a=%b b=%b sel=%b | y=%b | expected=%b", a, b, sel, y, expected);

            if (y !== expected) begin
                errors = errors + 1;
                $display("   -> FAIL");
            end
        end

        if (errors == 0)
            $display("\nPASS: mux2 - 8/8 vectors OK");
        else
            $display("\nFAIL: mux2 - %0d loi", errors);

        $finish;
    end

endmodule
