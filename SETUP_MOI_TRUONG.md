# Setup môi trường học — từ con số 0

> Kiểm tra ngày 26/10/2026 trên chính máy bạn. Không đoán, không copy-paste từ blog.

---

## 0. Tin tốt: máy bạn đã có nhiều hơn bạn tưởng

| Thứ | Trạng thái | Dùng để |
|---|---|---|
| **VS Code 1.142** | ✅ đã cài | Viết code, ghi chú |
| **Git 2.55** | ✅ đã cài | Lưu phiên bản, đưa lên GitHub |
| **Node.js + npm** | ✅ đã cài | (chưa cần) |
| **winget** | ✅ có | Cài phần mềm bằng 1 dòng lệnh |
| **Ổ C: trống 206 GB** | ✅ | Thoải mái |
| **Icarus Verilog** | ❌ chưa có | *Chưa cần* — xem mục 1 |
| **Verilator / Yosys** | ❌ chưa có | *Chưa cần* |
| **WSL (Linux)** | ❌ chưa có | *Chưa cần* |
| **Python** | ⚠️ có "shim" hỏng của Microsoft Store | *Chưa cần* |

Và điều quan trọng nhất, cái làm mọi thứ khác thành không quan trọng:

> **Bài tập HDLBits chạy trên server của họ**, không chạy trên máy bạn.
> Bạn gõ code vào ô trên trang web → bấm **Simulate** → Quartus + ModelSim **của họ** biên dịch và mô phỏng → trả kết quả về trình duyệt.

Nghĩa là: **tuần 1 đến tuần 9, bạn không cần cài một thứ gì.** Trình duyệt là môi trường học.

---

## 1. Nguyên tắc: môi trường học có 3 tầng, đừng nhảy tầng

| Tầng | Khi nào | Cần gì | Vì sao |
|---|---|---|---|
| **0. Trên mạng** | Tuần 1–9 | Chỉ trình duyệt | HDLBits + EDA Playground đã có sẵn editor, compiler, simulator, waveform viewer |
| **1. Trên máy** | Tuần 10 | Icarus Verilog + GTKWave | Tự chạy được testbench của mình, không phụ thuộc mạng |
| **2. Linux** | Tuần 10–12 | WSL2 Ubuntu | Git/Make/Linux là kỹ năng bắt buộc của nghề |

**Vì sao không cài sớm hơn?** Vì mỗi giờ cài đặt là một giờ không học digital logic. Và tool cài lúc chưa biết dùng sẽ hỏng lúc bạn cần nhất — lúc đó bạn không phân biệt được "mạch tôi sai" hay "tool tôi hỏng". Đó là cái bẫy tệ nhất với người mới.

Cài Icarus bây giờ cũng chẳng ích gì: chưa có bài nào để chạy.

---

## 2. Làm hôm nay — 20 phút, 0 đồng, 0 cài đặt

### Bước 1 — Tài khoản HDLBits (3 phút)

1. Mở **Chrome** hoặc **Edge** (đừng dùng trình duyệt cũ), vào <https://hdlbits.01xz.net>
2. Bấm **Log in/out** (góc trên phải) → **Create account**
3. Đăng ký bằng email, xác nhận.

**Để làm gì:** lưu tiến độ. Không có tài khoản thì mỗi lần đóng tab là mất dấu đã làm bài nào. Có tài khoản thì trang **My Stats** là bảng điểm của bạn — nhìn nó lớn lên mỗi tuần là động lực thật.

### Bước 2 — Tài khoản EDA Playground (2 phút)

1. Vào <https://edaplayground.com> → **Login** → đăng nhập bằng Google/GitHub.
2. Chưa cần làm gì thêm, chỉ cần có tài khoản.

**Để làm gì:** đây là nơi chạy **code của bạn** (không phải bài của HDLBits) — testbench, lab, mạch tự viết. Nó có Icarus Verilog, Verilator, và xem waveform ngay trên web. Miễn phí.

### Bước 3 — VS Code: mở đúng thư mục + 2 extension (8 phút)

1. Mở **VS Code**.
2. **File → Open Folder…** → chọn `C:\Users\HINEEN\Desktop\TKVM` → **Select Folder**.
   → Cửa sổ bên trái giờ hiện toàn bộ repo của bạn. **Luôn mở đúng folder này**, đừng mở từng file lẻ.
3. Bấm biểu tượng **Extensions** (4 ô vuông, cột trái) hoặc `Ctrl+Shift+X`.
4. Cài đúng **2 cái** này (gõ tên vào ô search):
   - **`Verilog-HDL/SystemVerilog/Bluespec SystemVerilog`** (tác giả `mshr-h`) — tô màu cú pháp Verilog. Không có nó thì code Verilog là một màu trắng.
   - **`WaveTrace`** — mở file `.vcd` (waveform) ngay trong VS Code, sau này thay cho GTKWave.
5. Đóng VS Code, mở lại, mở folder `TKVM`.
   → Bạn sẽ thấy VS Code hỏi *"This workspace has extension recommendations"* → bấm **Install All** (tôi đã đặt sẵn file gợi ý).

**Nếu không thấy gợi ý:** cứ cài tay 2 cái trên.

### Bước 4 — Kiểm tra môi trường đã chạy (5 phút)

Đây là **bài test môi trường thật sự**, và nó chính là bài bạn đang học:

1. Vào <https://hdlbits.01xz.net/wiki/Step_one>
2. Trong ô code, sửa thành:

```verilog
module top_module( output one );

    assign one = 1'b1;

endmodule
```

3. Bấm **Simulate**.
4. Nhìn ô kết quả phía dưới.

**Kết quả mong đợi:**

```
Status: Success!
Mismatches: 0
```

Nếu ra `Status: Success!` → **môi trường của bạn đã hoàn chỉnh.** Không cần cài thêm gì trong 9 tuần tới.

Nếu không ra Success → xem mục 6 (chẩn đoán).

---

## 3. Git — 15 phút, làm một lần, dùng cả đời

Git là thứ *duy nhất* trong danh sách này mà không làm thì 4 năm sau bạn không có gì để khoe. Mở **terminal** trong VS Code (`Ctrl+~` — dấu huyền cạnh số 1) và gõ từng dòng, Enter sau mỗi dòng:

```bash
# 1. Khai báo bạn là ai (đổi thành tên và email GitHub của bạn)
git config --global user.name "HINEEN"
git config --global user.email "email-cua-ban@gmail.com"

# 2. Để Git tự xử lý xuống dòng Windows/Linux (tránh lỗi khó hiểu sau này)
git config --global core.autocrlf true

# 3. Đặt tên nhánh mặc định là main
git config --global init.defaultBranch main

# 4. Biến thư mục này thành một repo Git
git init

# 5. Xem trạng thái — bạn sẽ thấy danh sách file màu đỏ
git status

# 6. Đưa tất cả vào "giỏ" chờ
git add .

# 7. Chụp lại một phiên bản, kèm lời nhắn
git commit -m "Khoi tao lo trinh hoc IC design"
```

Sau đó tạo repo trên GitHub tên `ic-design-journey`, và:

```bash
git remote add origin https://github.com/<username>/ic-design-journey.git
git push -u origin main
```

> Lần đầu `push`, Git sẽ mở cửa sổ đăng nhập GitHub trên trình duyệt. Bấm **Authorize** là xong — không cần nhớ token.

**Kiểm tra:** mở GitHub trên web, thấy file README.md của bạn là thành công.

---

## 4. Từ giờ mỗi buổi học, chỉ có 4 lệnh này

```bash
git status                 # tôi vừa sửa gì?
git add .                  # lấy hết
git commit -m "noi dung"   # chụp lại
git push                   # đưa lên mạng
```

Đừng học thêm gì về Git trong 3 tháng tới. Bốn lệnh này đủ.

---

## 5. Khi nào cài simulator trên máy (tuần 10 — chưa làm bây giờ)

Lúc đó bạn mới cần, nhưng biết trước để khỏi hoang mang:

| Hoàn cảnh | Cách làm | Ghi chú |
|---|---|---|
| **Có quyền admin** trên máy | Tải installer ở <https://bleyer.org/icarus/> | Cài 1 lần, có sẵn `iverilog` + `gtkwave` |
| **Không có admin** (máy bạn hiện tại là vậy) | Tải **OSS CAD Suite** bản portable `.zip` ở <https://github.com/YosysHQ/oss-cad-suite-build/releases> → giải nén ra `D:\tools\` → thêm thư mục `bin` vào PATH | Không cần cài, không cần admin, ~1 GB |
| **Không muốn cài gì** | Dùng **EDA Playground** | Chậm hơn, nhưng chạy được mọi thứ |
| **Muốn học Linux luôn** | `wsl --install` (cần admin + reboot) → `sudo apt install iverilog gtkwave` | Được cả 2 mục đích |

Các lab trong `Lab/` đã có sẵn `run.cmd` và sẽ tự báo lỗi rõ ràng nếu chưa có `iverilog` — không có gì hỏng.

---

## 6. Chẩn đoán khi kẹt

| Triệu chứng | Nguyên nhân thường gặp | Cách sửa |
|---|---|---|
| Bấm Simulate, không có gì xảy ra | Trình duyệt chặn JS / dùng trình duyệt cũ | Dùng Chrome/Edge, tắt adblock cho trang này |
| `Compile Error` | Thiếu `;` hoặc sai tên | Đọc dòng lỗi đầu tiên, đối chiếu với bài giảng |
| `Simulation Error` | Đổi tên `top_module` hoặc tên port | Giữ đúng tên đề cho |
| Vào hdlbits.01xz.net rất chậm | Server ở nước ngoài | Thử lại sau, hoặc dùng 4G |
| VS Code không tô màu Verilog | Chưa cài extension, hoặc chưa mở đúng folder | Mở folder `TKVM`, cài `mshr-h` |
| `git commit` báo "Author identity unknown" | Chưa chạy bước 3 mục 3 | Chạy lại `git config --global user.name/email` |
| `git push` báo lỗi xác thực | Chưa authorize trên trình duyệt | Chạy lại `git push`, bấm Authorize |

---

## 7. Ba thứ **đừng** cài (dù ai khuyên)

| Thứ | Dung lượng | Vì sao không |
|---|---|---|
| **Quartus / Vivado** | 20–50 GB | Bản dùng cho FPGA thật. Năm 1 bạn không có board, không cần synthesize ra chip |
| **ModelSim / Questa** | 5–10 GB | HDLBits đã chạy ModelSim hộ bạn |
| **Tool của hãng FPGA board** | vài GB | Chưa có board thì vô nghĩa |

Cài mấy thứ này bây giờ = mất 1 buổi học, thêm 30 GB, và tăng nguy cơ "cài xong tưởng mình đang học".

---

## 8. Việc cần làm ngay (checklist)

- [ ] Tạo tài khoản HDLBits
- [ ] Tạo tài khoản EDA Playground
- [ ] Mở folder `TKVM` trong VS Code + cài 2 extension
- [ ] Làm `Step one` → thấy **Success!**
- [ ] Chạy 7 lệnh Git ở mục 3
- [ ] Tạo repo GitHub + `push`
- [ ] Viết `notes/week01.md` (đã có sẵn file, chỉ cần điền)

Xong 7 dòng này là bạn có môi trường **ngang với sinh viên năm 3** ở khoản công cụ. Thứ còn lại — và là thứ duy nhất thật sự quan trọng — là số bài đã làm.
