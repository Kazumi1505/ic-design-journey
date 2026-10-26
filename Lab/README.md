# Lab khởi động — 3 bài đầu tiên

Ba lab này được viết sẵn để bạn **chạy được ngay trong tuần đầu tiên**, kể cả khi chưa biết gì về điện.
Mục tiêu không phải là "hiểu hết Verilog", mà là:

1. Thấy được vòng lặp **viết code → mô phỏng → xem waveform → sửa**.
2. Làm quen với khái niệm **testbench tự kiểm tra (self-checking)**, thứ mà 90% sinh viên bỏ qua và sau này phải trả giá khi đi làm DV.
3. Biết thế nào là mạch tổ hợp (combinational) và mạch tuần tự (sequential).

| Lab | Nội dung | Khái niệm học được |
|---|---|---|
| `lab01_mux2` | MUX 2:1 | Mạch tổ hợp, `assign`, testbench exhaustive |
| `lab02_counter` | Bộ đếm 4 bit | Clock, reset đồng bộ, `always @(posedge)`, non-blocking `<=` |
| `lab03_fsm` | Phát hiện chuỗi `1011` | FSM 3 khối, trạng thái, reference model |

---

## Cách chạy — chọn 1 trong 3

### Cách A: EDA Playground (không cần cài gì, nhanh nhất)

1. Vào https://edaplayground.com
2. Dán nội dung `mux2.v` vào ô **design**, `tb_mux2.v` vào ô **testbench**
3. Chọn **Icarus Verilog** ở cột Languages & Libraries, tick **Open EPWave after run**
4. Bấm **Run**

### Cách B: Icarus Verilog trên Windows

1. Tải và cài tại https://bleyer.org/icarus/ (bản x64, tick "Add to PATH")
2. (Tuỳ chọn) cài GTKWave cùng bộ cài để xem waveform
3. Mở PowerShell tại thư mục lab, chạy:

```powershell
.\run.cmd
```

Hoặc chạy tay:

```powershell
iverilog -g2012 -o sim.vvp mux2.v tb_mux2.v
vvp sim.vvp
gtkwave mux2.vcd
```

### Cách C: WSL2 / Ubuntu (gần với môi trường công ty nhất)

```bash
sudo apt update && sudo apt install -y iverilog gtkwave
iverilog -g2012 -o sim.vvp mux2.v tb_mux2.v && vvp sim.vvp
```

> Chạy được bằng WSL là một kỹ năng bạn **sẽ cần** ở năm 3–4, vì Synopsys/Cadence chỉ chạy trên Linux.
> Bắt đầu tập từ bây giờ thì rẻ hơn nhiều so với lúc phải học gấp.

---

## Kết quả đúng trông như thế nào

```
PASS: mux2 - 8/8 vectors OK
PASS: counter - tat ca kiem tra OK
PASS: seq_detect_1011 - N lan phat hien, 0 loi
```

Nếu ra `FAIL`, đọc dòng ngay bên dưới — nó in ra vector gây lỗi.

---

## Sau khi chạy xong, hãy tự trả lời

1. Trong `lab01`, tại sao `assign` không cần `always`?
2. Trong `lab02`, nếu đổi `rst` thành reset **bất đồng bộ** (`always @(posedge clk or posedge rst)`) thì hành vi khác gì?
3. Trong `lab03`, vì sao phải xử lý "overlap" (chồng lấn) ở trạng thái `S4`? Thử sửa `S4: next_state = din ? S0 : S0;` rồi chạy lại xem testbench báo lỗi ở đâu.
4. Trong `lab03`, testbench dùng "reference model" là gì? Nếu không có nó, bạn sẽ kiểm tra bằng cách nào?

---

## Bài tập mở rộng (làm trước khi sang lab tiếp theo)

- **lab01+**: mở rộng thành MUX 2:1 cho bus 8 bit (`input [7:0] a, b`).
- **lab02+**: thêm `load` để nạp giá trị `data_in` bất kỳ, thêm `up_down` để đếm xuôi/ngược.
- **lab03+**: viết lại thành FSM kiểu **Mealy** (output phụ thuộc cả state và input) và so sánh số trạng thái / độ trễ.

> Quy tắc: **mỗi lần sửa, phải chạy lại testbench.** Đừng bao giờ "chắc là đúng rồi".
