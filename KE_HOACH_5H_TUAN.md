# Kế hoạch 5 giờ/tuần — bản dành riêng cho bạn

> **Điều kiện thực tế:** 5 h/tuần · đang ở giữa học kỳ 1 năm nhất · Giải tích 1 mới tới giới hạn + ma trận/định thức · Vật lý 1 chưa tới chương điện.
>
> Đây là bản **chi tiết hoá** của mục 14 trong [lộ trình chính](LO_TRINH_DIGITAL_IC_DESIGN.md). Đọc file này thay vì cố bám lịch 10–12 h/tuần ở đó.

---

## 0. Trước hết: 5 h/tuần **không** phải tin xấu

Con số thật:

```
5 h/tuần × 48 tuần = 240 h/năm
```

240 giờ là đủ để đi hết **một giai đoạn rưỡi** của lộ trình. Nghĩa là:

| Năm | Với 5 h/tuần bạn sẽ đạt |
|---|---|
| Năm 1 | Xong nền digital logic + Verilog cơ bản (GĐ 1) |
| Năm 2 | Xong GĐ 2 — có UART/SPI/FIFO, viết testbench thành thạo |
| Năm 3 | Xong GĐ 3 — APB/AXI, synthesis, STA, mini SoC |
| Năm 4 | GĐ 4 — DV hoặc DE sâu + intern |

**Vừa khớp với 4 năm học.** Bạn không chậm. Người ta chỉ chậm khi so với người có 20 h/tuần — mà người đó không phải bạn.

> Cái giết chết lộ trình **không phải** 5 h/tuần. Là **0 h trong 3 tuần liền**. Xem mục 7.

---

## 1. Điều chỉnh chiến lược quan trọng nhất

Ở 10–12 h/tuần, bạn có thể tự học song song cả điện cơ bản **và** digital. Ở 5 h/tuần thì không. Phải cắt.

### Nguyên tắc: **đừng tự học thứ mà trường sắp dạy bạn**

| Chủ đề | Quyết định | Lý do |
|---|---|---|
| **Digital logic + Verilog** | 🔴 **Tự học ngay, ưu tiên tuyệt đối** | Trường chưa dạy (thường năm 2), và đây là kỹ năng cốt lõi nhất |
| **Git / Linux / bitwise trong C** | 🔴 **Tự học ngay** | Trường dạy rất muộn hoặc không dạy |
| **Điện cơ bản / lý thuyết mạch** | 🟡 **Để môn Vật lý + Lý thuyết mạch trên trường lo** | Bạn sẽ học chính thức, có điểm, có thầy. Tự học trước là làm 2 lần một việc |
| **Giải tích, đại số** | ⚪ **Học để qua môn, không học vì IC design** | Xem mục 6 — đừng lo mình "thiếu toán" |
| **Analog, PLL, layout** | ⚫ **Bỏ hẳn** | Không phải hướng của bạn |
| **SystemVerilog/UVM** | ⚫ **Bỏ hẳn đến năm 3** | Học bây giờ là lãng phí 100% |
| **Mua FPGA board, cài tool nặng** | ⚫ **Bỏ hẳn năm 1** | Không cần, và làm bạn tưởng mình đang học |

**Hệ quả:** 5 giờ/tuần của bạn dồn hết vào **đúng 3 thứ**: *digital logic*, *Verilog*, *công cụ (git/linux)*. Không dàn trải.

---

## 2. Chia 5 giờ như thế nào

Ở tuần chỉ có 5 giờ, **2 buổi dài tốt hơn 5 buổi ngắn**. Đừng chia mỗi ngày 45 phút — bạn sẽ mất 15 phút mỗi lần để "vào guồng".

| Buổi | Thời lượng | Nội dung |
|---|---|---|
| **Thứ 4 tối** | 2.5 h | Thực hành: HDLBits + lab |
| **Chủ nhật sáng** | 2.5 h | 1 h lý thuyết (video/PDF) → 1 h thực hành tiếp → 0.5 h ghi chú + commit |

Trong 5 giờ đó, tỉ lệ **70% gõ code / 30% đọc**. Không phải 50/50. Ở 240 h/năm mà đọc nửa thì bạn sẽ đọc xong 3 cuốn và không viết nổi cái mux.

### Bộ tài liệu — chỉ 4 thứ, đừng thêm

| # | Tài liệu | Vai trò | Thời lượng/tuần |
|---|---|---|---|
| 1 | **[HDLBits](https://hdlbits.01xz.net)** | **Xương sống.** Bài tập có chấm điểm ngay | 2.5 h |
| 2 | **Intermation** (YouTube) | Xem khi một khái niệm không vào đầu | 1 h |
| 3 | `Tai_Lieu/02_Dien_tu_so/Dien_tu_so_PTIT.pdf` | Tra cứu + làm bài tập giấy | 0.5 h |
| 4 | `Tai_Lieu/05_Cong_cu/Linux_cheatsheet.pdf` + `C_Makefile_cheatsheet.pdf` | Git/Linux/C | 1 h |

> **Ẩn hết 230 PDF còn lại.** Không phải chúng vô dụng — mà ở 5 h/tuần, mỗi lần mở một file mới là một lần mất tập trung.

---

## 3. Lịch 12 tuần đầu (60 giờ)

Đây là phần quan trọng nhất của file này. Làm đúng thứ tự, đừng nhảy.

| Tuần | HDLBits (2.5 h) | Lý thuyết (1.5 h) | Công cụ (1 h) |
|---|---|---|---|
| **1** | *Getting Started* — làm hết (4–5 bài) | Video: hệ nhị phân, bit, byte | Tạo GitHub, `git init/add/commit/push` |
| **2** | *Verilog Language → Basics* | Nhị phân ↔ thập phân ↔ hex (làm 20 bài đổi tay) | `git status/log`, tạo `.gitignore` |
| **3** | *Vectors* | Số có dấu, bù 2, tràn số | Chạy `Lab/lab01_mux2` trên [EDA Playground](https://edaplayground.com) |
| **4** | *Modules: Hierarchy* | Cổng logic, bảng chân trị, De Morgan | Viết README tiếng Anh cho repo |
| **5** | *Procedures* (`always`, `if`, `case`) | Đại số Boolean, rút gọn bằng đại số | Linux: `ls, cd, mkdir, cp, mv, grep` |
| **6** | *More Verilog Features* (ternary, `for`, `casez`) | Karnaugh map (2–4 biến) | Linux: pipe, redirect, `&&` |
| **7** | *Circuits → Combinational: Basic Gates* | Mạch tổ hợp là gì, delay lan truyền | C: toán tử bitwise (AND/OR/XOR/NOT, dịch bit) |
| **8** | *Multiplexers* | MUX, decoder, encoder | C: in số ra dạng nhị phân |
| **9** | *Arithmetic Circuits* | Bộ cộng, bù 2 trong phần cứng, ALU | Makefile: 1 rule đầu tiên |
| **10** | *Karnaugh Map to Circuit* | K-map nâng cao, don't-care | Cài Icarus Verilog **hoặc** WSL (chọn 1) |
| **11** | *Sequential: Latches and Flip-Flops* | FF, clock, setup/hold (trực giác) | Mở waveform bằng GTKWave, tập đọc |
| **12** | *Counters* | Bộ đếm, chia tần số | **Tự viết lại** `counter` 8-bit + testbench từ đầu |

**Kết quả sau 12 tuần:** ~60–70 bài HDLBits, hiểu combinational + sequential, tự viết được counter có testbench, dùng được git cơ bản. Đây là nền đủ chắc để đi tiếp.

### Cách học mỗi tuần (rất cụ thể)

1. **Thứ 4:** mở HDLBits, làm bài **đến khi sai**. Bài sai là bài đáng giá nhất — đọc kỹ thông báo lỗi, sửa, làm lại. Đừng xem solution trong 10 phút đầu.
2. **Chủ nhật:** xem 1 video Intermation về chủ đề tuần đó (10–15 phút) → mở PDF tra đúng phần đó (20 phút) → làm tiếp HDLBits (1 h) → viết `notes/weekXX.md` + commit (30 phút).
3. **Không bao giờ** đọc PDF trước rồi mới làm bài. Làm trước, đọc sau — vì lúc đó bạn đọc để trả lời câu hỏi cụ thể, hiệu quả gấp 3.

---

## 4. Sau 12 tuần (tháng 4 → 12)

Không cần lịch chi tiết từng tuần nữa — theo tháng:

| Tháng | Nội dung | Sản phẩm kiểm chứng |
|---|---|---|
| **4** | *Shift Registers*, *More Circuits* | Thanh ghi dịch, LFSR |
| **5** | *Finite State Machines* (phần 1) | FSM 3 khối thành thạo |
| **6** | *Finite State Machines* (phần 2) + *Building Larger Circuits* | FSM bán vé / thang máy |
| **7** | Tự viết testbench (không dùng testbench có sẵn) | TB cho 3 module cũ |
| **8** | `Lab/lab03_fsm` → tự viết lại từ spec | Sequence detector khác (ví dụ `1101`) |
| **9** | UART TX | Truyền được 1 byte, xem waveform |
| **10** | UART RX | Loopback TX→RX chạy đúng |
| **11** | Ôn + làm lại 5 bài từng sai | Ghi chú "5 lỗi hay gặp của tôi" |
| **12** | Viết README tổng cho repo + bảng tiến độ | Portfolio bước đầu |

---

## 5. Mốc kiểm tra (đừng tự đánh lừa mình)

| Mốc | Phải làm được | Nếu chưa |
|---|---|---|
| **3 tháng** | Viết mux 4:1, decoder 3:8, bộ cộng 4-bit **không nhìn mẫu**; giải thích được `wire` vs `reg` | Ở lại thêm 4 tuần, đừng đi tiếp |
| **6 tháng** | Tự viết counter + FSM + testbench từ giấy trắng | Ở lại, làm lại lab 2–3 |
| **12 tháng** | UART TX+RX loopback chạy, testbench tự kiểm tra; git/linux dùng hàng ngày | Vẫn ổn nếu chậm 3 tháng — miễn là không dừng |

Cách kiểm tra khách quan nhất: **xoá file, viết lại từ đầu trong 45 phút, không mở sách.** Không làm được = chưa biết.

---

## 6. Về chuyện "mình còn chưa học tới điện" — đừng lo

Bạn đang học Giải tích 1 (giới hạn, ma trận, định thức) và Vật lý 1 chưa tới chương điện. Cụ thể:

**Giải tích (giới hạn, đạo hàm, tích phân):** gần như **không dùng** trong digital IC design. Đừng để ai làm bạn nghĩ mình tụt lại. Nó cần cho analog, DSP nâng cao, và để qua môn. Học cho tốt, nhưng đừng học thêm.

**Ma trận / định thức:** cũng chưa dùng ngay. Về sau nó xuất hiện ở DSP, xử lý ảnh, và đặc biệt là **AI accelerator** — một mảng đang rất nóng trong thiết kế chip. Nên đây là môn đáng học tử tế, chỉ là chưa cần cho 12 tháng tới. *(Và nếu bạn thích ma trận, đó là một tín hiệu tốt cho hướng accelerator sau này.)*

**Vật lý 1 chương điện:** khi nào học tới, hãy **dùng luôn** — đó chính là "giai đoạn điện cơ bản" trong lộ trình, do trường dạy, có điểm, có thầy. Lúc đó bạn chỉ cần đọc thêm `Electrical_Engineering_101.pdf` (8 giờ, đọc như truyện) để nối kiến thức với thực tế chip.

**Điện tử số (thường năm 2):** khi trường dạy, bạn sẽ thấy mình đã biết trước — hãy biến giờ đó thành giờ **làm bài tập khó + hỏi thầy những chỗ mình mắc**, thay vì học lại từ đầu. Đó là lợi thế lớn nhất của việc tự học sớm.

> Tóm lại: **thứ tự đúng là digital logic trước, điện sau.** Không phải vì điện không quan trọng, mà vì trường đã có lịch dạy điện cho bạn rồi.

---

## 7. Chống gãy — phần quan trọng nhất

5 h/tuần trong 4 năm là **192 tuần**. Chắc chắn sẽ có tuần thi, tuần ốm, tuần mất động lực. Kế hoạch tốt là kế hoạch **sống sót qua tuần xấu**, không phải kế hoạch đẹp trên giấy.

### Tuần bận (thi, deadline trường)

> **MVP = 30 phút:** 1 bài HDLBits + 1 commit.

Không cần 5 giờ. 30 phút vẫn giữ được mạch. Làm được 4 tuần MVP liên tiếp tốt hơn 1 tuần 10 giờ rồi nghỉ 1 tháng.

**Riêng giai đoạn thi cuối kỳ (khoảng tháng 12–1):** đặt mục tiêu MVP 30 phút/tuần và **giữ nguyên thứ tự bài**, đừng nhảy cóc. Khi thi xong, quay lại đúng chỗ đang dở — đừng "học bù" cả tháng bằng một tuần 20 giờ.

### Quy tắc 2 tuần

Nghỉ 2 tuần thì **không học bù**. Tuần thứ 3 chỉ cần ngồi xuống 15 phút, làm 1 bài dễ nhất. Học bù là cái bẫy: nó biến việc quay lại thành một núi nợ, và bạn sẽ không quay lại.

### Quy tắc "không có tuần 0 giờ"

Nếu tuần này bạn chỉ làm được **1 việc**, hãy làm việc này: **mở HDLBits, làm 1 bài.** Chuỗi không được đứt.

### Ghi lại lý do mình bắt đầu

Viết vào `notes/week01.md` một câu: *"Mình học cái này vì ___"*. Đến tháng thứ 8, câu đó sẽ cứu bạn.

---

## 8. Nếu có tuần rảnh hơn (nghỉ hè, nghỉ Tết)

Đừng tăng gấp 4. Tăng lên **8–10 h/tuần trong 2–3 tuần**, dùng để:

- Làm nốt một mảng HDLBits còn dở (rất hiệu quả — kiến thức liền mạch).
- Hoặc làm 1 module lớn hơn bình thường (UART) từ đầu đến cuối.

Rồi quay lại 5 h. Đừng đổi mức nền — mức nền là thứ bạn duy trì được trong 4 năm.

---

## 9. Nếu chỉ còn 2 h/tuần

Vẫn đi được, chậm hơn ~2.5 lần:

| Việc | Thời gian |
|---|---|
| HDLBits, 4 bài/tuần | 1 h |
| 1 video Intermation + tra PDF đúng phần đó | 0.5 h |
| Ghi chú + commit | 0.5 h |

Bỏ hẳn phần git/linux (học sau, khi đã có code để lưu). **Nhưng tuyệt đối không bỏ HDLBits** — đó là thứ duy nhất tạo ra tiến bộ thật.

---

## 10. Việc cần làm ngay tuần này

- [ ] Tạo tài khoản [HDLBits](https://hdlbits.01xz.net), làm hết mục *Getting Started* (khoảng 45 phút).
- [ ] Tạo repo GitHub `ic-design-journey`, push 1 file README 3 dòng.
- [ ] Đặt lịch: **thứ 4 21:00–23:30** và **chủ nhật 8:00–10:30**. Đưa vào điện thoại, có nhắc nhở.
- [ ] Viết `notes/week01.md` — 3 dòng cũng được.
- [ ] Xoá bookmark mọi tài liệu khác. Chỉ giữ 4 thứ ở mục 2.

---

*Cập nhật: 26/10/2026. Xem lại file này mỗi 12 tuần — nếu thấy mình đang tụt, cắt bớt nội dung, đừng cắt thời gian.*
