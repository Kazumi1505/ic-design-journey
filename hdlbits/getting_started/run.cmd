@echo off
REM ============================================================
REM  HDLBits "Step one" - chay thu tren may
REM  Chay:  run.cmd
REM  Yeu cau: Icarus Verilog (chua can trong tuan 1..9)
REM ============================================================
setlocal

where iverilog >nul 2>nul
if errorlevel 1 (
    echo [CHUA CAI] Khong tim thay iverilog trong PATH.
    echo             Hien tai chua can: bam Simulate tren HDLBits la du.
    echo             Khi can chay tren may, xem SETUP_MOI_TRUONG.md muc 5.
    exit /b 1
)

iverilog -g2012 -o sim.vvp step_one.v tb_step_one.v
if errorlevel 1 (
    echo [LOI] Bien dich that bai.
    exit /b 1
)

vvp sim.vvp
endlocal
