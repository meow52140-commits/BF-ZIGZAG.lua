--[[
    ZIGZAG HUB • MANGA EYE V4 • EGG COMMAND CENTER
    Standalone original UI. Read-only egg discovery, filters, local markers, and feature configurations.
    No external script loaders, HTTP, teleport hooks, remote calls, anti-idle, or character edits.
    Image by the user: rbxassetid://85580956675001
    IMPORTANT: This script is not a bypass for Roblox/game anti-cheat.
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
if not player then return end
local playerGui = player:WaitForChild("PlayerGui")
local GUI_NAME = "ZIGZAG_HUB_MANGA_EYE_STANDALONE_V2"
local previous = playerGui:FindFirstChild(GUI_NAME)
if previous then previous:Destroy() end

local COLORS = {
    background = Color3.fromRGB(12, 10, 20),
    panel = Color3.fromRGB(21, 17, 35),
    surface = Color3.fromRGB(35, 27, 54),
    hover = Color3.fromRGB(48, 36, 74),
    purple = Color3.fromRGB(170, 111, 254),
    purpleLight = Color3.fromRGB(219, 186, 255),
    outline = Color3.fromRGB(99, 73, 150),
    white = Color3.fromRGB(249, 247, 255),
    muted = Color3.fromRGB(173, 161, 199),
    mint = Color3.fromRGB(132, 239, 196),
    yellow = Color3.fromRGB(255, 210, 120),
}
local EYE = "rbxassetid://85580956675001"
local BOLD = Enum.Font.GothamBold
local NORMAL = Enum.Font.Gotham

local function make(kind, parent, props)
    local obj = Instance.new(kind)
    for k, v in pairs(props or {}) do obj[k] = v end
    obj.Parent = parent
    return obj
end
local function corner(parent, radius)
    return make("UICorner", parent, {CornerRadius = UDim.new(0, radius)})
end
local function outline(parent, color, thick, opacity)
    return make("UIStroke", parent, {
        Color = color or COLORS.outline,
        Thickness = thick or 1,
        Transparency = opacity or 0,
    })
end
local function text(parent, title, size, bold, color, props)
    local defaults = {
        BackgroundTransparency = 1,
        Text = title,
        Font = bold and BOLD or NORMAL,
        TextSize = size or 13,
        TextColor3 = color or COLORS.white,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextWrapped = true,
        BorderSizePixel = 0,
    }
    for k, v in pairs(props or {}) do defaults[k] = v end
    return make("TextLabel", parent, defaults)
end

local gui = make("ScreenGui", playerGui, {
    Name = GUI_NAME,
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 180,
})

local icon = make("ImageButton", gui, {
    Name = "ZIGZAG_EYE_ICON",
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 16, 0.5, 0),
    Size = UDim2.fromOffset(58, 58),
    BackgroundColor3 = COLORS.background,
    Image = EYE,
    ScaleType = Enum.ScaleType.Crop,
    ClipsDescendants = true,
    AutoButtonColor = true,
    ZIndex = 90,
})
corner(icon, 16)
outline(icon, COLORS.purple, 2, 0)
local badge = text(gui, "ZIGZAG", 10, true, COLORS.background, {
    BackgroundTransparency = 0,
    BackgroundColor3 = COLORS.purple,
    TextXAlignment = Enum.TextXAlignment.Center,
    Position = UDim2.new(0, 19, 0.5, 37),
    Size = UDim2.fromOffset(53, 18),
    ZIndex = 91,
})
corner(badge, 7)

local panel = make("Frame", gui, {
    Name = "ZIGZAG_PANEL",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(620, 400),
    BackgroundColor3 = COLORS.background,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10,
})
corner(panel, 18)
outline(panel, COLORS.outline, 1.5, 0.05)
local scaler = make("UIScale", panel, { Scale = 1 })

local wallpaper = make("ImageLabel", panel, {
    Name = "MANGA_EYE_WALLPAPER",
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 1),
    Image = EYE,
    ImageTransparency = 0.89,
    ScaleType = Enum.ScaleType.Crop,
    ZIndex = 11,
})
local topShade = make("Frame", panel, {
    Position = UDim2.fromOffset(0, 0),
    Size = UDim2.new(1, 0, 0, 72),
    BorderSizePixel = 0,
    BackgroundColor3 = COLORS.panel,
    BackgroundTransparency = 0.14,
    ZIndex = 12,
})
make("UIGradient", topShade, {
    Rotation = 90,
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.05),
        NumberSequenceKeypoint.new(1, 1),
    }),
})
local header = make("Frame", panel, {
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 70),
    ZIndex = 22,
})
local headerEye = make("ImageLabel", header, {
    Position = UDim2.fromOffset(16, 13),
    Size = UDim2.fromOffset(45, 45),
    BackgroundColor3 = COLORS.surface,
    Image = EYE,
    ScaleType = Enum.ScaleType.Crop,
    ZIndex = 23,
})
corner(headerEye, 13)
outline(headerEye, COLORS.purple, 1.5, 0)
text(header, "ZIGZAG  HUB", 22, true, COLORS.white, {
    Position = UDim2.fromOffset(73, 12),
    Size = UDim2.fromOffset(290, 30),
    ZIndex = 23,
})
text(header, "MANGA EYE  •  EGG COMMAND  •  V4", 10, false, COLORS.muted, {
    Position = UDim2.fromOffset(74, 40),
    Size = UDim2.fromOffset(315, 18),
    ZIndex = 23,
})
local minimize = make("TextButton", header, {
    Position = UDim2.new(1, -49, 0, 20),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = COLORS.surface,
    BorderSizePixel = 0,
    Text = "—",
    Font = BOLD,
    TextSize = 19,
    TextColor3 = COLORS.white,
    ZIndex = 24,
})
corner(minimize, 9)
make("Frame", panel, {
    Position = UDim2.fromOffset(16, 70),
    Size = UDim2.new(1, -32, 0, 1),
    BackgroundColor3 = COLORS.outline,
    BackgroundTransparency = 0.45,
    BorderSizePixel = 0,
    ZIndex = 21,
})

local sidebar = make("ScrollingFrame", panel, {
    Position = UDim2.fromOffset(12, 83),
    Size = UDim2.new(0, 147, 1, -119),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ZIndex = 20,
})
make("UIListLayout", sidebar, {
    Padding = UDim.new(0, 9),
    SortOrder = Enum.SortOrder.LayoutOrder,
})
local content = make("ScrollingFrame", panel, {
    Position = UDim2.fromOffset(171, 83),
    Size = UDim2.new(1, -184, 1, -115),
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = COLORS.purple,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ZIndex = 20,
})
local pad = make("UIPadding", content, {
    PaddingRight = UDim.new(0, 7),
    PaddingBottom = UDim.new(0, 12),
})
local stack = make("UIListLayout", content, {
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 9),
})
local footer = text(panel, "● ZIGZAG V4 • อิสระ • อ่านข้อมูลเกมเท่านั้น", 10, false, COLORS.mint, {
    Position = UDim2.new(0, 16, 1, -26),
    Size = UDim2.new(1, -32, 0, 17),
    ZIndex = 24,
})
local function status(message, color)
    footer.Text = "● " .. message
    footer.TextColor3 = color or COLORS.mint
end
local function section(title, details)
    local height = details and 73 or 46
    local card = make("Frame", content, {
        Size = UDim2.new(1, 0, 0, height),
        BackgroundColor3 = COLORS.panel,
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        ZIndex = 21,
    })
    corner(card, 12)
    outline(card, COLORS.outline, 1, 0.5)
    text(card, title, 16, true, COLORS.white, {
        Position = UDim2.fromOffset(14, 8),
        Size = UDim2.new(1, -28, 0, 25),
        ZIndex = 22,
    })
    if details then
        text(card, details, 11, false, COLORS.muted, {
            Position = UDim2.fromOffset(14, 33),
            Size = UDim2.new(1, -28, 0, 33),
            TextYAlignment = Enum.TextYAlignment.Top,
            ZIndex = 22,
        })
    end
    return card
end
local function item(title, details, accentColor)
    local box = make("Frame", content, {
        Size = UDim2.new(1, 0, 0, details and 77 or 53),
        BackgroundColor3 = COLORS.surface,
        BackgroundTransparency = 0.09,
        BorderSizePixel = 0,
        ZIndex = 21,
    })
    corner(box, 12)
    outline(box, accentColor or COLORS.outline, 1, 0.59)
    text(box, title, 14, true, COLORS.white, {
        Position = UDim2.fromOffset(13, 9),
        Size = UDim2.new(1, -26, 0, 20),
        ZIndex = 22,
    })
    if details then
        text(box, details, 11, false, COLORS.muted, {
            Position = UDim2.fromOffset(13, 32),
            Size = UDim2.new(1, -26, 0, 35),
            TextYAlignment = Enum.TextYAlignment.Top,
            ZIndex = 22,
        })
    end
    return box
end
local function action(title, description, caption, callback)
    local box = make("Frame", content, {
        Size = UDim2.new(1, 0, 0, 114),
        BackgroundColor3 = COLORS.surface,
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        ZIndex = 21,
    })
    corner(box, 12)
    outline(box, COLORS.outline, 1, 0.6)
    text(box, title, 14, true, COLORS.white, {
        Position = UDim2.fromOffset(13, 6),
        Size = UDim2.new(1, -26, 0, 25),
        ZIndex = 22,
    })
    text(box, description, 11, false, COLORS.muted, {
        Position = UDim2.fromOffset(13, 29),
        Size = UDim2.new(1, -26, 0, 29),
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = 22,
    })
    local press = make("TextButton", box, {
        Position = UDim2.new(0, 13, 1, -44),
        Size = UDim2.new(1, -26, 0, 33),
        BackgroundColor3 = COLORS.purple,
        TextColor3 = COLORS.background,
        Text = caption,
        Font = BOLD,
        TextSize = 12,
        BorderSizePixel = 0,
        ZIndex = 23,
    })
    corner(press, 9)
    press.Activated:Connect(function()
        if not gui.Parent then return end
        local ok, err = pcall(callback)
        if not ok then
            warn("[ZIGZAG HUB V3] UI action:", err)
            status("เมนูทำงานผิดพลาด", COLORS.yellow)
        end
    end)
    return box
end

-- V3: Local-only UI configuration; no game state mutation.
local preferences = {
    eggPreview = false, eggMode = "ใกล้ที่สุด", eggLimit = 12,
    minRarity = "ทั้งหมด", nameQuery = "", minValue = 0,
    eggMarkers = false,
    autoSteal = false, instantSteal = false, stealMode = "เดินปกติ", stealPriority = "มูลค่า",
    autoPlace = false, placeRule = "เมื่อกลับฐาน", placePriority = "มูลค่า",
    autoHatch = false, hatchMin = "ทั้งหมด", autoEquip = false,
    autoSell = false, keepMutated = true, labAuto = false,
    hopMode = "คนในห้องน้อย", autoHop = false,
    compact = false,
}
local RARITIES = {"ทั้งหมด", "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Cosmic", "Celestial", "Divine", "Secret"}
local RARITY_INDEX = {}
for i, name in ipairs(RARITIES) do RARITY_INDEX[name:lower()] = i end
local scannedEggs = {}
local eggHighlights = {}
local scannedCount = 0
local eggLastScan = "ยังไม่สแกน"
local featureStatus = "ระบบคำสั่งเกมยังไม่เชื่อมต่อ • ใช้ดูตัวเลือก/ตัวกรองก่อน"

local function toggleControl(title, description, key, onChange)
    local box = item(title, description)
    box.Size = UDim2.new(1, 0, 0, 86)
    local button = make("TextButton", box, {
        Position = UDim2.new(1, -107, 1, -35), Size = UDim2.fromOffset(94, 27),
        BackgroundColor3 = preferences[key] and COLORS.purple or COLORS.panel,
        Text = preferences[key] and "เปิด" or "ปิด", Font = BOLD, TextSize = 12,
        TextColor3 = COLORS.white, BorderSizePixel = 0, ZIndex = 23,
    })
    corner(button, 8)
    button.Activated:Connect(function()
        preferences[key] = not preferences[key]
        button.Text = preferences[key] and "เปิด" or "ปิด"
        button.BackgroundColor3 = preferences[key] and COLORS.purple or COLORS.panel
        status("บันทึกค่าในหน้าต่าง: " .. title)
        if onChange then onChange(preferences[key]) end
    end)
end
local function dropdownControl(title, description, key, options, onChange)
    local box = item(title, description)
    box.Size = UDim2.new(1, 0, 0, 91)
    local button = make("TextButton", box, {
        Position = UDim2.new(0, 13, 1, -34), Size = UDim2.new(1, -26, 0, 27),
        BackgroundColor3 = COLORS.panel, Text = tostring(preferences[key]) .. "  ▾",
        Font = BOLD, TextSize = 12, TextColor3 = COLORS.purpleLight,
        BorderSizePixel = 0, ZIndex = 23,
    })
    corner(button, 8)
    button.Activated:Connect(function()
        local index = table.find(options, preferences[key]) or 0
        preferences[key] = options[(index % #options) + 1]
        button.Text = tostring(preferences[key]) .. "  ▾"
        status("เลือกโหมด: " .. tostring(preferences[key]))
        if onChange then onChange(preferences[key]) end
    end)
end
local function sliderControl(title, description, key, minimum, maximum, onChange)
    local box = item(title, description)
    box.Size = UDim2.new(1, 0, 0, 103)
    local minus = make("TextButton", box, {
        Position = UDim2.new(0, 13, 1, -36), Size = UDim2.fromOffset(43, 29),
        BackgroundColor3 = COLORS.panel, Text = "−", Font = BOLD,
        TextSize = 18, TextColor3 = COLORS.white, BorderSizePixel = 0, ZIndex = 23,
    })
    corner(minus, 8)
    local value = text(box, tostring(preferences[key]), 14, true, COLORS.purpleLight, {
        Position = UDim2.new(0, 62, 1, -36), Size = UDim2.new(1, -124, 0, 29),
        TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 23,
    })
    local plus = make("TextButton", box, {
        Position = UDim2.new(1, -56, 1, -36), Size = UDim2.fromOffset(43, 29),
        BackgroundColor3 = COLORS.panel, Text = "+", Font = BOLD,
        TextSize = 18, TextColor3 = COLORS.white, BorderSizePixel = 0, ZIndex = 23,
    })
    corner(plus, 8)
    local function change(delta)
        preferences[key] = math.clamp(preferences[key] + delta, minimum, maximum)
        value.Text = tostring(preferences[key])
        status("ปรับค่าแสดงผล: " .. tostring(preferences[key]))
    end
    minus.Activated:Connect(function() change(-1) end)
    plus.Activated:Connect(function() change(1) end)
end


-- The settings pages describe future gameplay modules. None of these toggles calls
-- game remotes or changes the player's movement. Mark them as configuration only.
local function configToggle(title, detail, key)
    toggleControl(title .. " • ตั้งค่าไว้", detail .. " (ยังไม่สั่งทำงานในเกม)", key)
end
local function configDropdown(title, detail, key, values)
    dropdownControl(title, detail .. " (ตัวเลือกสำหรับระบบในอนาคต)", key, values)
end
local function configNote()
    item("การทำงานจริง", featureStatus, COLORS.yellow)
end

local function inputControl(title, description, key, placeholder)
    local box = item(title, description)
    box.Size = UDim2.new(1, 0, 0, 106)
    local field = make("TextBox", box, {
        Position = UDim2.new(0, 13, 1, -38),
        Size = UDim2.new(1, -26, 0, 30),
        Text = tostring(preferences[key] or ""),
        PlaceholderText = placeholder or "พิมพ์ข้อความ...",
        ClearTextOnFocus = false,
        Font = NORMAL, TextSize = 13,
        TextColor3 = COLORS.white,
        PlaceholderColor3 = COLORS.muted,
        BackgroundColor3 = COLORS.panel,
        BorderSizePixel = 0, ZIndex = 23,
    })
    corner(field, 8)
    make("UIPadding", field, {PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 9)})
    field.FocusLost:Connect(function()
        if not gui.Parent then return end
        if key == "minValue" then
            local parsed = tonumber(field.Text) or 0
            preferences[key] = math.max(0, math.floor(parsed))
            field.Text = tostring(preferences[key])
        else
            preferences[key] = string.sub(field.Text, 1, 70)
        end
        status("บันทึกตัวกรอง " .. title)
    end)
    return field
end

local function isEggName(name)
    local lower = string.lower(name)
    return string.find(lower, "egg", 1, true) ~= nil or
           string.find(name, "ไข่", 1, true) ~= nil
end
local function stringValue(obj, keys)
    local attrs = obj:GetAttributes()
    for _, key in ipairs(keys) do
        local value = attrs[key]
        if value ~= nil then return tostring(value) end
        local child = obj:FindFirstChild(key)
        if child and (child:IsA("StringValue") or child:IsA("NumberValue") or child:IsA("IntValue")) then
            return tostring(child.Value)
        end
    end
    return nil
end
local function eggPosition(obj)
    if obj:IsA("BasePart") then return obj.Position end
    if obj:IsA("Model") then
        local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
        if part then return part.Position end
    end
    return nil
end
local function playerPosition()
    local c = player.Character
    local root = c and c:FindFirstChild("HumanoidRootPart")
    return root and root.Position
end
local function clearMarkers()
    for _, marker in ipairs(eggHighlights) do
        pcall(function() marker:Destroy() end)
    end
    for i = #eggHighlights, 1, -1 do eggHighlights[i] = nil end
end
local function filteredEggs()
    local found = {}
    local query = string.lower(preferences.nameQuery or "")
    local minR = RARITY_INDEX[string.lower(preferences.minRarity or "ทั้งหมด")] or 1
    local origin = playerPosition()
    for _, entry in ipairs(scannedEggs) do
        if entry.object and entry.object.Parent then
            local nameOK = (query == "") or (string.find(string.lower(entry.name), query, 1, true) ~= nil)
            local rank = RARITY_INDEX[string.lower(entry.rarity or "")] or 0
            local rarityOK = minR == 1 or rank >= minR
            local valueOK = entry.value and entry.value >= (preferences.minValue or 0)
            if (preferences.minValue or 0) == 0 then valueOK = true end
            if nameOK and rarityOK and valueOK then
                local distance = (origin and entry.position) and (entry.position - origin).Magnitude or math.huge
                table.insert(found, {data = entry, distance = distance})
            end
        end
    end
    local mode = preferences.eggMode
    table.sort(found, function(a, b)
        if mode == "ตามชื่อ" then return a.data.name < b.data.name end
        if mode == "มูลค่าสูงสุด" then
            local va = a.data.value or -1
            local vb = b.data.value or -1
            if va ~= vb then return va > vb end
        end
        return a.distance < b.distance
    end)
    return found
end
local function updateMarkers()
    clearMarkers()
    if not preferences.eggMarkers then return end
    local selected = filteredEggs()
    for i = 1, math.min(#selected, 15) do
        local obj = selected[i].data.object
        local ok, highlight = pcall(function()
            local h = Instance.new("Highlight")
            h.Name = "ZIGZAG_LOCAL_EGG_MARKER"
            h.Adornee = obj
            h.FillColor = COLORS.purple
            h.OutlineColor = COLORS.purpleLight
            h.FillTransparency = 0.86
            h.OutlineTransparency = 0
            h.DepthMode = Enum.HighlightDepthMode.Occluded
            h.Parent = workspace -- local-only visual marker; cleanup on UI destruction
            return h
        end)
        if ok and highlight then table.insert(eggHighlights, highlight) end
    end
end
local function scanEggs()
    -- Read visible workspace objects only; this does not unlock hidden data.
    -- Users can always scan manually. No remotes, teleport, or prompt firing.
    for i = #scannedEggs, 1, -1 do scannedEggs[i] = nil end
    local seen = {}
    local checked = 0
    local limit = 14000
    local objects = workspace:GetDescendants()
    for _, obj in ipairs(objects) do
        checked = checked + 1
        if checked > limit or #scannedEggs >= 90 then break end
        if (obj:IsA("Model") or obj:IsA("BasePart")) and isEggName(obj.Name) then
            local target = obj
            local model = obj:FindFirstAncestorOfClass("Model")
            if model and isEggName(model.Name) then target = model end
            local ownerCharacter = target:FindFirstAncestorOfClass("Model")
            local belongsToCharacter = ownerCharacter and Players:GetPlayerFromCharacter(ownerCharacter)
            if not seen[target] and not belongsToCharacter then
                seen[target] = true
                local rarity = stringValue(target, {"Rarity", "rarity", "Tier", "tier", "EggRarity"})
                local rawValue = stringValue(target, {"Value", "value", "Price", "price", "Cost", "cost"})
                local numericValue = rawValue and tonumber(rawValue) or nil
                table.insert(scannedEggs, {
                    object = target,
                    name = target.Name,
                    rarity = rarity,
                    value = numericValue,
                    position = eggPosition(target),
                })
            end
        end
    end
    scannedCount = checked
    eggLastScan = "พบ " .. tostring(#scannedEggs) .. " รายการ จากการตรวจ " .. tostring(checked) .. " วัตถุ"
    updateMarkers()
    return #scannedEggs
end
local function eggResults()
    local found = filteredEggs()
    item("ผลการตรวจล่าสุด", eggLastScan .. " • ตรงตัวกรอง " .. #found .. " รายการ", COLORS.mint)
    if #found == 0 then
        item("ยังไม่พบไข่ที่ตรงเงื่อนไข", "ลองกดสแกนใหม่หรือเลือกความหายาก = ทั้งหมด • ชื่อโมเดลในแมพอาจไม่ได้ใช้คำว่า Egg")
    end
    for i = 1, math.min(#found, preferences.eggLimit) do
        local entry = found[i]
        local egg = entry.data
        local distance = entry.distance == math.huge and "ไม่ทราบ" or tostring(math.floor(entry.distance)) .. " studs"
        local details = "ระดับ: " .. (egg.rarity or "ไม่ทราบ") .. "  •  มูลค่า: " .. (egg.value and tostring(egg.value) or "ไม่ทราบ") .. "  •  ระยะ: " .. distance
        item(i .. ". " .. egg.name, details, COLORS.outline)
    end
end

local active = "หน้าแรก"
local tabButtons = {}
local wallpaperEnabled = true
local function clearPage()
    for _, obj in ipairs(content:GetChildren()) do
        if obj ~= pad and obj ~= stack then obj:Destroy() end
    end
    content.CanvasPosition = Vector2.new(0, 0)
end
local function setTab(name)
    active = name
    clearPage()
    for id, button in pairs(tabButtons) do
        button.BackgroundColor3 = (id == name) and COLORS.purple or COLORS.panel
        button.TextColor3 = (id == name) and COLORS.background or COLORS.muted
    end
    if name == "หน้าแรก" then
        section("ZIGZAG HUB • MANGA EYE 👁️", "ศูนย์ควบคุมไข่ดีไซน์ ZIGZAG • ธีมม่วงดำ • ภาษาไทย")
        item("ระบบที่ใช้งานได้ใน V4", "ค้นหาวัตถุไข่ที่ปรากฏใน Workspace • กรองชื่อ/ความหายาก/มูลค่า • ไฮไลต์ตำแหน่งไข่แบบเฉพาะเครื่อง", COLORS.mint)
        item("เมนูตามระบบเกม", "ขโมยไข่ • วางไข่ • ฟักไข่ • ค้นหาไข่ • ขาย • Dr. Scramble • เซิร์ฟเวอร์ • ผู้เล่น • ตั้งค่า")
        item("การเชื่อมต่อเกม", "เมนูขโมย/วาง/ฟัก/ขาย/กิจกรรมเป็นการตั้งค่าล่วงหน้า ยังไม่เรียกคำสั่งในเกม; ไม่ใช้สคริปต์อื่น", COLORS.yellow)
        action("ค้นหาไข่ในแมพ", "ตรวจวัตถุในแมพที่ชื่อมี Egg หรือ ไข่ (ไม่มีการเคลื่อนที่)", "สแกนไข่ตอนนี้", function()
            local total = scanEggs()
            setTab("ค้นหาไข่")
            status("สแกนเสร็จ: " .. total .. " รายการ")
        end)
    elseif name == "ค้นหาไข่" then
        section("EGG FINDER • ค้นหาไข่ในแมพ", "ค้นหาจากโมเดลที่เครื่องมองเห็น • ไม่อ่านข้อมูลลับของเซิร์ฟเวอร์")
        action("สแกนไข่ที่มองเห็น", "ตรวจ Workspace ใหม่ตามตัวกรองด้านล่าง", "สแกนใหม่", function()
            local total = scanEggs()
            setTab("ค้นหาไข่")
            status("พบวัตถุที่เข้าข่ายไข่ " .. total .. " รายการ")
        end)
        dropdownControl("เรียงรายการ", "ใกล้ที่สุด / มูลค่าสูงสุด / ตามชื่อ", "eggMode", {"ใกล้ที่สุด", "มูลค่าสูงสุด", "ตามชื่อ"}, function() updateMarkers() end)
        dropdownControl("ความหายากขั้นต่ำ", "ไม่ทราบระดับจะไม่ถูกแสดงเมื่อกรองระดับ", "minRarity", RARITIES, function() updateMarkers() end)
        inputControl("ชื่อไข่ที่ต้องการ", "เว้นว่างเพื่อดูทั้งหมด กดเสร็จบนคีย์บอร์ดเพื่อบันทึก", "nameQuery", "เช่น Golden")
        inputControl("มูลค่าขั้นต่ำ", "ใส่ตัวเลขเต็ม เช่น 1000000 (0 = ไม่กรอง)", "minValue", "0")
        sliderControl("จำนวนผลลัพธ์สูงสุด", "รายการต่อหน้า 1–30", "eggLimit", 1, 30)
        toggleControl("เน้นตำแหน่งไข่", "แสดง Highlight เฉพาะในเครื่อง (สูงสุด 15 ชิ้น)", "eggMarkers", function() updateMarkers() end)
        action("นำตัวกรองไปใช้", "แสดงผลการค้นหาตามตัวเลือกที่เพิ่งบันทึก", "แสดงผล", function()
            updateMarkers()
            setTab("ค้นหาไข่")
            status("ปรับผลการค้นหาแล้ว")
        end)
        eggResults()
    elseif name == "ขโมยไข่" then
        section("AUTO STEAL • ตั้งค่าการขโมยไข่", "โครงเมนูตามรูปแบบแมพเก็บไข่ • ไม่มีการสั่งเคลื่อนที่หรือโอนย้ายไข่")
        configToggle("ขโมยไข่อัตโนมัติ", "เลือกเปิดเก็บสถานะเตรียมผูกกับระบบเกม", "autoSteal")
        configToggle("ขโมยทันที", "ตั้งค่าโหมดขโมยทันที", "instantSteal")
        configDropdown("วิธีเข้าหาไข่", "เดินปกติเท่านั้นในขั้นพัฒนา", "stealMode", {"เดินปกติ", "รอเลือกเป้าหมาย", "เฉพาะไข่ที่กำหนด"})
        configDropdown("ลำดับความสำคัญ", "กำหนดรูปแบบคัดเลือกเป้าหมาย", "stealPriority", {"มูลค่า", "ความหายาก", "ใกล้ที่สุด"})
        item("ใช้ตัวกรองร่วมกับค้นหาไข่", "ชื่อไข่ ความแรร์ มูลค่าขั้นต่ำ ตั้งได้ที่เมนู ค้นหาไข่")
        configNote()
    elseif name == "วางไข่" then
        section("AUTO PLACE • ตั้งค่าการวางไข่", "เตรียมขั้นตอนวางไข่สำหรับระบบ ZIGZAG ของเรา")
        configToggle("วางไข่อัตโนมัติ", "ตั้งค่าวางไข่ที่ถือหรือที่เลือก", "autoPlace")
        configDropdown("เงื่อนไขการวางไข่", "เลือกว่าจะเริ่มวางเมื่อไร", "placeRule", {"เมื่อกลับฐาน", "หลังได้ไข่", "เฉพาะเมื่อสั่ง"})
        configDropdown("ลำดับการวางไข่", "เลือกลำดับเป้าหมาย", "placePriority", {"มูลค่า", "ความหายาก", "ตามชื่อ"})
        configNote()
    elseif name == "ฟักไข่" then
        section("AUTO HATCH • ตั้งค่าฟักไข่", "เตรียมกรองไข่ที่จะฟักและสัตว์เลี้ยงที่จะสวมใส่")
        configToggle("ฟักไข่อัตโนมัติ", "กำหนดระบบฟักไข่ไว้ก่อน", "autoHatch")
        configDropdown("ความหายากขั้นต่ำที่จะฟัก", "ระดับไข่ที่อนุญาต", "hatchMin", RARITIES)
        configToggle("ใส่สัตว์เลี้ยงดีที่สุด", "ตั้งค่าการสวมใส่", "autoEquip")
        configNote()
    elseif name == "ขาย / คลัง" then
        section("INVENTORY • ขายและคัดกรอง", "รวมเงื่อนไขการขายไข่และสัตว์เลี้ยง")
        configToggle("ขายอัตโนมัติ", "ตั้งค่าการขายไอเทมที่ผ่านตัวกรอง", "autoSell")
        configToggle("เก็บตัวกลายพันธุ์ไว้", "ไม่เลือกตัว Mutation เป็นเป้าหมายขาย", "keepMutated")
        item("ระบบคลังของ", "ยังไม่มีตัวอ่าน Inventory เฉพาะแมพนี้ จึงยังไม่แสดงของหรือสั่งขาย")
        configNote()
    elseif name == "Dr. Scramble" then
        section("DR. SCRAMBLE • โซนกิจกรรม", "แยกเมนูสำหรับห้องแล็บและกิจกรรมในแมพ")
        configToggle("แล็บอัตโนมัติ", "ตัวเลือกเตรียมการแลกของและรับรางวัล", "labAuto")
        item("รายการพัฒนาต่อ", "แลกของในแล็บ • รับรางวัล • ฟาร์มโดรน • บอสหุ่นรบ • ไข่รางวัล")
        configNote()
    elseif name == "เซิร์ฟเวอร์" then
        section("SERVER • ข้อมูลเซิร์ฟเวอร์", "ข้อมูลจริงจากเกม • ไม่มีการย้ายห้องอัตโนมัติ")
        item("Place ID", tostring(game.PlaceId))
        item("Job ID", tostring(game.JobId))
        item("ผู้เล่นในเซิร์ฟเวอร์", tostring(#Players:GetPlayers()) .. " คน")
        configDropdown("โหมดเลือกเซิร์ฟเวอร์", "ตั้งค่าล่วงหน้า", "hopMode", {"คนในห้องน้อย", "คนในห้องเยอะ", "สุ่ม"})
        configToggle("ย้ายเซิร์ฟเวอร์อัตโนมัติ", "ยังไม่เชื่อมกับ TeleportService", "autoHop")
        action("รีเฟรชข้อมูล", "อัปเดตผู้เล่นและเซิร์ฟเวอร์ปัจจุบัน", "รีเฟรช", function()
            setTab("เซิร์ฟเวอร์")
            status("อัปเดตข้อมูลแล้ว")
        end)
    elseif name == "ผู้เล่น" then
        section("PLAYER • สถานะตัวละคร", "อ่านข้อมูลเท่านั้น ไม่แก้ความเร็วและไม่วาร์ป")
        item("ผู้เล่น", player.DisplayName .. "  (@" .. player.Name .. ")", COLORS.purple)
        item("User ID", tostring(player.UserId))
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        item("สถานะ HP", humanoid and (math.floor(humanoid.Health) .. " / " .. math.floor(humanoid.MaxHealth)) or "กำลังโหลด")
        item("ตำแหน่งตัวละคร", (function()
            local v = playerPosition()
            return v and string.format("X %.0f / Y %.0f / Z %.0f", v.X, v.Y, v.Z) or "ยังไม่มีตำแหน่ง"
        end)())
        action("อัปเดตข้อมูล", "อ่านข้อมูลใหม่จากเกม", "รีเฟรช", function() setTab("ผู้เล่น") end)
    elseif name == "ตั้งค่า" then
        section("SETTINGS • ปรับแต่ง ZIGZAG", "ตั้งค่าเฉพาะเมนูของเรา ไม่แก้สคริปต์ของเกม")
        action("ภาพพื้นหลัง MANGA EYE", "เปิดหรือปิดรูปมังงะในหน้าต่าง", wallpaperEnabled and "ซ่อนภาพ" or "แสดงภาพ", function()
            wallpaperEnabled = not wallpaperEnabled
            wallpaper.Visible = wallpaperEnabled
            setTab("ตั้งค่า")
        end)
        action("หยุดไฮไลต์ทั้งหมด", "ลบไฮไลต์ที่ ZIGZAG สร้างไว้", "ล้างไฮไลต์", function()
            preferences.eggMarkers = false
            clearMarkers()
            setTab("ตั้งค่า")
            status("ล้างไฮไลต์แล้ว")
        end)
        action("รีเซ็ตตำแหน่งหน้าต่าง", "ย้ายหน้าต่างกลับกลางจอ", "จัดกลางจอ", function()
            panel.Position = UDim2.fromScale(0.5, 0.5)
            status("ย้ายหน้าต่างกลับกลางจอแล้ว")
        end)
        action("ย่อหน้าต่าง", "เก็บหน้าต่าง เหลือไอคอนดวงตา", "ย่อ", function() panel.Visible = false end)
        item("เวอร์ชัน", "ZIGZAG HUB • MANGA EYE • V4 • EGG COMMAND")
        item("หมายเหตุ", "การค้นหาอ่านได้เฉพาะวัตถุที่อยู่ใน Workspace ของเครื่อง และขึ้นอยู่กับโครงสร้างชื่อวัตถุของเกม")
    end
end

local TABS = {"หน้าแรก", "ค้นหาไข่", "ขโมยไข่", "วางไข่", "ฟักไข่", "ขาย / คลัง", "Dr. Scramble", "เซิร์ฟเวอร์", "ผู้เล่น", "ตั้งค่า"}
for index, name in ipairs(TABS) do
    local button = make("TextButton", sidebar, {
        Size = UDim2.new(1, -5, 0, 40), LayoutOrder = index,
        BackgroundColor3 = COLORS.panel, Text = name,
        TextColor3 = COLORS.muted, TextXAlignment = Enum.TextXAlignment.Left,
        Font = BOLD, TextSize = 12, BorderSizePixel = 0,
        AutoButtonColor = true, ZIndex = 23,
    })
    corner(button, 10)
    outline(button, COLORS.outline, 1, 0.67)
    make("UIPadding", button, { PaddingLeft = UDim.new(0, 12) })
    tabButtons[name] = button
    button.Activated:Connect(function() setTab(name) end)
end
setTab("หน้าแรก")

-- Pointer-specific dragging: moving one finger must not move another widget.
local function draggable(target, handle, onTap)
    local pressedInput = nil
    local startPointer = nil
    local startUDim = nil
    local hasMoved = false
    handle.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch and
           input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        pressedInput = input
        startPointer = Vector2.new(input.Position.X, input.Position.Y)
        startUDim = target.Position
        hasMoved = false
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End and pressedInput == input then
                pressedInput = nil
                if not hasMoved and onTap then onTap() end
            end
        end)
    end)
    UIS.InputChanged:Connect(function(input)
        if not pressedInput or not startPointer or not startUDim then return end
        if pressedInput.UserInputType == Enum.UserInputType.Touch then
            if input ~= pressedInput then return end
        elseif input.UserInputType ~= Enum.UserInputType.MouseMovement then
            return
        end
        local delta = Vector2.new(input.Position.X, input.Position.Y) - startPointer
        if delta.Magnitude < 10 and not hasMoved then return end
        hasMoved = true
        local camera = workspace.CurrentCamera
        local viewport = camera and camera.ViewportSize or Vector2.new(1000, 650)
        local size = target.AbsoluteSize
        local origin = Vector2.new(
            startUDim.X.Scale * viewport.X + startUDim.X.Offset,
            startUDim.Y.Scale * viewport.Y + startUDim.Y.Offset
        )
        -- Panel uses a 0.5/0.5 anchor, icon uses a 0/0.5 anchor.
        local anchor = target.AnchorPoint
        local topLeft = origin + delta - Vector2.new(size.X * anchor.X, size.Y * anchor.Y)
        local clamped = Vector2.new(
            math.clamp(topLeft.X, 0, math.max(0, viewport.X - size.X)),
            math.clamp(topLeft.Y, 0, math.max(0, viewport.Y - size.Y))
        )
        local newAnchor = clamped + Vector2.new(size.X * anchor.X, size.Y * anchor.Y)
        target.Position = UDim2.fromOffset(newAnchor.X, newAnchor.Y)
        if target == icon then
            badge.Position = UDim2.fromOffset(clamped.X + 3, clamped.Y + 67)
        end
    end)
end

draggable(icon, icon, function() panel.Visible = not panel.Visible end)
draggable(panel, header, nil)
minimize.Activated:Connect(function() panel.Visible = false end)
UIS.InputBegan:Connect(function(input, used)
    if not used and input.KeyCode == Enum.KeyCode.RightControl then
        panel.Visible = not panel.Visible
    end
end)

local function rescale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    local v = camera.ViewportSize
    scaler.Scale = math.min(1, math.max(0.47, math.min((v.X - 20)/620, (v.Y - 48)/400)))
end
rescale()
local camera = workspace.CurrentCamera
if camera then camera:GetPropertyChangedSignal("ViewportSize"):Connect(rescale) end

gui.Destroying:Connect(function()
    clearMarkers()
end)
print("[ZIGZAG HUB V4] Egg menus, workspace egg finder and configuration loaded. No external gameplay code executed.")
