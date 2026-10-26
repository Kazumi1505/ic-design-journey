# Lộ trình Digital IC Design — bắt đầu từ con số 0

> **Dành cho:** tân sinh viên PTIT, chương trình Công nghệ vi mạch bán dẫn (7510301_MBD), Khoa Kỹ thuật Điện tử 1.
> **Mục tiêu:** đi hướng **Digital IC Design** (RTL Design và/hoặc Design Verification).
> **Điểm xuất phát:** chưa biết gì về điện.
> **Cập nhật:** 26/10/2026.
>
> ⚠️ **Nếu bạn chỉ có 5 giờ/tuần:** đọc [KE_HOACH_5H_TUAN.md](KE_HOACH_5H_TUAN.md) trước. Lộ trình dưới đây được thiết kế cho 10–12 h/tuần; bản 5 h/tuần đã được cắt gọt riêng.

---

## 0. TL;DR — đọc 2 phút là nắm được

Năm đầu tiên bạn **không** cần học "thiết kế chip". Bạn cần đúng 4 thứ:

1. **Số học nhị phân + đại số Boolean** (đây là toán, không phải điện — học được ngay tuần này)
2. **Điện cơ bản ở mức trực giác** (điện áp, dòng, transistor như cái công tắc)
3. **C + Linux + Git** (ngôn ngữ làm việc của kỹ sư IC)
4. **Verilog** (ngôn ngữ mô tả phần cứng)

| Giai đoạn | Thời gian | Trọng tâm | Sản phẩm phải có |
|---|---|---|---|
| **0** | Tuần 1–2 | Định hướng nghề, dựng môi trường | Repo GitHub + 3 lab chạy được |
| **1** | Tháng 1–4 | Nền tảng: điện cơ bản, Boolean, mạch số, C, Linux | 10 mạch tổ hợp + 5 mạch tuần tự bằng Verilog |
| **2** | Tháng 5–9 | Verilog "thật", thiết kế module, testbench | UART, SPI, FIFO, ALU, FSM — **có testbench tự kiểm tra** |
| **3** | Tháng 10–14 | CDC, protocol APB/AHB/AXI, synthesis, STA | 1 APB subsystem + đọc hiểu timing report |
| **4** | Tháng 15–24 | DV (SystemVerilog/UVM) hoặc DE nâng cao, flow mã nguồn mở | 1 project đủ để kể trong phỏng vấn → apply intern |

Thời lượng thực tế: **10–12 giờ/tuần**. Đây là con số bền vững cho một sinh viên còn học trên trường. Đừng lên kế hoạch 30 giờ/tuần rồi bỏ sau 3 tuần.

---

## 1. Ba điều cần hiểu đúng trước khi bắt đầu

### 1.1. "Digital IC design" không phải một nghề — nó là 6 nghề

| Vị trí | Làm gì | Cần giỏi gì | Ở VN có nhiều việc? |
|---|---|---|---|
| **RTL Design (DE)** | Viết Verilog mô tả vi mạch | Digital logic, kiến trúc, Verilog | Có, nhưng ít slot hơn DV |
| **Design Verification (DV)** | Viết testbench, tìm bug của DE | SystemVerilog, UVM, tư duy phá hoại | **Nhiều nhất** |
| **DFT** | Chèn mạch test vào chip | Scan, ATPG, JTAG | Trung bình |
| **Synthesis / STA** | Chuyển RTL → cổng, kiểm tra timing | Tcl, constraint, timing | Trung bình |
| **Physical Design (PD)** | Đặt & nối transistor | Layout, DRC/LVS, PnR | Trung bình |
| **Analog / Mixed-signal** | Op-amp, PLL, ADC | Điện tử tương tự (rất sâu) | Ít hơn nhưng lương cao |

**Kết luận thực dụng:** học chắc **RTL trước**, rồi rẽ sang **DV** nếu muốn nhanh có việc. Việc DV ở Việt Nam hiện nhiều hơn DE, và kỹ năng RTL là điều kiện cần để làm DV giỏi. Đừng chọn DV ngay từ đầu khi chưa từng viết một module nào.

### 1.2. Bạn không cần giỏi analog — nhưng cần hiểu 5 khái niệm

Người làm digital mà không hiểu gì về điện sẽ tắc ở đúng 3 chỗ: đọc timing report, hiểu tại sao chip nóng, và debug khi mô phỏng đúng mà chip chạy sai.

| Khái niệm | Cần hiểu đến đâu | Vì sao digital cần |
|---|---|---|
| Điện áp / dòng / điện trở | Định luật Ohm, chia áp | Đọc schematic, hiểu mức logic 0/1 là gì |
| Transistor MOSFET như công tắc | Chỉ mức trực giác | Biết cổng logic được tạo ra từ gì |
| Delay lan truyền | Trễ qua cổng, đường tới hạn | Toàn bộ STA xoay quanh khái niệm này |
| Công suất động | P ≈ C·V²·f·α | Hiểu vì sao clock tốn điện, vì sao phải clock gating |
| Nhiễu / toàn vẹn tín hiệu | Ở mức "nghe hiểu" | Hiểu vì sao chip thật khác mô phỏng |

Ngoài 5 cái này, bạn **không cần** giải mạch op-amp, không cần tính trở kháng phức, không cần biết vật lý bán dẫn ở mức phương trình.

### 1.3. Thứ tự học quan trọng hơn tốc độ

Đường sai (rất phổ biến): nhảy vào Verilog → thấy khó → nghĩ "chắc tại mình chưa học analog" → lao vào sách điện tử tương tự 900 trang → bỏ cuộc.

Đường đúng:

```
Nhị phân & Boolean  →  Mạch số (cổng, FSM)  →  Verilog  →  Thiết kế module
      ↓                                            ↓
  (học song song)                            Testbench & verify
      ↓                                            ↓
 Điện cơ bản (nhẹ)  →  STA / Synthesis  →  Protocol  →  UVM / Formal
```

---

## 2. Giai đoạn 0 — Tuần 1–2: Định hướng & môi trường

### Mục tiêu
Biết mình đang đi đâu, và có một môi trường chạy được code. **Không** học lý thuyết nặng ở giai đoạn này.

### Việc phải làm

| # | Việc | Thời gian |
|---|---|---|
| 1 | Đọc 3 PDF **Nhập môn TKVM** của tác giả repo (đặc biệt *Hệ sinh thái ngành vi mạch* và *Quy trình TKVM*) | 3 h |
| 2 | Xem 1 video "chip được làm ra như thế nào" (chip fabrication) để có hình dung | 30 min |
| 3 | Cài **VS Code** + extension `Verilog-HDL/SystemVerilog` | 20 min |
| 4 | Cài **Git**, tạo tài khoản GitHub, tạo repo `ic-design-journey` | 30 min |
| 5 | Chạy 3 lab trong thư mục `Lab/` (xem `Lab/README.md`) | 2 h |
| 6 | Học 10 lệnh Linux cơ bản (`ls, cd, pwd, mkdir, cp, mv, rm, cat, grep, chmod`) | 1 h |

### Cửa ải để sang giai đoạn 1
- [ ] Giải thích được cho một người không học kỹ thuật: **RTL design khác DV ở chỗ nào**.
- [ ] Chạy được `Lab/lab01_mux2` và thấy dòng `PASS`.
- [ ] Đã push ít nhất 1 commit lên GitHub.

> **Đừng** cài Synopsys/Cadence ở bước này. Chúng không chạy trên Windows, nặng vài chục GB, và bạn chưa cần.

---

## 3. Giai đoạn 1 — Tháng 1–4: Nền tảng

Đây là giai đoạn "nhàm chán" nhất và cũng là giai đoạn quyết định. Ai bỏ cuộc thường bỏ ở đây.

### 3.1. Ba mạch song song (đừng học tuần tự từng cái)

**Mạch A — Điện tử số (trọng tâm, 50% thời gian)**

Lộ trình 12 tuần:

| Tuần | Nội dung | Bài tập |
|---|---|---|
| 1–2 | Hệ số đếm (nhị phân, hex), bù 2, phép toán nhị phân | Đổi cơ số bằng tay 50 bài; cộng/trừ số có dấu |
| 3–4 | Đại số Boolean, cổng logic, bảng chân trị | Rút gọn bằng đại số + Karnaugh map |
| 5–6 | Mạch tổ hợp: MUX, decoder, adder, comparator | Viết Verilog cho 6 mạch này |
| 7–8 | Flip-flop, latch, thanh ghi, counter | Viết Verilog + testbench |
| 9–10 | FSM (Moore/Mealy), thiết kế theo state diagram | FSM bán vé, FSM thang máy, FSM phát hiện chuỗi |
| 11–12 | Memory (RAM/ROM), timing cơ bản (setup/hold ở mức khái niệm) | RAM đơn giản, testbench đọc/ghi |

Tài liệu (theo thứ tự):
1. `Tai_Lieu/02_Dien_tu_so/Dien_tu_so_PTIT.pdf` — bám sát môn học trên trường, dùng làm "sách chính".
2. `Tai_Lieu/02_Dien_tu_so/Fundamentals_of_Logic_Design_Roth.pdf` — phần bài tập rất tốt, dùng làm "sách bài tập".
3. `Tai_Lieu/02_Dien_tu_so/Fundamentals_of_Digital_Logic_with_Verilog.pdf` — học Verilog song song với lý thuyết, đây là cuốn hiệu quả nhất cho người mới.
4. YouTube **Intermation** (kênh được tác giả repo giới thiệu) — xem khi bí một khái niệm.

> **Quy tắc vàng:** mỗi khái niệm lý thuyết phải được hiện thực bằng Verilog trong vòng 48 giờ. Học Karnaugh map mà không viết lại mạch bằng Verilog thì 2 tuần sau quên sạch.

**Mạch B — Điện cơ bản (20% thời gian)**

Không học để thi, học để hiểu. Mục tiêu 6 tuần:

| Tuần | Nội dung | Mức độ |
|---|---|---|
| 1 | Điện áp, dòng điện, điện trở, định luật Ohm, công suất | Hiểu + tính được |
| 2 | Định luật Kirchhoff, chia áp, chia dòng | Tính được mạch 3–4 điện trở |
| 3 | Tụ, cuộn cảm, hằng số thời gian RC | Hiểu trực giác "nạp/xả" |
| 4 | Diode, LED, transistor BJT như công tắc | Hiểu |
| 5 | **MOSFET như công tắc** — nền tảng của mọi chip số | Hiểu rất kỹ |
| 6 | CMOS inverter, vì sao CMOS ít tốn điện | Hiểu rất kỹ |

Tài liệu:
- `Tai_Lieu/01_Dien_tu_can_ban/Ly_thuyet_mach_PTIT.pdf` — phần 1–3 (mạch một chiều).
- `Tai_Lieu/01_Dien_tu_can_ban/Electrical_Engineering_101.pdf` — đọc như truyện, rất thân thiện.

Chỉ khi đã xong 6 tuần này, và **chỉ khi** bạn tò mò, hãy mở `Microelectronics_circuits.pdf` (Sedra–Smith) chương 1–5. Đừng đọc hết.

**Mạch C — Lập trình & công cụ (30% thời gian)**

| Nội dung | Tài liệu | Mức cần đạt |
|---|---|---|
| C cơ bản | `05_Cong_cu/C_Makefile_cheatsheet.pdf` + sách C trong repo gốc `Firmware_and_Scripting/C` | Viết được chương trình 200 dòng, hiểu con trỏ, bitwise |
| Bitwise operations | AND, OR, XOR, NOT, dịch bit | **Cực kỳ quan trọng** — bạn sẽ dùng hằng ngày |
| Linux command line | `05_Cong_cu/Linux_cheatsheet.pdf` | Tự tin dùng terminal, ssh |
| Git | `Supporting_Documents/_git.pdf` (repo gốc) | commit, branch, merge, PR |
| Python | Tự học cơ bản | Viết script xử lý file, parse log |

> Bitwise là cầu nối giữa C và phần cứng. Người không hiểu `x & (1 << n)` sẽ rất vất vả khi đọc RTL và register map.

### 3.2. Cửa ải giai đoạn 1

- [ ] Tự viết được **10 mạch tổ hợp + 5 mạch tuần tự** bằng Verilog, **mỗi mạch có testbench tự kiểm tra**.
- [ ] Giải thích được: setup time, hold time là gì, và tại sao chúng quan trọng.
- [ ] Vẽ được sơ đồ CMOS của cổng NAND và giải thích tại sao CMOS chỉ tốn công suất khi chuyển mạch.
- [ ] Viết được chương trình C dùng bitwise để bật/tắt/đảo bit và in ra dạng nhị phân.
- [ ] Dùng thành thạo `git add/commit/push`, và repo GitHub có ≥ 10 commit.

Chưa qua được 5 mục trên thì **đừng** học UVM. Nghiêm túc đấy — đó là nguyên nhân số 1 khiến sinh viên năm 3 học lại từ đầu.

---

## 4. Giai đoạn 2 — Tháng 5–9: Verilog thật sự

### 4.1. Tư duy cần chuyển

Ở giai đoạn 1 bạn viết Verilog để **mô tả mạch có sẵn trong đầu**.
Ở giai đoạn 2 bạn viết Verilog để **tổng hợp ra phần cứng** — mỗi dòng code là một miếng silicon, có diện tích, có độ trễ, có công suất.

Ba câu hỏi phải tự hỏi mỗi khi viết một dòng:

1. Dòng này **suy ra** cái gì? (flip-flop? cổng? hay không có gì?)
2. Nếu tổng hợp, nó tốn bao nhiêu cổng?
3. Nếu clock chạy 500 MHz, đường này có kịp không?

### 4.2. Tài liệu

| Tài liệu | Dùng để | Ghi chú |
|---|---|---|
| `03_Verilog_RTL/Verilog_Digital_System_Design.pdf` | Sách chính về Verilog | Đọc phần 1–2 trước |
| `03_Verilog_RTL/Verilog_coding_for_logic_synthesis.pdf` | **Style guide** — đọc kỹ | Quy tắc viết code tổng hợp được |
| `03_Verilog_RTL/Principles_of_Verifiable_RTL_Design.pdf` | Viết RTL "dễ verify" | Đọc sau khi đã viết được 5–6 module |
| `02_Dien_tu_so/Fundamentals_of_Digital_Logic_with_Verilog.pdf` | Ôn lại nếu quên | Tham khảo |

Ngoài ra, **HDLbits** (https://hdlbits.01xz.net) là bài tập bắt buộc. Làm hết mục *Verilog Language* và *Circuits* (khoảng 150 bài). Đây là cách rẻ nhất để có phản hồi tức thì mà không cần cài gì.

### 4.3. Bài tập thiết kế (làm theo thứ tự)

| # | Module | Khái niệm | Độ khó |
|---|---|---|---|
| 1 | 7-segment decoder | Combinational, case | ★ |
| 2 | Binary → BCD | Chia, so sánh | ★★ |
| 3 | ALU 8 bit | Parameter, opcode | ★★ |
| 4 | Barrel shifter | Dịch biến đổi | ★★ |
| 5 | PWM generator | Counter + compare | ★★ |
| 6 | Button debounce | Metastability, counter | ★★★ |
| 7 | UART TX | FSM + baud rate | ★★★ |
| 8 | UART RX | FSM + mid-bit sampling | ★★★ |
| 9 | SPI master | Clock polarity/phase | ★★★ |
| 10 | I2C master | Open-drain, ACK | ★★★★ |
| 11 | Sync FIFO | Pointer, full/empty | ★★★★ |
| 12 | CRC-8 | XOR chain, LFSR | ★★★ |
| 13 | Priority arbiter | Combinational priority | ★★ |
| 14 | Round-robin arbiter | FSM + fairness | ★★★★ |
| 15 | AXI-Stream FIFO | Handshake protocol | ★★★★ |

**Yêu cầu bắt buộc cho mỗi bài:** testbench tự kiểm tra + in `PASS`/`FAIL` + có ít nhất 1 test random (dùng `$random`), không chỉ test tay vài vector.

### 4.4. Cửa ải giai đoạn 2

- [ ] Hoàn thành 15 bài trên, mỗi bài có testbench self-checking.
- [ ] Viết được UART loopback (TX nối RX) tự chạy và tự kiểm tra.
- [ ] Giải thích được sự khác nhau giữa `reg` và `wire`, giữa blocking và non-blocking, và **tại sao** dùng sai sẽ sinh ra mạch sai.
- [ ] Đọc hiểu một file Verilog 500 dòng do người khác viết.
- [ ] Đã dùng Yosys để tổng hợp thử ít nhất 1 module và xem số cổng.

---

## 5. Giai đoạn 3 — Tháng 10–14: Ra khỏi "mạch nhỏ"

Đây là lúc bạn bắt đầu giống một kỹ sư thật: thiết kế **subsystem**, không phải module lẻ.

### 5.1. Nội dung

| Chủ đề | Tài liệu | Mức cần đạt |
|---|---|---|
| **CDC** (Clock Domain Crossing) | `RTL_for_synthesis/_Clock_Domain_Crossing_Techniques.pdf` | 2-flop synchronizer, async FIFO, gray code |
| **Synthesis** | `04_STA_Synthesis/_ASIC_chip_synthesis.pdf` | Đọc được synthesis report, hiểu area/timing |
| **STA** | `04_STA_Synthesis/STA.pdf` | Đọc timing report, hiểu slack, đường tới hạn |
| **AMBA APB** | `AMBA_protocols/_apb_architecture_spec.pdf` | Viết được APB slave |
| **AMBA AHB / AXI** | spec tương ứng | Hiểu handshake `VALID/READY` |
| **DFT (nhập môn)** | `DFT/_DFT.pdf` | Hiểu scan chain để không "mù" khi đi làm |

### 5.2. Project của giai đoạn này

**"Mini SoC" — mục tiêu: một hệ thống nhỏ nhưng đầy đủ**

```
        ┌─────────────┐    APB     ┌──────────────┐
        │  RISC-V core│───────────▶│ APB slave:   │
        │  (hoặc FSM  │            │ GPIO + Timer │
        │   controller)│           └──────────────┘
        └──────┬──────┘
               │
        ┌──────▼──────┐
        │  SRAM 1 KB  │
        └─────────────┘
```

Không cần tự viết CPU — dùng một core RISC-V nhỏ có sẵn (ví dụ `picorv32` hoặc core trong khóa *nand2tetris*), viết peripheral và **tự viết testbench cho toàn hệ**.

### 5.3. Cửa ải giai đoạn 3

- [ ] Có 1 APB slave hoạt động đúng, được verify bằng testbench.
- [ ] Chạy được **Yosys → OpenSTA** (hoặc OpenLane) trên thiết kế của mình và đọc được timing report: slack dương hay âm, đường nào tới hạn.
- [ ] Giải thích được tại sao cần synchronizer khi tín hiệu đi qua 2 miền clock.
- [ ] Đọc hiểu 1 chương bất kỳ trong spec AXI.

---

## 6. Giai đoạn 4 — Tháng 15–24: Chuyên sâu & đi làm

### 6.1. Chọn nhánh

**Nhánh DV (khuyên chọn nếu muốn nhanh có việc):**

| Thứ tự | Nội dung | Tài liệu |
|---|---|---|
| 1 | SystemVerilog cho verification | `DV/Starter/_SystemVerilog for Verification.pdf` (Spear) |
| 2 | Lớp, object, random, coverage | cùng sách, phần 2–3 |
| 3 | SVA (assertion) | `DV/SVA_FV/_A-Practical-Guide-for-SystemVerilog-Assertions.pdf` |
| 4 | UVM | `DV/UVM/_The_UVM_Primer_An_Introduction_to_th.pdf` |
| 5 | Formal (nếu có hứng) | `DV/SVA_FV/_Formal+Verification.pdf` |

**Nhánh DE (nếu muốn đi sâu thiết kế):**

| Thứ tự | Nội dung | Tài liệu |
|---|---|---|
| 1 | Kiến trúc máy tính | `Arch_and_uArch/_Computer-Organization-Architecture-11th.pdf` |
| 2 | Vi kiến trúc | `Arch_and_uArch/_processor_microarchitecture.pdf` |
| 3 | DSP cho phần cứng | `DSP/_VLSI_DSP.pdf` |
| 4 | Low power | `Power_analysis/_Low.Power.Design.Essentials.pdf` |

### 6.2. Trước khi apply intern — checklist

- [ ] **1 project "kể được"**: có README, sơ đồ khối, testbench, kết quả mô phỏng, và một đoạn nói về **khó khăn gặp phải + cách giải quyết**.
- [ ] Trả lời trôi chảy 30 câu hỏi phỏng vấn digital cơ bản (setup/hold, CDC, FIFO depth, arbitration, FSM coding).
- [ ] Đọc được tiếng Anh kỹ thuật (spec, datasheet) mà không cần dịch từng câu.
- [ ] Có 1 tài khoản GitHub "sạch" — người tuyển dụng sẽ xem.

### 6.3. Tiếng Anh — kỹ năng "lãi" nhất trong cả lộ trình

Phỏng vấn ở Marvell, Synopsys, Renesas, Qorvo, Dolphin… đều bằng tiếng Anh. Spec, datasheet, comment trong code, email — tất cả bằng tiếng Anh. Đây là chỗ nhiều sinh viên giỏi kỹ thuật vẫn trượt.

Cách làm (30 phút/ngày, không cần trung tâm):

- Đọc **spec/datasheet thật** thay vì sách luyện thi. Bắt đầu từ APB spec (~40 trang, dễ nhất trong họ AMBA).
- Ghi từ vựng kỹ thuật vào một file: *handshake, arbitration, hazard, skew, slack, toggle, pipeline, latch, assertion*…
- Viết README project bằng tiếng Anh, rồi tự sửa lại.
- Nghe lecture trên YouTube ở tốc độ 1.25× khi đi đường.

Mục tiêu 12 tháng: đọc xong một spec 50 trang trong 2 giờ, và viết được một email kỹ thuật 5 câu không cần tra từ điển.

---

## 7. Lịch tuần mẫu (10–12 giờ)

| Buổi | Thời lượng | Nội dung |
|---|---|---|
| Thứ 2 | 1.5 h | Lý thuyết (sách/khóa học) + ghi chú 1 trang |
| Thứ 4 | 2 h | Code: làm bài tập Verilog |
| Thứ 5 | 1.5 h | Code: viết testbench cho bài hôm thứ 4 |
| Thứ 7 | 3 h | Project lớn / HDLbits / đọc spec |
| CN | 2 h | Ôn tập + viết note tuần + push GitHub |

**Quy tắc:** mỗi tuần phải có ít nhất **1 commit** và **1 đoạn văn** giải thích mình vừa học được gì. Không có ngoại lệ.

---

## 8. Cách đọc những cuốn sách trong repo (đừng đọc hết)

Repo có **236 PDF**. Đó là thư viện tra cứu, không phải danh sách phải đọc. Người ta không đọc hết thư viện để trở thành kỹ sư.

**Kỹ thuật đọc 3 lượt cho mỗi chương:**

| Lượt | Thời gian | Làm gì |
|---|---|---|
| 1. Quét | 10 min | Đọc tiêu đề mục, hình, caption, phần tóm tắt cuối chương. Không đọc chữ. |
| 2. Đọc | 45 min | Đọc kỹ, đánh dấu, ghi 5–7 ý chính ra giấy. |
| 3. Làm | 45 min | Làm 5 bài tập cuối chương. Không xem lời giải trước 10 phút. |
| 4. Nói | 10 min | Giảng lại cho chính mình (hoặc cho bạn cùng lớp) trong 3 phút, không nhìn sách. |

**Ngân sách thời gian cho 6 tháng đầu:**

| Sách | Đọc gì | Bỏ gì | Giờ |
|---|---|---|---|
| Điện tử số PTIT | Toàn bộ | — | 40 h |
| Roth – Fundamentals of Logic Design | Chương bài tập | Phần thiết kế máy tính nâng cao | 25 h |
| Fundamentals of Digital Logic with Verilog | Chương 1–6 | Phần FPGA nâng cao | 30 h |
| Lý thuyết mạch PTIT | Chương 1–3 | Phần xoay chiều, ba pha | 20 h |
| Electrical Engineering 101 | Toàn bộ (đọc như truyện) | — | 8 h |
| Verilog Digital System Design | Phần 1–2 | Phần testbench nâng cao | 30 h |
| Verilog coding for logic synthesis | Toàn bộ (mỏng) | — | 8 h |
| Principles of Verifiable RTL Design | Toàn bộ (mỏng) | — | 10 h |

Tổng ≈ 170 giờ cho 6 tháng ≈ **7 h/tuần chỉ cho đọc**. Cộng với code là vừa 10–12 h/tuần.

---

## 9. Công cụ — cài gì, khi nào

| Công cụ | Khi nào | Vì sao | Ghi chú |
|---|---|---|---|
| **EDA Playground** | Ngay hôm nay | Chạy Verilog online, không cài gì | edaplayground.com, chọn Icarus Verilog |
| **VS Code + extension Verilog** | Ngay hôm nay | Editor, syntax highlight | Cài thêm `Verilog-HDL/SystemVerilog` |
| **Icarus Verilog** | Tuần 1–2 | Mô phỏng offline | bleyer.org/icarus (Windows) |
| **GTKWave** | Tuần 1–2 | Xem waveform | Cài kèm Icarus |
| **Git + GitHub** | Tuần 1 | Lưu trữ, portfolio | Bắt buộc |
| **WSL2 + Ubuntu** | Tuần 3–4 | Tập môi trường Linux | Rất nên làm sớm |
| **Yosys** | Tháng 5 | Tổng hợp Verilog → netlist | Mã nguồn mở |
| **Verilator** | Tháng 6 | Mô phỏng nhanh, lint | Mã nguồn mở |
| **OpenSTA** | Tháng 10 | Phân tích timing | Mã nguồn mở |
| **OpenLane / OpenROAD + sky130** | Tháng 12+ | Chạy full flow RTL → GDS | Mã nguồn mở, miễn phí |
| **Synopsys / Cadence** | Năm 3–4 | Công cụ công nghiệp | Dùng lab EDA của PTIT |

**Về lab của trường:** PTIT đã đầu tư Lab Thiết kế Điện tử Tự động (EDA) với Cadence, Synopsys, Siemens, Xilinx (theo công bố của Khoa). Đây là tài nguyên rất đắt — nhiều trường không có. Hãy tận dụng từ năm 3, và **đừng** đợi đến lúc đó mới học Linux.

**Về "tapeout" (làm chip thật):** chương trình **Tiny Tapeout** cho phép sinh viên đưa một thiết kế nhỏ lên silicon thật với chi phí vài trăm USD mỗi tile (thay đổi theo từng đợt). Đây là mục tiêu rất tốt cho năm 3–4: nó biến "em có code Verilog" thành "em có một chip thật".

---

## 10. Nguồn học ngoài repo (đã chọn lọc, đừng tham)

| Nguồn | Dùng cho | Ghi chú |
|---|---|---|
| **HDLBits** — hdlbits.01xz.net | Bài tập Verilog, ~150 bài đầu | Bắt buộc, làm song song giai đoạn 1–2 |
| **EDA Playground** | Chạy thử nhanh | Miễn phí |
| **nand2tetris** — nand2tetris.org | Hiểu máy tính từ cổng logic | Tuyệt vời cho người mới, làm phần 1 |
| **Intermation** (YouTube) | Điện tử số trực quan | Tác giả repo giới thiệu |
| **ChipVerify / ASIC-World** | Tra cú pháp, ví dụ | Tra cứu, không đọc tuần tự |
| **Sunburst Design (Cliff Cummings)** | Papers về coding style, FSM | Đọc sau khi đã viết được FSM |
| **NPTEL / MIT OCW** | Bài giảng đại học | Khi cần nghe giảng |
| **Spec AMBA (ARM)** | APB/AHB/AXI | Đọc bản gốc, đừng đọc blog tóm tắt |

---

## 11. Mười sai lầm sẽ khiến bạn mất 2 năm

1. **Đọc hết sách trước khi code.** Sách điện tử số 700 trang không thể đọc xong rồi mới viết Verilog.
2. **Học UVM khi chưa viết nổi một FSM.** UVM là framework, không phải kiến thức nền.
3. **Cài Synopsys/Cadence từ năm 1.** Không chạy trên Windows, không cần thiết, và làm bạn tưởng mình đang học.
4. **Chỉ xem video, không gõ code.** Video tạo cảm giác hiểu — cảm giác đó là giả.
5. **Bỏ qua Linux.** 100% công cụ IC thật chạy trên Linux.
6. **Bỏ qua testbench.** Người viết RTL không biết verify sẽ bị loại ở vòng phỏng vấn kỹ thuật.
7. **Đi quá sâu vào analog.** Bạn chọn digital; biết đủ để hiểu là được.
8. **Không dùng Git.** Mất code, không có portfolio, không ai tin bạn.
9. **Học một mình.** Tìm nhóm, clb, hoặc ít nhất một người cùng học để giải thích cho nhau.
10. **So sánh tốc độ với người khác.** Người "giỏi sẵn" thường đã có nền từ trước; bạn đang đi từ 0, và điều đó bình thường.

---

## 12. Đo tiến bộ — portfolio GitHub

Cấu trúc repo nên có:

```
ic-design-journey/
├── README.md              ← bảng tổng hợp các project đã làm
├── 01_basics/             ← mux, decoder, adder, ALU
├── 02_sequential/         ← counter, shift register, FSM
├── 03_protocols/          ← UART, SPI, I2C
├── 04_subsystem/          ← FIFO, APB slave, mini SoC
└── notes/                 ← ghi chú học tập (đừng xoá, nó thể hiện quá trình)
```

`README.md` mỗi project cần 4 dòng: **làm gì — input/output — verify thế nào — kết quả**.

Người phỏng vấn không quan tâm bạn làm 50 project nhỏ. Họ quan tâm bạn có **1 project bạn hiểu đến từng dòng**.

---

## 13. Bản đồ 4 năm (gắn với lịch học ở trường)

| Năm | Trên trường | Tự học (lộ trình này) | Mốc |
|---|---|---|---|
| **1** | Toán, vật lý, tin học, nhập môn ngành | Giai đoạn 0 + 1 | Có repo GitHub, viết được 15 mạch |
| **2** | Điện tử số, lý thuyết mạch, điện tử tương tự, vi xử lý | Giai đoạn 2 | 15 module + UART/SPI hoạt động |
| **3** | Vi mạch số, thiết kế vi mạch, lab EDA | Giai đoạn 3 | Mini SoC + biết Yosys/OpenLane |
| **4** | Đồ án, thực tập | Giai đoạn 4 | Intern + 1 project "kể được" |

**Điểm quan trọng:** môn học trên trường và lộ trình tự học **không thay thế nhau**. Trường cho bạn lý thuyết có hệ thống và lab có công cụ; tự học cho bạn kỹ năng thực chiến và portfolio. Người chỉ học trên trường sẽ ra trường mà chưa từng tự viết một testbench.

---

## 14. Phiên bản 5 giờ/tuần

Nếu bạn chỉ có 5 h/tuần, **đừng bám lịch trong file này** — nó được thiết kế cho 10–12 h/tuần và sẽ khiến bạn thấy mình thất bại sau 3 tuần.

Xem file riêng: **[KE_HOACH_5H_TUAN.md](KE_HOACH_5H_TUAN.md)**

Khác biệt cốt lõi của bản 5 h/tuần:

- **Bỏ tự học lý thuyết mạch/điện cơ bản** — để môn Vật lý và Lý thuyết mạch trên trường lo. Bạn sẽ học chính thức, có điểm, có thầy; tự học trước là làm hai lần một việc.
- **Dồn toàn bộ 5 giờ** vào digital logic + Verilog + git/linux, tức là những thứ trường chưa dạy sớm.
- **HDLBits là xương sống**, không phải sách. Ở 240 h/năm mà đọc nửa thì sẽ đọc xong 3 cuốn và không viết nổi cái mux.
- **Có "MVP 30 phút"** cho tuần thi cử, và quy tắc không học bù.

---

## 15. Việc cần làm ngay hôm nay (7 ngày đầu)

- [ ] **Hôm nay:** đọc xong `_Nhap_Mon_TKVM__He_Sinh_Thai_Nganh_Vi_Mach_Ban_Dan` (25 trang, 1 giờ).
- [ ] **Hôm nay:** tạo repo GitHub `ic-design-journey`, commit 1 file README.
- [ ] **Ngày 2:** tạo tài khoản HDLBits, làm 5 bài đầu (Getting Started).
- [ ] **Ngày 3:** chạy `Lab/lab01_mux2` trên EDA Playground, đọc từng dòng testbench.
- [ ] **Ngày 4:** chạy `lab02_counter`, thử sửa `WIDTH` thành 8 và chạy lại.
- [ ] **Ngày 5:** đọc chương 1 sách Điện tử số PTIT (hệ số đếm), làm 10 bài đổi cơ số.
- [ ] **Ngày 6:** chạy `lab03_fsm`, thử phá code (sửa transition) và xem testbench bắt lỗi thế nào.
- [ ] **Ngày 7:** viết `notes/week01.md` — 1 trang: tuần này học được gì, chỗ nào chưa hiểu. Push lên GitHub.

---

## 16. Về repo tài liệu này

Repo gốc: https://github.com/Quang-Minh-Phung/DienTu_TKVM_Documents

Đây là kho tài liệu do một kỹ sư DV (Marvell Việt Nam) biên soạn và tổng hợp. Điểm mạnh: có lộ trình rõ, có tài liệu tiếng Việt bám sát chương trình đại học, và có cả phần DV/UVM mà hầu hết sinh viên không biết bắt đầu từ đâu.

Điểm cần lưu ý khi dùng:

- Repo **thiên về DV và storage/data-path** (đúng chuyên môn của tác giả). Nếu bạn theo DE thuần, phần RTL có nhưng mỏng hơn.
- Nhiều tài liệu là sách bản quyền được chia sẻ lại. Hãy dùng cho mục đích học tập, và **mua sách nếu có điều kiện** — đây là cách duy nhất để ngành này tiếp tục có người viết sách tốt.
- Tài liệu **không thay thế được việc gõ code**. Đọc 10 cuốn mà không viết testbench nào thì vẫn là 0.

Cách dùng repo hiệu quả nhất: **coi `README.md` của từng thư mục là "giáo trình", còn file PDF là "giáo trình tham khảo"**. Tác giả đã viết hướng dẫn học trong mỗi README — đọc nó trước khi mở sách.

---

*Tài liệu này được tạo cho mục đích học tập cá nhân. Cập nhật lại mỗi 3 tháng, vì lộ trình của một sinh viên là thứ sống.*
