# TKVM — Hành trình Digital IC Design

Thư mục làm việc cho việc tự học **thiết kế vi mạch số**, bắt đầu từ con số 0 (chưa biết gì về điện), với **5 giờ/tuần**.

## Bắt đầu từ đâu

| Bước | Mở file | Mất bao lâu |
|---|---|---|
| 0 | [`SETUP_MOI_TRUONG.md`](./SETUP_MOI_TRUONG.md) — dựng môi trường học (20 phút, không cài gì) | 20 phút |
| 1 | [`KE_HOACH_5H_TUAN.md`](./KE_HOACH_5H_TUAN.md) — kế hoạch 12 tuần đầu, đọc hết | 15 phút |
| 2 | [`Lab/README.md`](./Lab/README.md) — chạy lab đầu tiên | 1 giờ |
| 3 | [`Tai_Lieu/README.md`](./Tai_Lieu/README.md) — tải 14 tài liệu cần thiết | 20 phút |
| 4 | [`LO_TRINH_DIGITAL_IC_DESIGN.md`](./LO_TRINH_DIGITAL_IC_DESIGN.md) — bức tranh 24 tháng (đọc khi cần định hướng) | 30 phút |

## Cấu trúc

```
TKVM/
├── SETUP_MOI_TRUONG.md             ← dựng môi trường: 20 phút, 0 cài đặt
├── KE_HOACH_5H_TUAN.md             ← KẾ HOẠCH CHÍNH: 5 h/tuần, lịch 12 tuần
├── LO_TRINH_DIGITAL_IC_DESIGN.md   ← lộ trình 24 tháng (bản 10–12 h/tuần)
├── hdlbits/                        ← lời giải HDLBits, mỗi bài 1 file .v + testbench
├── Lab/                            ← 3 lab chạy được ngay (Verilog + testbench)
│   ├── lab01_mux2/                 ← mạch tổ hợp
│   ├── lab02_counter/              ← mạch tuần tự (clock, reset)
│   └── lab03_fsm/                  ← FSM + reference model
├── Tai_Lieu/                       ← danh mục PDF + link tải (bỏ file tải về vào đây)
│   ├── 00_Nhap_mon/
│   ├── 01_Dien_tu_can_ban/
│   ├── 02_Dien_tu_so/
│   ├── 03_Verilog_RTL/
│   ├── 04_STA_Synthesis/
│   └── 05_Cong_cu/
└── notes/                          ← ghi chú học tập, mỗi tuần 1 file
```

## Nguyên tắc của thư mục này

1. **Mỗi tuần ít nhất 1 commit** — repo này là portfolio của bạn, không phải nơi chứa sách.
2. **Không có code thì không tính là đã học** — đọc xong một chương phải viết được một module.
3. **Testbench không phải phần phụ** — mạch không có testbench là mạch chưa làm xong.
4. **Không có tuần 0 giờ** — tuần bận thì làm 1 bài HDLBits + 1 commit (30 phút).
5. **Cập nhật lộ trình mỗi 3 tháng** — kế hoạch sống, không phải kế hoạch đẹp.
