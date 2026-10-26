// ============================================================
//  Testbench cho "Step one"
//  Mạch không có input -> testbench không cần kích thích gì.
//  Nhiệm vụ duy nhất: in ra giá trị `one` ở vài thời điểm.
// ============================================================

`timescale 1ns / 1ps

module tb_step_one;

    wire one;                       // dây nối tới chân output của DUT

    top_module dut ( .one(one) );   // "dut" = device under test

    initial begin
        $display("----------------------------------------");
        $display(" HDLBits: Step one  (output luon = 1)");
        $display("----------------------------------------");

        #1  $display(" t = %0t   one = %b", $time, one);
        #10 $display(" t = %0t   one = %b", $time, one);
        #10 $display(" t = %0t   one = %b", $time, one);

        if (one !== 1'b1)
            $display(" KET QUA: SAI  (one phai la 1)");
        else
            $display(" KET QUA: DUNG");

        $finish;
    end

endmodule
