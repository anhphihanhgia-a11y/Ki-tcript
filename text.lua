pcall(function()
    if game.CoreGui:FindFirstChild("WindUI") then
        game.CoreGui.WindUI:Destroy()
    end
end)

local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/teoscrvn/T-ng-h-p-/main/Script%20test%20(1).txt"
))()

if not WindUI then
    warn("❌ Không load được WindUI")
    return
end

print("🍎 WindUI loaded OK")

-- 🔹 Tạo Giao Diện Chính (Window)
local Window = WindUI:CreateWindow({
    Title = "🍎 kiet banana",
    Size = UDim2.fromOffset(580, 340),
    Theme = "Dark",
    Transparent = true
})

-- 🔹 Cấu hình Nút Thu Nhỏ/Mở Giao Diện với ID Ảnh Của Bạn
Window:EditOpenButton({
    Title = "kiet cu 🇻🇳",
    Icon = "rbxassetid://137619343200989", -- Đã đổi sang ID ảnh bạn yêu cầu
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    ),
    Draggable = true,
})

-- ==========================================
-- 🍎 KHỞI TẠO CÁC DANH MỤC (TABS)
-- ==========================================
local Tabs = {}
Tabs.Home1 = Window:Tab({ Title = "🍎 HOME 🍎" })
Tabs.Home2 = Window:Tab({ Title = "player" })

-- ==========================================
-- 🍎 CÁC CHỨC NĂNG TẠI TAB: HOME
-- ==========================================

-- 1. Nút Chạy Định Vị
Tabs.Home1:Button({
    Title = "🍎 Định vị Téo",
    Callback = function()
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/teoscrvn/Script-t-o-v2/main/dinhvi2.txt"
        ))()
        print("🍎 Đã chạy định vị")
    end
})

-- 2. Nút Chạy Hitbox (Tích hợp chống spam click)
local hitboxLoaded = false
Tabs.Home1:Button({
    Title = "🍎 Hitbox Téo",
    Callback = function()
        if hitboxLoaded then
            warn("⚠️ Hitbox đã bật rồi!")
            return
        end
        hitboxLoaded = true
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/teoscrvn/Script-t-o-v2/main/hitbox%20roblox.txt"
        ))()
        print("🍎 Hitbox ON")
    end
})

-- ==========================================
-- 🍎 CÁC CHỨC NĂNG TẠI TAB: PLAYER
-- ==========================================

-- Công tắc bật/tắt thử nghiệm
Tabs.Home2:Toggle({
    Title = "🍎 Chế độ Pro (test)",
    Default = false,
    Callback = function(state)
        print("🍎 Pro Mode:", state)
    end
})

-- ==========================================
-- 🍎 THÔNG BÁO HỆ THỐNG
-- ==========================================
WindUI:Notify({
    Title = "🍎 TÉO HUB",
    Content = "Tải cấu trúc giao diện thành công với Icon mới!",
    Duration = 4
})
