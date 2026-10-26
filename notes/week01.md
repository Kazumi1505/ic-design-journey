# Tuần 1 (26/10/2026) — Getting Started

## Vì sao mình học cái này

> Mình học thiết kế vi mạch số vì ______________________

*(Điền một câu. Đến tháng thứ 8, câu này sẽ cứu bạn.)*

## Đã học

- **Verilog không phải chương trình.** Nó là *bản mô tả phần cứng*. Không có `main`, không chạy tuần tự, mọi dòng tồn tại đồng thời.
- **`assign` = hàn một sợi dây.** Không phải "gán giá trị một lần" như `x = 5` trong C.
- **`1'b1`** = 1 bit, hệ nhị phân, giá trị 1. Luôn ghi rõ độ rộng, đừng viết `1` trần (32 bit, dễ bị warning).
- **Port `output` mặc định là `wire`** → cần một nguồn lái liên tục → `assign` làm việc đó. Vì vậy bài này không cần `always`, không cần `reg`.
- **Vòng lặp công cụ:** viết code → compile (Quartus) → simulate (ModelSim) → so mismatch với mạch mẫu.
- **4 trạng thái:** Compile Error / Simulation Error / Incorrect / Success.
- **Quy tắc bất di bất dịch:** không đổi tên `top_module`, không đổi tên port.

## Đã làm (code)

- [x] `Step one` — `assign one = 1'b1;`
- [ ] `Zero`
- [ ] `Wire`
- [ ] `Wire4`
- Lab/module: *(chưa, bắt đầu từ tuần 3)*
- Link commit:

## Chỗ còn mù (quan trọng nhất)

- Phân biệt `wire` và `reg` — mới biết "output mặc định là wire", chưa hiểu khi nào bắt buộc dùng `reg`.
- Chưa biết simulation khác synthesis thế nào (chắc sang tuần 10 mới rõ).

## Câu hỏi cần giải đáp tuần sau

1. Nếu `assign one = 1;` (không có `1'b`) thì Quartus có báo lỗi hay chỉ warning?
2. Vì sao `output` mặc định là `wire` mà `reg` lại không lái được `wire`?

## Một câu tóm tắt tuần này

> Bài đầu tiên không dạy mạch — nó dạy cách bấm Simulate và đọc kết quả.

---

## Môi trường (đã setup)

- Trình duyệt + tài khoản HDLBits + EDA Playground
- VS Code: extension `mshr-h.veriloghdl` (tô màu) + `wavetrace` (xem waveform)
- Git: `init` + commit đầu tiên
- **Chưa cài** Icarus Verilog — để tuần 10 (xem `SETUP_MOI_TRUONG.md`)
