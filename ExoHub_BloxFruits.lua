-- ╔═══════════════════════════════════╗
--   EXO HUB | BLOX FRUITS
--   discord.gg/6QzV9pTWs
-- ╚═══════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local lp = Players.LocalPlayer



-- ══════════════════════════════════════
--  MAIN GUI
-- ══════════════════════════════════════
if lp.PlayerGui:FindFirstChild("ExoBFGui") then
    lp.PlayerGui.ExoBFGui:Destroy()
end

local SG = Instance.new("ScreenGui")
SG.Name = "ExoBFGui"
SG.ResetOnSpawn = false
SG.DisplayOrder = 999
SG.IgnoreGuiInset = true
SG.Parent = lp.PlayerGui

local FULL_H = 420
local MINI_H = 46
local minimised = false
local currentTab = "farm"

local W = Instance.new("Frame")
W.Size = UDim2.new(0, 240, 0, FULL_H)
W.Position = UDim2.new(0, 20, 0.5, -(FULL_H/2))
W.BackgroundColor3 = Color3.fromRGB(6, 4, 16)
W.BorderSizePixel = 0
W.ClipsDescendants = true
W.Active = true
W.Draggable = true
W.Parent = SG
Instance.new("UICorner", W).CornerRadius = UDim.new(0, 14)

local wStroke = Instance.new("UIStroke")
wStroke.Color = Color3.fromRGB(0, 180, 255)
wStroke.Thickness = 1.5
wStroke.Transparency = 0.3
wStroke.Parent = W

local wGrad = Instance.new("UIGradient")
wGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 16, 28)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(6, 4, 16)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 2, 10)),
})
wGrad.Rotation = 135
wGrad.Parent = W

-- TITLE BAR
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1,0,0,46)
TB.BackgroundColor3 = Color3.fromRGB(4,10,20)
TB.BorderSizePixel = 0
TB.ZIndex = 2
TB.Parent = W
Instance.new("UICorner",TB).CornerRadius = UDim.new(0,14)
local TBFix = Instance.new("Frame")
TBFix.Size = UDim2.new(1,0,0.5,0)
TBFix.Position = UDim2.new(0,0,0.5,0)
TBFix.BackgroundColor3 = Color3.fromRGB(4,10,20)
TBFix.BorderSizePixel = 0
TBFix.ZIndex = 2
TBFix.Parent = TB

-- shimmer divider
local shim = Instance.new("Frame")
shim.Size = UDim2.new(1,0,0,2)
shim.Position = UDim2.new(0,0,1,-2)
shim.BorderSizePixel = 0
shim.ZIndex = 3
shim.Parent = TB
local shimGrad = Instance.new("UIGradient")
shimGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0,180,255)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0,220,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
})
shimGrad.Parent = shim
task.spawn(function()
    local t = 0
    while SG.Parent do
        t += 0.025
        shimGrad.Offset = Vector2.new(math.sin(t)*0.8, 0)
        task.wait(0.03)
    end
end)

local iconBg = Instance.new("Frame")
iconBg.Size = UDim2.new(0,30,0,30)
iconBg.Position = UDim2.new(0,10,0.5,-15)
iconBg.BackgroundColor3 = Color3.fromRGB(0,180,255)
iconBg.BackgroundTransparency = 0.5
iconBg.BorderSizePixel = 0
iconBg.ZIndex = 3
iconBg.Parent = TB
Instance.new("UICorner",iconBg).CornerRadius = UDim.new(0,8)
local iconLbl = Instance.new("TextLabel")
iconLbl.Size = UDim2.new(1,0,1,0)
iconLbl.BackgroundTransparency = 1
iconLbl.Text = "🍎"
iconLbl.TextSize = 16
iconLbl.Font = Enum.Font.GothamBold
iconLbl.ZIndex = 4
iconLbl.Parent = iconBg

local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1,-110,0,18)
titleLbl.Position = UDim2.new(0,48,0,6)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "BLOX FRUITS"
titleLbl.Font = Enum.Font.GothamBlack
titleLbl.TextSize = 14
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.ZIndex = 3
titleLbl.Parent = TB
local tGrad = Instance.new("UIGradient")
tGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,220,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,180,255)),
})
tGrad.Rotation = 90
tGrad.Parent = titleLbl

local subLbl = Instance.new("TextLabel")
subLbl.Size = UDim2.new(1,-110,0,13)
subLbl.Position = UDim2.new(0,48,0,26)
subLbl.BackgroundTransparency = 1
subLbl.Text = "EXO HUB  •  discord.gg/6QzV9pTWs"
subLbl.Font = Enum.Font.Gotham
subLbl.TextSize = 8
subLbl.TextColor3 = Color3.fromRGB(0,100,160)
subLbl.TextXAlignment = Enum.TextXAlignment.Left
subLbl.ZIndex = 3
subLbl.Parent = TB

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,24,0,24)
minBtn.Position = UDim2.new(1,-58,0.5,-12)
minBtn.BackgroundColor3 = Color3.fromRGB(6,14,24)
minBtn.Text = "─"
minBtn.TextColor3 = Color3.fromRGB(0,180,255)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 12
minBtn.BorderSizePixel = 0
minBtn.ZIndex = 4
minBtn.Parent = TB
Instance.new("UICorner",minBtn).CornerRadius = UDim.new(0,6)
Instance.new("UIStroke",minBtn).Color = Color3.fromRGB(0,120,180)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,24,0,24)
closeBtn.Position = UDim2.new(1,-30,0.5,-12)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,40,60)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 11
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 4
closeBtn.Parent = TB
Instance.new("UICorner",closeBtn).CornerRadius = UDim.new(0,6)

closeBtn.MouseButton1Click:Connect(function()
    STATE.autoFarm = false
    STATE.autoQuest = false
    STATE.autoEat = false
    STATE.chestFarm = false
    STATE.fruitNotify = false
    SG:Destroy()
end)

minBtn.MouseButton1Click:Connect(function()
    minimised = not minimised
    minBtn.Text = minimised and "+" or "─"
    TweenService:Create(W, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 240, 0, minimised and MINI_H or FULL_H)
    }):Play()
end)

-- ══════════════════════════════════════
--  TABS
-- ══════════════════════════════════════
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1,-20,0,32)
tabBar.Position = UDim2.new(0,10,0,54)
tabBar.BackgroundColor3 = Color3.fromRGB(4,10,20)
tabBar.BorderSizePixel = 0
tabBar.ZIndex = 2
tabBar.Parent = W
Instance.new("UICorner",tabBar).CornerRadius = UDim.new(0,8)
Instance.new("UIStroke",tabBar).Color = Color3.fromRGB(0,80,120)

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabBar

local TABS = {
    { key="farm",     label="⚔️ Farm" },
    { key="teleport", label="🌍 TP" },
    { key="utils",    label="🔧 Utils" },
}

local tabBtns = {}
local tabContents = {}

local function switchTab(key)
    currentTab = key
    for k, btn in pairs(tabBtns) do
        if k == key then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0,180,255), TextColor3 = Color3.fromRGB(0,0,0)}):Play()
        else
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(4,10,20), TextColor3 = Color3.fromRGB(0,120,180)}):Play()
        end
    end
    for k, frame in pairs(tabContents) do
        frame.Visible = (k == key)
    end
end

for i, tab in ipairs(TABS) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1/#TABS, 0, 1, 0)
    btn.BackgroundColor3 = i==1 and Color3.fromRGB(0,180,255) or Color3.fromRGB(4,10,20)
    btn.Text = tab.label
    btn.TextColor3 = i==1 and Color3.fromRGB(0,0,0) or Color3.fromRGB(0,120,180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.BorderSizePixel = 0
    btn.ZIndex = 3
    btn.LayoutOrder = i
    btn.Parent = tabBar
    if i==1 then Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8) end
    if i==#TABS then Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8) end
    tabBtns[tab.key] = btn
    btn.MouseButton1Click:Connect(function() switchTab(tab.key) end)
end

-- content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1,-20,1,-100)
contentArea.Position = UDim2.new(0,10,0,94)
contentArea.BackgroundTransparency = 1
contentArea.BorderSizePixel = 0
contentArea.ZIndex = 2
contentArea.Parent = W

local function makeContent(key)
    local f = Instance.new("ScrollingFrame")
    f.Size = UDim2.new(1,0,1,0)
    f.BackgroundTransparency = 1
    f.BorderSizePixel = 0
    f.ScrollBarThickness = 2
    f.ScrollBarImageColor3 = Color3.fromRGB(0,180,255)
    f.CanvasSize = UDim2.new(0,0,0,0)
    f.AutomaticCanvasSize = Enum.AutomaticSize.Y
    f.Visible = (key == "farm")
    f.ZIndex = 2
    f.Parent = contentArea
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0,6)
    layout.Parent = f
    tabContents[key] = f
    return f
end

local farmFrame    = makeContent("farm")
local tpFrame      = makeContent("teleport")
local utilsFrame   = makeContent("utils")

-- ══════════════════════════════════════
--  TOGGLE BUILDER
-- ══════════════════════════════════════
local function makeToggle(parent, labelTxt, stateKey, onEnable, onDisable, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1,0,0,44)
    row.BackgroundColor3 = Color3.fromRGB(4,12,22)
    row.BorderSizePixel = 0
    row.ZIndex = 3
    row.LayoutOrder = order or 1
    row.Parent = parent
    Instance.new("UICorner",row).CornerRadius = UDim.new(0,10)
    local rs = Instance.new("UIStroke")
    rs.Color = Color3.fromRGB(0,80,120)
    rs.Thickness = 1
    rs.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,-54,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelTxt
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.TextColor3 = Color3.fromRGB(140,200,220)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 4
    lbl.Parent = row

    local sw = Instance.new("Frame")
    sw.Size = UDim2.new(0,36,0,20)
    sw.AnchorPoint = Vector2.new(1,0.5)
    sw.Position = UDim2.new(1,-8,0.5,0)
    sw.BackgroundColor3 = Color3.fromRGB(20,8,40)
    sw.BorderSizePixel = 0
    sw.ZIndex = 4
    sw.Parent = row
    Instance.new("UICorner",sw).CornerRadius = UDim.new(1,0)

    local ball = Instance.new("Frame")
    ball.Size = UDim2.new(0,14,0,14)
    ball.AnchorPoint = Vector2.new(0.5,0.5)
    ball.Position = UDim2.new(0.27,0,0.5,0)
    ball.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ball.BorderSizePixel = 0
    ball.ZIndex = 5
    ball.Parent = sw
    Instance.new("UICorner",ball).CornerRadius = UDim.new(1,0)

    local clickArea = Instance.new("TextButton")
    clickArea.Size = UDim2.new(1,0,1,0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 6
    clickArea.Parent = row

    local ti = TweenInfo.new(0.18, Enum.EasingStyle.Quart)
    clickArea.MouseButton1Click:Connect(function()
        STATE[stateKey] = not STATE[stateKey]
        local on = STATE[stateKey]
        TweenService:Create(sw, ti, {BackgroundColor3 = on and Color3.fromRGB(0,180,255) or Color3.fromRGB(20,8,40)}):Play()
        TweenService:Create(ball, ti, {Position = on and UDim2.new(0.75,0,0.5,0) or UDim2.new(0.27,0,0.5,0)}):Play()
        TweenService:Create(rs, ti, {Color = on and Color3.fromRGB(0,180,255) or Color3.fromRGB(0,80,120)}):Play()
        if on then onEnable() else onDisable() end
    end)
end

-- ══════════════════════════════════════
--  FARM TAB
-- ══════════════════════════════════════
makeToggle(farmFrame, "⚔️  Auto Farm",        "autoFarm",    startAutoFarm,    stopAutoFarm,    1)
makeToggle(farmFrame, "📋  Auto Quest",        "autoQuest",   startAutoQuest,   stopAutoQuest,   2)
makeToggle(farmFrame, "💰  Chest Farm",        "chestFarm",   startChestFarm,   stopChestFarm,   3)
makeToggle(farmFrame, "🍎  Auto Eat Fruit",    "autoEat",     startAutoEat,     stopAutoEat,     4)
makeToggle(farmFrame, "🔔  Fruit Notifier",    "fruitNotify", startFruitNotifier, stopFruitNotifier, 5)

-- fruit notifier alert box
local notifTemplate = Instance.new("Frame")
notifTemplate.Name = "NotifFrame"
notifTemplate.Size = UDim2.new(0,240,0,44)
notifTemplate.AnchorPoint = Vector2.new(0.5,1)
notifTemplate.Position = UDim2.new(0.5,0,1,-20)
notifTemplate.BackgroundColor3 = Color3.fromRGB(0,180,255)
notifTemplate.BackgroundTransparency = 1
notifTemplate.BorderSizePixel = 0
notifTemplate.ZIndex = 99
notifTemplate.Visible = false
notifTemplate.Parent = SG
Instance.new("UICorner",notifTemplate).CornerRadius = UDim.new(0,10)
local notifLbl = Instance.new("TextLabel")
notifLbl.Size = UDim2.new(1,-10,1,0)
notifLbl.Position = UDim2.new(0,5,0,0)
notifLbl.BackgroundTransparency = 1
notifLbl.Text = "🍎 Fruit Spawned!"
notifLbl.Font = Enum.Font.GothamBold
notifLbl.TextSize = 13
notifLbl.TextColor3 = Color3.fromRGB(0,0,0)
notifLbl.ZIndex = 100
notifLbl.Parent = notifTemplate

-- ══════════════════════════════════════
--  TELEPORT TAB
-- ══════════════════════════════════════
for i, island in ipairs(ISLANDS) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,40)
    btn.BackgroundColor3 = Color3.fromRGB(4,12,22)
    btn.Text = island.name
    btn.TextColor3 = Color3.fromRGB(140,200,220)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    btn.ZIndex = 3
    btn.LayoutOrder = i
    btn.Parent = tpFrame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,10)
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(0,80,120)
    bs.Thickness = 1
    bs.Parent = btn

    btn.MouseButton1Click:Connect(function()
        tpTo(island.pos)
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0,180,255)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(0,0,0)}):Play()
        task.delay(0.5, function()
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(4,12,22)}):Play()
            TweenService:Create(btn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(140,200,220)}):Play()
        end)
    end)
end

-- ══════════════════════════════════════
--  UTILS TAB
-- ══════════════════════════════════════
-- stats display
local statsFrame = Instance.new("Frame")
statsFrame.Size = UDim2.new(1,0,0,80)
statsFrame.BackgroundColor3 = Color3.fromRGB(4,12,22)
statsFrame.BorderSizePixel = 0
statsFrame.ZIndex = 3
statsFrame.LayoutOrder = 1
statsFrame.Parent = utilsFrame
Instance.new("UICorner",statsFrame).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",statsFrame).Color = Color3.fromRGB(0,80,120)

local statsTitle = Instance.new("TextLabel")
statsTitle.Size = UDim2.new(1,0,0,20)
statsTitle.Position = UDim2.new(0,0,0,8)
statsTitle.BackgroundTransparency = 1
statsTitle.Text = "📊  STATS"
statsTitle.Font = Enum.Font.GothamBold
statsTitle.TextSize = 11
statsTitle.TextColor3 = Color3.fromRGB(0,180,255)
statsTitle.ZIndex = 4
statsTitle.Parent = statsFrame

local statsInfo = Instance.new("TextLabel")
statsInfo.Size = UDim2.new(1,-20,0,44)
statsInfo.Position = UDim2.new(0,10,0,28)
statsInfo.BackgroundTransparency = 1
statsInfo.Text = "Loading..."
statsInfo.Font = Enum.Font.GothamMedium
statsInfo.TextSize = 11
statsInfo.TextColor3 = Color3.fromRGB(100,160,200)
statsInfo.TextXAlignment = Enum.TextXAlignment.Left
statsInfo.TextYAlignment = Enum.TextYAlignment.Top
statsInfo.ZIndex = 4
statsInfo.Parent = statsFrame

-- update stats
task.spawn(function()
    while SG.Parent do
        pcall(function()
            local char = lp.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local ls = lp:FindFirstChild("leaderstats")
            local beli = ls and (ls:FindFirstChild("Beli") or ls:FindFirstChild("Money") or ls:FindFirstChild("Gold"))
            local level = ls and (ls:FindFirstChild("Level") or ls:FindFirstChild("Lvl"))
            local hp = hum and math.floor(hum.Health) or 0
            local maxhp = hum and math.floor(hum.MaxHealth) or 0
            statsInfo.Text = string.format(
                "❤️ HP: %d / %d\n💰 Beli: %s\n⭐ Level: %s",
                hp, maxhp,
                beli and tostring(beli.Value) or "N/A",
                level and tostring(level.Value) or "N/A"
            )
        end)
        task.wait(1)
    end
end)

-- rejoin btn
local rejoinBtn = Instance.new("TextButton")
rejoinBtn.Size = UDim2.new(1,0,0,40)
rejoinBtn.BackgroundColor3 = Color3.fromRGB(4,12,22)
rejoinBtn.Text = "🔄  Rejoin Server"
rejoinBtn.TextColor3 = Color3.fromRGB(140,200,220)
rejoinBtn.Font = Enum.Font.GothamBold
rejoinBtn.TextSize = 12
rejoinBtn.BorderSizePixel = 0
rejoinBtn.ZIndex = 3
rejoinBtn.LayoutOrder = 2
rejoinBtn.Parent = utilsFrame
Instance.new("UICorner",rejoinBtn).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",rejoinBtn).Color = Color3.fromRGB(0,80,120)

rejoinBtn.MouseButton1Click:Connect(function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(game.PlaceId, lp)
end)

-- credits
local credits = Instance.new("Frame")
credits.Size = UDim2.new(1,0,0,40)
credits.BackgroundColor3 = Color3.fromRGB(4,12,22)
credits.BorderSizePixel = 0
credits.ZIndex = 3
credits.LayoutOrder = 3
credits.Parent = utilsFrame
Instance.new("UICorner",credits).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",credits).Color = Color3.fromRGB(0,80,120)
local credLbl = Instance.new("TextLabel")
credLbl.Size = UDim2.new(1,0,1,0)
credLbl.BackgroundTransparency = 1
credLbl.Text = "EXO HUB  •  discord.gg/6QzV9pTWs"
credLbl.Font = Enum.Font.GothamMedium
credLbl.TextSize = 10
credLbl.TextColor3 = Color3.fromRGB(0,100,150)
credLbl.ZIndex = 4
credLbl.Parent = credits

-- ══════════════════════════════════════
--  PULSE ANIMATION
-- ══════════════════════════════════════
local t = 0
RunService.Heartbeat:Connect(function(dt)
    if not SG.Parent then return end
    t += dt
    local pulse = (math.sin(t*2.5)+1)/2
    local anyOn = STATE.autoFarm or STATE.autoQuest or STATE.chestFarm or STATE.autoEat or STATE.fruitNotify
    wStroke.Transparency = anyOn and 0.05*pulse or 0.3+pulse*0.3
    wStroke.Thickness = anyOn and 1.5+pulse*0.8 or 1.5
    tGrad.Rotation = (t*20)%360
end)

-- ══════════════════════════════════════
--  OPEN ANIMATION
-- ══════════════════════════════════════
W.Position = UDim2.new(-0.5, 0, 0.5, -(FULL_H/2))
TweenService:Create(W, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0, 20, 0.5, -(FULL_H/2))
}):Play()

print("[EXO HUB] Blox Fruits loaded | discord.gg/6QzV9pTWs")
