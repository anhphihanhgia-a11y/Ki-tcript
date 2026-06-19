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

-- 🔹 Khởi tạo Cửa sổ Menu chính
local Window = WindUI:CreateWindow({
    Title = "🏴‍☠️ KIET BANANA HUB (DEVELOPER)",
    Size = UDim2.fromOffset(550, 350),
    Theme = "Dark",
    Transparent = false
})

-- 🔹 Nút bấm để thu nhỏ / mở lại Menu
Window:EditOpenButton({
    Title = "Open Menu 🌊",
    Icon = "anchor", -- Biểu tượng mỏ neo phong cách biển cả
    CornerRadius = UDim.new(0, 12),
    StrokeThickness = 1.5,
    Color = ColorSequence.new(
        Color3.fromHex("FF3333"), -- Màu đỏ
        Color3.fromHex("FF9900")  -- Màu cam
    ),
    Draggable = true,
})

-- ==========================================
-- 📂 KHỞI TẠO CÁC DANH MỤC (TABS) ĐẶC TRƯNG
-- ==========================================
local Tabs = {}
Tabs.Main = Window:Tab({ Title = "⚔️ MAIN" })
Tabs.Stats = Window:Tab({ Title = "📊 STATS" })
Tabs.Teleport = Window:Tab({ Title = "🗺️ TELEPORT" })
Tabs.Settings = Window:Tab({ Title = "⚙️ SETTINGS" })

-- ==========================================
-- ⚔️ TAB 1: MAIN CONTROLS (Ví dụ chọn vũ khí)
-- ==========================================
local WeaponDropdown = Tabs.Main:Dropdown({
    Title = "Chọn vũ khí sử dụng",
    Multi = false,
    Options = {"Melee", "Sword", "Devil Fruit", "Gun"},
    Default = "Melee",
    Callback = function(selected)
        print("Vũ khí hiện tại đã chọn:", selected)
    end
})

Tabs.Main:Toggle({
    Title = "Tự động nhận nhiệm vụ (Ví dụ)",
    Default = false,
    Callback = function(state)
        print("Trạng thái Auto Quest:", state)
    end
})

-- ==========================================
-- 📊 TAB 2: STATS (Quản lý nâng điểm)
-- ==========================================
Tabs.Stats:Toggle({
    Title = "Tự động nâng điểm Melee",
    Default = false,
    Callback = function(state)
        print("Auto Stats Melee:", state)
    end
})

-- ==========================================
-- 🗺️ TAB 3: TELEPORT (Lựa chọn đảo di chuyển)
-- ==========================================
local IslandDropdown = Tabs.Teleport:Dropdown({
    Title = "Chọn đảo muốn đến",
    Multi = false,
    Options = {"Starter Island", "Marine Fortress", "Desert", "Frozen Village"},
    Default = "Starter Island",
    Callback = function(island)
        print("Đang tính toán đường đi tới:", island)
    end
})

Tabs.Teleport:Button({
    Title = "Bắt đầu dịch chuyển mượt (Tween)",
    Callback = function()
        -- Nơi bạn gắn hàm TweenService để di chuyển nhân vật hợp pháp
        WindUI:Notify({
            Title = "HỆ THỐNG",
            Content = "Đang bắt đầu di chuyển nhân vật...",
            Duration = 3
        })
    end
})

-- ==========================================
-- 🔔 THÔNG BÁO HỆ THỐNG KHI TẢI XONG
-- ==========================================
WindUI:Notify({
    Title = "🏴‍☠️ BANANA HUB",
    Content = "Khởi tạo khung giao diện thành công!",
    Duration = 4
})
