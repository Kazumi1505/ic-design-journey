# HDLBits — lưu lời giải tại đây

## Vì sao lưu?

HDLBits giữ bài trên server của họ. Nếu một ngày trang đổi, tài khoản mất, hay bạn muốn `git log` xem mình tiến bộ thế nào — bạn cần **bản sao trên máy**.

Và quan trọng hơn: mỗi tuần cần **1 commit** (xem `README.md` gốc). Commit cần file. File ở đây.

## Quy ước

```
hdlbits/
├── getting_started/     step_one.v, zero.v, wire.v, ...
│   └── <ten_bai>.v      ← lời giải, giữ nguyên tên module/port
└── ...
```

- **Một bài = một file**, đặt trong thư mục cùng tên với mục trên HDLBits.
- **Giữ nguyên** `top_module` và tên port như đề cho.
- **Không copy solution.** Gõ lại bằng tay — kể cả khi đã biết đáp án. Đó là lúc trí nhớ hình thành.
- Cuối mỗi buổi: `git add . && git commit -m "HDLBits: getting started"`

## Chạy thử trên máy

Mỗi thư mục có `run.cmd` chạy testbench của bài đó. **Chưa cần trong tuần 1–9** — bấm Simulate trên HDLBits là đủ.

Khi chưa cài Icarus Verilog, `run.cmd` sẽ báo `[CHUA CAI]` rồi thoát — không có gì hỏng.

## Trạng thái

| Bài | Đã làm | Ghi chú |
|---|---|---|
| `step_one` | ☐ | output luôn = 1 |
| `zero` | ☐ | output luôn = 0 |
| `wire` | ☐ | bài đầu tiên có input |
| `wire4` | ☐ | |
