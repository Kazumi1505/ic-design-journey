@echo off
REM ============================================================
REM  Lab 01 - MUX 2:1
REM  Chay:  run.cmd
REM  Yeu cau: da cai Icarus Verilog va co iverilog trong PATH
REM ============================================================
setlocal

where iverilog >nul 2>nul
if errorlevel 1 (
    echo [LOI] Khong tim thay iverilog trong PATH.
    echo       Cai Icarus Verilog: https://bleyer.org/icarus/
    echo       Hoac chay tren EDA Playground: https://edaplayground.com
    exit /b 1
)

iverilog -g2012 -o sim.vvp mux2.v tb_mux2.v
if errorlevel 1 (
    echo [LOI] Bien dich that bai.
    exit /b 1
)

vvp sim.vvp

echo.
echo Xong. Mo waveform bang:  gtkwave mux2.vcd
endlocal
