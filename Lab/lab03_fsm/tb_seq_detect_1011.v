// ============================================================
// Testbench cho seq_detect_1011 - self-checking + reference model
// ------------------------------------------------------------
// Day la bai hoc DV (Design Verification) dau tien cua ban:
//   Thay vi tu nghi ra ket qua mong doi, ta viet mot
//   "reference model" don gian hon nhieu (o day la mot thanh
//   ghi dich 4 bit) va so sanh voi DUT.
//
//   expected == 1  <=>  4 bit gan nhat la 1011
// ============================================================
`timescale 1ns/1ps

module tb_seq_detect_1011;

    reg  clk;
    reg  rst;
    reg  din;
    wire found;

    // Reference model: thanh ghi dich luu 4 bit gan nhat
    reg [3:0] hist;

    integer i;
    integer errors = 0;
    integer n_hits = 0;

    // Chuoi test 32 bit (dua vao tu MSB -> LSB, tuc la theo thoi gian)
    reg [31:0] pattern;

    wire expected = (hist == 4'b1011);

    seq_detect_1011 dut (
        .clk   (clk),
        .rst   (rst),
        .din   (din),
        .found (found)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Reference model chay song song, cung clock voi DUT
    always @(posedge clk) begin
        if (rst) hist <= 4'b0000;
        else     hist <= {hist[2:0], din};
    end

    initial begin
        $dumpfile("seq_detect.vcd");
        $dumpvars(0, tb_seq_detect_1011);

        pattern = 32'b1101_1011_0110_1011_1010_1101_0111_1011;
        hist    = 4'b0000;

        $display("==============================================");
        $display(" TB seq_detect_1011 - pattern = %b", pattern);
        $display("==============================================");

        rst = 1'b1;
        din = 1'b0;
        repeat (2) @(negedge clk);
        rst = 1'b0;

        for (i = 0; i < 32; i = i + 1) begin
            din = pattern[31 - i];        // drive o negedge (an toan, khong race)
            @(negedge clk);               // doi posedge sample, roi kiem tra

            if (found !== expected) begin
                errors = errors + 1;
                $display("FAIL @%0t: din=%b hist=%b found=%b expected=%b",
                         $time, din, hist, found, expected);
            end

            if (found === 1'b1) begin
                n_hits = n_hits + 1;
                $display("  phat hien 1011 tai bit thu %0d (hist=%b)", i, hist);
            end
        end

        $display("----------------------------------------------");
        if (errors == 0)
            $display("PASS: seq_detect_1011 - %0d lan phat hien, 0 loi", n_hits);
        else
            $display("FAIL: seq_detect_1011 - %0d loi", errors);

        $finish;
    end

    // Watchdog: tranh treo vo han neu DUT khong chay
    initial begin
        #10000;
        $display("TIMEOUT: mo phong chay qua lau, kiem tra lai clock/reset");
        $finish;
    end

endmodule
