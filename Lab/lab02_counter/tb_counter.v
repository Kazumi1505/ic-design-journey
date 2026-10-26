// ============================================================
// Testbench cho counter - self-checking
// ------------------------------------------------------------
// Kiem tra 4 thu:
//   1. Reset dua count ve 0
//   2. en=1 thi dem len moi chu ky
//   3. en=0 thi giu nguyen
//   4. Tran (rollover) tu 15 -> 0
//
// Luu y cach lam sach race condition:
//   - Kich thich (drive) o NEGEDGE
//   - Kiem tra (check) o NEGEDGE, sau khi DUT da cap nhat o POSEDGE
// ============================================================
`timescale 1ns/1ps

module tb_counter;

    localparam WIDTH = 4;
    localparam MAX   = (1 << WIDTH);   // 16

    reg  clk;
    reg  rst;
    reg  en;
    wire [WIDTH-1:0] count;

    integer errors = 0;
    integer i;

    counter #(.WIDTH(WIDTH)) dut (
        .clk   (clk),
        .rst   (rst),
        .en    (en),
        .count (count)
    );

    // Clock 100 MHz (chu ky 10 ns)
    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter);

        $display("========================================");
        $display(" TB counter (%0d bit)", WIDTH);
        $display("========================================");

        // ---------- 1. Reset ----------
        rst = 1'b1;
        en  = 1'b0;
        repeat (3) @(negedge clk);
        if (count !== 0) begin
            errors = errors + 1;
            $display("FAIL: sau reset count=%0d, mong doi 0", count);
        end

        // ---------- 2. Dem len 20 chu ky (co tran) ----------
        rst = 1'b0;
        en  = 1'b1;
        for (i = 0; i < 20; i = i + 1) begin
            @(negedge clk);
            if (count !== ((i + 1) % MAX)) begin
                errors = errors + 1;
                $display("FAIL @%0t: count=%0d, mong doi %0d", $time, count, (i + 1) % MAX);
            end
        end
        // Sau 20 nhip tu 0 => 20 % 16 = 4
        if (count !== 4) begin
            errors = errors + 1;
            $display("FAIL: sau 20 nhip count=%0d, mong doi 4", count);
        end

        // ---------- 3. Giu nguyen khi en=0 ----------
        en = 1'b0;
        repeat (3) @(negedge clk);
        if (count !== 4) begin
            errors = errors + 1;
            $display("FAIL: en=0 nhung count=%0d, mong doi giu nguyen 4", count);
        end

        // ---------- 4. Reset dong bo ----------
        rst = 1'b1;
        @(negedge clk);
        if (count !== 0) begin
            errors = errors + 1;
            $display("FAIL: reset dong bo khong hoat dong, count=%0d", count);
        end

        if (errors == 0)
            $display("\nPASS: counter - tat ca kiem tra OK");
        else
            $display("\nFAIL: counter - %0d loi", errors);

        $finish;
    end

endmodule
