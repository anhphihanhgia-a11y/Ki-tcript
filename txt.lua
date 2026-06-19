pcall(function()
    if game.CoreGui:FindFirstChild("WindUI") then
        game.CoreGui.WindUI:Destroy()
    end
end)

local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/teoscrvn/T-ng-h-p-/main/Script%20test%20(1).txt"
))()

if not WindUI then
    warn("❌ Không nạp được thư viện giao diện")
    return
end

-- 🔹 Thiết lập Cửa sổ Menu Chính với giao diện cao cấp
local Window = WindUI:CreateWindow({
    Title = "🏴‍☠️ KIET BANANA HUB v3.0 (PREMIUM UI)",
    Size = UDim2.fromOffset(600, 380),
    Theme = "Dark",
    Transparent = false
})

-- 🔹 Nút thu nhỏ/mở rộng menu với hiệu ứng màu Gradient chuyên nghiệp
Window:EditOpenButton({
    Title = "Kiet Hub 🌟",
    Icon = "shield",
    CornerRadius = UDim.new(0, 12),
    StrokeThickness = 1.5,
    Color = ColorSequence.new(
        Color3.fromHex("00FFA3"), -- Màu xanh Neon
        Color3.fromHex("007BFF")  -- Màu xanh biển
    ),
    Draggable = true,
})

-- ==========================================
-- 📂 PHÂN CHIA DANH MỤC CHỨC NĂNG (TABS)
-- ==========================================
local Tabs = {}
Tabs.Main = Window:Tab({ Title = "⚔️ MAIN CONTROLS" })
Tabs.Visuals = Window:Tab({ Title = "👁️ VISUALS" })
Tabs.Settings = Window:Tab({ Title = "⚙️ SETTINGS" })

-- ==========================================
-- ⚔️ TAB: MAIN CONTROLS (Điều khiển chính)
-- ==========================================

-- 1. Hộp chọn phương thức hoạt động (Dropdown)
local MethodDropdown = Tabs.Main:Dropdown({
    Title = "Chọn chế độ ưu tiên",
    Multi = false,
    Options = {"Chế độ cơ bản", "Chế độ tối ưu", "Chế độ thử nghiệm"},
    Default = "Chế độ cơ bản",
    Callback = function(selected)
        print("Đã chuyển sang:", selected)
    end
})

-- 2. Công tắc kích hoạt tổng (Toggle)
Tabs.Main:Toggle({
    Title = "Kích hoạt vòng lặp kiểm tra (Test)",
    Default = false,
    Callback = function(state)
        print("Trạng thái vòng lặp:", state)
    end
})

-- ==========================================
-- 👁️ TAB: VISUALS (Cài đặt hiển thị & Đồ họa)
-- ==========================================

-- 1. Thanh kéo giá trị (Slider) - Phù hợp để chỉnh khoảng cách hoặc tầm nhìn (FOV)
Tabs.Visuals:Slider({
    Title = "Khoảng cách quét tối đa (Studs)",
    Step = 5,
    Min = 50,
    Max = 1000,
    Default = 250,
    Callback = function(value)
        print("Khoảng cách quét hiện tại:", value)
    end
})

-- 2. Bảng chọn màu sắc (Colorpicker) - Tùy biến màu của các khung hiển thị
Tabs.Visuals:Colorpicker({
    Title = "Màu sắc giao diện thông báo",
    Default = Color3.fromRGB(0, 255, 163),
    Callback = function(color)
        print("Màu sắc mới được chọn:", tostring(color))
    end
})

-- ==========================================
-- ⚙️ TAB: SETTINGS (Quản lý cấu hình)
-- ==========================================

-- Nút bấm thực thi dọn dẹp hoặc đặt lại dữ liệu
Tabs.Settings:Button({
    Title = "Đặt lại toàn bộ cấu hình về mặc định",
    Callback = function()
        WindUI:Notify({
            Title = "HỆ THỐNG",
            Content = "Đã làm mới và khôi phục cài đặt gốc thành công!",
            Duration = 3
        })
    end
})

-- ==========================================
-- 🔔 THÔNG BÁO KHỞI ĐỘNG HỆ THỐNG
-- ==========================================
WindUI:Notify({
    Title = "🏴‍☠️ BANANA HUB",
    Content = "Tải cấu trúc giao diện cao cấp thành công!",
    Duration = 5
})
