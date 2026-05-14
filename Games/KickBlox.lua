-- ==========================================
-- [ LIBRARY & DATABASE LOADER (LUXY CORE) ]
-- ==========================================
local LibraryURL = "https://raw.githubusercontent.com/Omnie7/Luxy-Core/main/Library/LuxyV2.luau"
local DataURL    = "https://raw.githubusercontent.com/Omnie7/Luxy-Core/main/Data/KickBlox.luau"

local Luxy = loadstring(game:HttpGet(LibraryURL))()
local DB   = loadstring(game:HttpGet(DataURL))()

-- ==========================================
-- [ UI INITIALIZATION ]
-- ==========================================
local Win      = Luxy.CreateMain("Luxy HUB")
local Tab1     = Win:CreateTab("Main", Luxy.GetIcon and Luxy.GetIcon("home") or "rbxassetid://10723407389")
local TabShop  = Win:CreateTab("Shop", Luxy.GetIcon and Luxy.GetIcon("shoppingcart") or "rbxassetid://10734952479")
-- ==========================================
-- [ ENVIRONMENT & VARIABLES (KILL-SWITCH) ]
-- ==========================================
local _E = getgenv()

if _E.LuxyHub_Unload then
    pcall(_E.LuxyHub_Unload)
end

_E.HubRunning       = true
_E.AFarm            = false
_E.TBrainrot        = {"Any"}
_E.TRarity          = {"Any"}
_E.TMutation        = {"Any"}
_E.ATrain           = false
_E.A2xTrain         = false
_E.ACollect         = false
_E.CollectDelay     = 60
_E.AUpgrade         = false
_E.TUpgrade         = {"Any"}
_E.MaxUpLevel       = 1
_E.PlotBrainrotList = {"Any"}
_E.ARebirth         = false
_E.APlotUpgrade     = false
_E.APlaceBest       = false
_E.IsPlacingPet     = false

-- Shop
_E.ABuySpeed        = false
_E.ABuyWeights      = false
_E.ABuyBest         = false
_E.TTargetWeight    = "None"

-- Sell
_E.ASellAll         = false
_E.ASellFilter      = false
_E.SellDelay        = 20
_E.TSSellBrainrot   = {"Any"}
_E.TSSellRarity     = {"Any"}
_E.TSSellMutation   = {"Any"}

local Plrs = game:GetService("Players")
local WS   = game:GetService("Workspace")
local RS   = game:GetService("ReplicatedStorage")
local LP   = Plrs.LocalPlayer

_E.LuxyHub_Unload = function()
    _E.HubRunning    = false
    _E.ASellAll      = false
    _E.ASellFilter   = false
    _E.AFarm         = false
    _E.ATrain        = false
    _E.A2xTrain      = false
    _E.ACollect      = false
    _E.ABuySpeed     = false
    _E.ABuyWeights   = false
    _E.ABuyBest      = false
    _E.ARebirth      = false
    _E.APlotUpgrade  = false
    _E.APlaceBest    = false

    if LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.MaxSlopeAngle = 45
    end
end

-- ==========================================
-- [ UTILITIES ]
-- ==========================================
local function isMatch(targetList, currentVal)
    if #targetList == 0 or table.find(targetList, "Any") then
        return true
    end
    return table.find(targetList, currentVal) ~= nil
end

local function GetMyPlot()
    local success, PlotService = pcall(function()
        return require(RS:WaitForChild("Modules"):WaitForChild("ServicesLoader"):WaitForChild("ClientPlotService"))
    end)
    if success and PlotService and PlotService.Model then
        return PlotService.Model
    end

    local plots = WS:FindFirstChild("Plots")
    if plots then
        for _, plot in ipairs(plots:GetChildren()) do
            local ownerAttr = plot:GetAttribute("Owner")
            if ownerAttr == LP.Name or ownerAttr == LP.DisplayName then
                return plot
            end
        end
    end
    return nil
end

local function GetMutation(petModel)
    for _, child in ipairs(petModel:GetChildren()) do
        if DB.MutationOptions and table.find(DB.MutationOptions, child.Name)
            and child.Name ~= "None" and child.Name ~= "Any" then
            return child.Name
        end
    end
    return "None"
end

-- ==========================================
-- [ REMOTES ]
-- ==========================================
local NetDir = RS:FindFirstChild("Shared")
if NetDir then NetDir = NetDir:FindFirstChild("Packages") end
if NetDir then NetDir = NetDir:FindFirstChild("Network") end

local KkEvt          = NetDir and NetDir:FindFirstChild("rev_KickEvent") or RS:FindFirstChild("rev_KickEvent", true)
local BCollectEvt    = NetDir and NetDir:FindFirstChild("rev_B_Collect") or RS:FindFirstChild("rev_B_Collect", true)
local BUpgradeEvt    = NetDir and NetDir:FindFirstChild("rev_B_Upgrade") or RS:FindFirstChild("rev_B_Upgrade", true)
local SpeedUpEvt     = NetDir and NetDir:FindFirstChild("rev_SPEED_UPGRADE") or RS:FindFirstChild("rev_SPEED_UPGRADE", true)
local ShopBuyEvt     = NetDir and NetDir:FindFirstChild("rev_Shop_Buy") or RS:FindFirstChild("rev_Shop_Buy", true)
local WeightEquipEvt = NetDir and NetDir:FindFirstChild("rev_WeightEquip") or RS:FindFirstChild("rev_WeightEquip", true)
local SellAllEvt     = NetDir and NetDir:FindFirstChild("ref_B_SellAll") or RS:FindFirstChild("ref_B_SellAll", true)
local SellSingleEvt  = NetDir and NetDir:FindFirstChild("ref_B_Sell") or RS:FindFirstChild("ref_B_Sell", true)
local RebirthEvt     = NetDir and NetDir:FindFirstChild("rev_RebirthRequest") or RS:FindFirstChild("rev_RebirthRequest", true)
local PlotUpgradeEvt = NetDir and NetDir:FindFirstChild("rev_bs_upgrade") or RS:FindFirstChild("rev_bs_upgrade", true)
local SInteractEvt   = NetDir and NetDir:FindFirstChild("rev_S_Interact") or RS:FindFirstChild("rev_S_Interact", true)

local weightsFolder  = RS:FindFirstChild("Objects") and RS.Objects:FindFirstChild("WeightModels")

-- ==========================================
-- [ SMART PARSERS & JURI AI DEWA JANGKA PANJANG ]
-- ==========================================
local WeightsDataObj = RS:FindFirstChild("WeightsData", true)
local WeightsData    = nil
pcall(function()
    if WeightsDataObj then
        WeightsData = require(WeightsDataObj)
    end
end)

-- BIKIN DATABASE ANTI-TYPO
local EntitiesDataCache = nil
local NormalizedDB = {}
pcall(function()
    EntitiesDataCache = require(RS.Shared.Data.EntitiesData)
    if EntitiesDataCache and EntitiesDataCache.Brainrots then
        for k, v in pairs(EntitiesDataCache.Brainrots) do
            local safeKey = string.lower(string.gsub(k, "[%s%p]", "")) 
            NormalizedDB[safeKey] = v
        end
    end
end)

local function ParseWallet(strVal)
    if not strVal then return 0 end
    if type(strVal) == "number" then return strVal end

    local cleanStr = string.gsub(tostring(strVal), "[,%s%$]", "")
    local numStr, suffix = string.match(cleanStr, "^([%d%.]+)(%a*)$")
    if not numStr then
        return tonumber(cleanStr) or 0
    end

    local num = tonumber(numStr) or 0
    local suffixes = {K=3, M=6, B=9, T=12, Q=15, Qi=18, S=21, Sp=24, O=27, N=30, D=33}
    if suffix and suffix ~= "" and suffixes[suffix] then
        return num * (10 ^ suffixes[suffix])
    end
    return num
end

local function GetMyMoney()
    local coins = LP:FindFirstChild("leaderstats") and LP.leaderstats:FindFirstChild("Coins")
    if coins then
        return ParseWallet(coins.Value)
    end
    return 0
end

local function GetWeightPrice(weightName)
    if WeightsData and WeightsData.Weights and WeightsData.Weights[weightName] then
        local cost = WeightsData.Weights[weightName].Cost
        if cost then
            local base = cost.first or 0
            local exp  = cost.second or 0
            return base * (10 ^ exp)
        end
    end
    return math.huge
end

local SortedWeightsCache = nil
local function GetSortedWeights()
    if SortedWeightsCache then
        return SortedWeightsCache
    end
    local list = {}
    if weightsFolder then
        for _, w in ipairs(weightsFolder:GetChildren()) do
            table.insert(list, {name = w.Name, price = GetWeightPrice(w.Name)})
        end
        table.sort(list, function(a, b) return a.price < b.price end)
        SortedWeightsCache = list
    end
    return list
end

local function GetMyKickPower()
    local pGui = LP:FindFirstChild("PlayerGui")
    if pGui then
        for _, v in ipairs(pGui:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent and v.Parent.Name == "KickLevel"
                and type(v.Text) == "string" then
                local cleanTxt = v.Text:gsub("<[^>]+>", ""):gsub(",", "")
                local match = cleanTxt:match("([%d%.]+[a-zA-Z]*)")
                if match then
                    return ParseWallet(match)
                end
            end
        end
    end
    return 0
end

local function GetRebirthCost()
    local pGui = LP:FindFirstChild("PlayerGui")
    if pGui then
        for _, desc in ipairs(pGui:GetDescendants()) do
            if desc:IsA("TextLabel") and type(desc.Text) == "string" then
                local cleanText = desc.Text:gsub("<[^>]+>", ""):gsub(",", "")
                local reqStr = cleanText:match("/%s*([%d%.]+[a-zA-Z]*)%s*Kick")
                if reqStr then
                    return ParseWallet(reqStr)
                end
            end
        end
    end
    return math.huge
end

-- DAFTAR MUTASI RESMI DAN PENGALINYA (SISTEM KASTA YANG ADIL, BUKAN PUKUL RATA 1000x)
local KnownMutations = {
    "Golden", "Diamond", "Plasma", "Radioactive", "Molten", "Void", 
    "Shadow", "Electrified", "Rainbow", "Virus", "Wet", "Alien", "Bacon", "Enchanted"
}

local MutationMultipliers = {
    Golden = 1.5,
    Diamond = 2,
    Plasma = 3,
    Radioactive = 4,
    Molten = 5,
    Void = 6,
    Shadow = 7,
    Electrified = 8,
    Rainbow = 10,
    Virus = 12,
    Wet = 15,
    Alien = 20,
    Bacon = 25,
    Enchanted = 30
}

-- MATA LASIK JURI AI YANG 100% AMAN BUAT JANGKA PANJANG (AFK)
local function GetBrainrotScore(petName, mutation)
    local safeName = string.lower(string.gsub(petName, "[%s%p]", ""))
    local petData = NormalizedDB[safeName]
    
    local baseScore = 1
    if petData then
        local rawCPS = petData.CPS
        if type(rawCPS) == "table" then
            if rawCPS.first and rawCPS.second then
                baseScore = rawCPS.first * (10 ^ rawCPS.second)
            else
                baseScore = tonumber(rawCPS.Value) or tonumber(rawCPS[1]) or tonumber(rawCPS.Base) or 1
            end
        else
            baseScore = tonumber(rawCPS) or 1
        end
    end
    
    local multi = 1
    if mutation and mutation ~= "None" and mutation ~= "" then
        -- Pake sistem kasta, kalau kaga ada di daftar, kita kasih 1.5 sebagai bonus minimal
        multi = MutationMultipliers[mutation] or 1.5 
    end
    
    return baseScore * multi
end


-- ==========================================
-- [ TAB: MAIN - FARMING & TRAIN ]
-- ==========================================
Tab1:CreateSection("Farming")
Tab1:CreateDropdownSearch("Filter Brainrot", DB.BrainrotOptions, true, function(Val) _E.TBrainrot = Val end)
Tab1:CreateDropdownSearch("Filter Rarity", DB.RarityOptions, true, function(Val) _E.TRarity = Val end)
Tab1:CreateDropdownSearch("Filter Mutation", DB.MutationOptions, true, function(Val) _E.TMutation = Val end)

Tab1:CreateToggle("Auto Kick [Perfect]", false, function(Val)
    _E.AFarm = Val
    if not _E.AFarm and LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.MaxSlopeAngle = 45
    end

    if _E.AFarm then
        task.spawn(function()
            while _E.HubRunning and _E.AFarm do
                task.wait(0.1)
                local chr = LP.Character
                if not chr then continue end

                local hrp = chr:FindFirstChild("HumanoidRootPart")
                local hum = chr:FindFirstChild("Humanoid")
                local cam = WS.CurrentCamera
                if not hrp or not hum or hum.Health <= 0 then continue end

                local krz = WS:FindFirstChild("Areas")
                if krz then krz = krz:FindFirstChild("KickReady") end
                if not krz or cam.CameraSubject ~= hum then continue end

                local wvs = WS:FindFirstChild("Waves")
                local wOn = wvs and #wvs:GetChildren() > 0
                local pGui = LP:FindFirstChild("PlayerGui")
                local hud = pGui and pGui:FindFirstChild("HUD")
                local kickBtn = hud and hud:FindFirstChild("KickButton")

                if wOn then
                    local attr = LP:GetAttribute("InGame") or ""
                    local sData = string.split(attr, ",")
                    local cBrainrot = sData[1] or "Unknown"
                    local cMutation  = sData[2] or "None"
                    local cRarity = DB.RarityMap and DB.RarityMap[cBrainrot] or "Unknown"

                    local isTrash = true
                    if isMatch(_E.TBrainrot, cBrainrot)
                        and isMatch(_E.TRarity, cRarity)
                        and isMatch(_E.TMutation, cMutation) then
                        isTrash = false
                    end

                    if isTrash then
                        cam.CameraType = Enum.CameraType.Scriptable
                        cam.CFrame = krz.CFrame * CFrame.new(0, 15, -25)
                        cam.CFrame = CFrame.lookAt(cam.CFrame.Position, krz.Position)
                        hum.Health = 0
                        local newChar = LP.CharacterAdded:Wait()
                        local newHrp = newChar:WaitForChild("HumanoidRootPart", 5)
                        local newHum = newChar:WaitForChild("Humanoid", 5)
                        if newHrp and newHum then
                            newHrp.CFrame = krz.CFrame * CFrame.new(0, 3, 0)
                            task.wait(0.2)
                            cam.CameraType = Enum.CameraType.Custom
                            cam.CameraSubject = newHum
                        end
                    else
                        hum.WalkSpeed = 100
                        hum.MaxSlopeAngle = 89
                        local diff = Vector3.new(hrp.Position.X, 0, hrp.Position.Z)
                            - Vector3.new(krz.Position.X, 0, krz.Position.Z)
                        if diff.Magnitude > 5 then
                            hum:MoveTo(krz.Position)
                        else
                            hum:MoveTo(hrp.Position)
                        end
                    end
                else
                    hum.MaxSlopeAngle = 45
                    local diff = Vector3.new(hrp.Position.X, 0, hrp.Position.Z)
                        - Vector3.new(krz.Position.X, 0, krz.Position.Z)
                    if diff.Magnitude > 15 then
                        hrp.CFrame = krz.CFrame * CFrame.new(0, 3, 0)
                        task.wait(0.5)
                    else
                        if kickBtn and kickBtn.Visible and KkEvt then
                            pcall(function()
                                KkEvt:FireServer(0.999099329113793, 1)
                            end)
                            task.wait(0.5)
                        end
                    end
                end
            end
        end)
    end
end)

Tab1:CreateSection("Progression")
Tab1:CreateToggle("Auto Train", false, function(Val) _E.ATrain = Val end)
Tab1:CreateToggle("Auto Click 2x Train", false, function(Val) _E.A2xTrain = Val end)
Tab1:CreateToggle("Auto Rebirth (Smart)", false, function(Val) _E.ARebirth = Val end)

Tab1:CreateSection("Collect Cash")
Tab1:CreateToggle("Auto Collect Cash", false, function(Val) _E.ACollect = Val end)
Tab1:CreateSlider("Claim Delay (Seconds)", 1, 600, 60, function(Val) _E.CollectDelay = Val end)

Tab1:CreateSection("Auto Place Brainrot")
Tab1:CreateToggle("Auto Place Best Brainrot", false, function(Val) _E.APlaceBest = Val end)

Tab1:CreateSection("Upgrade Brainrot")
local UpgradeDropdown = Tab1:CreateDropdownSearch(
    "Target Upgrade Brainrot",
    _E.PlotBrainrotList,
    true,
    function(Val) _E.TUpgrade = Val end
)

Tab1:CreateButton("Refresh Plot Brainrot List", function()
    local myPlot = GetMyPlot()
    local newList = {"Any"}
    local foundPets = {}

    if myPlot and myPlot:FindFirstChild("Slots") then
        for _, slot in ipairs(myPlot.Slots:GetChildren()) do
            local placedPart = slot:FindFirstChild("PlacedPart")
            if placedPart then
                for _, pet in ipairs(placedPart:GetChildren()) do
                    if pet:IsA("Model") and not pet.Name:match("Hitbox") then
                        local mut = GetMutation(pet)
                        local displayName = string.format("%s [%s]", pet.Name, mut)
                        if not foundPets[displayName] then
                            foundPets[displayName] = true
                            table.insert(newList, displayName)
                        end
                    end
                end
            end
        end
    end
    _E.PlotBrainrotList = newList
    pcall(function()
        if UpgradeDropdown and UpgradeDropdown.Refresh then
            UpgradeDropdown:Refresh(_E.PlotBrainrotList)
        end
        if UpgradeDropdown and UpgradeDropdown.SetOptions then
            UpgradeDropdown:SetOptions(_E.PlotBrainrotList)
        end
    end)
end)

Tab1:CreateSlider("Upgrade Times (Amount)", 1, 100, 1, function(Val) _E.MaxUpLevel = Val end)

Tab1:CreateButton("Start Auto Upgrade", function()
    if not BUpgradeEvt then return end
    local myPlot = GetMyPlot()
    if not myPlot then return end
    local targetSlots = {}

    if myPlot:FindFirstChild("Slots") then
        for _, slot in ipairs(myPlot.Slots:GetChildren()) do
            local placedPart = slot:FindFirstChild("PlacedPart")
            if placedPart then
                local petModel
                for _, p in ipairs(placedPart:GetChildren()) do
                    if p:IsA("Model") and not p.Name:match("Hitbox") then
                        petModel = p
                        break
                    end
                end
                if petModel then
                    local currentMut = GetMutation(petModel)
                    local displayName = string.format("%s [%s]", petModel.Name, currentMut)
                    local isMatch = false

                    if type(_E.TUpgrade) == "table" then
                        if table.find(_E.TUpgrade, "Any") or #_E.TUpgrade == 0 then
                            isMatch = true
                        elseif table.find(_E.TUpgrade, displayName) then
                            isMatch = true
                        end
                    elseif type(_E.TUpgrade) == "string" then
                        if _E.TUpgrade == "Any" or _E.TUpgrade == displayName then
                            isMatch = true
                        end
                    end

                    if isMatch then
                        local slotNum = tonumber(string.match(slot.Name, "%d+"))
                        if slotNum then
                            table.insert(targetSlots, slotNum)
                        end
                    end
                end
            end
        end
    end

    if #targetSlots > 0 then
        task.spawn(function()
            for i = 1, _E.MaxUpLevel do
                if not _E.HubRunning then break end
                for _, sNum in ipairs(targetSlots) do
                    pcall(function()
                        BUpgradeEvt:FireServer(sNum)
                    end)
                    task.wait(0.1)
                end
                task.wait(0.2)
            end
        end)
    end
end)

Tab1:CreateSection("Upgrade Plot")
Tab1:CreateToggle("Auto Upgrade Plot (Smart)", false, function(Val) _E.APlotUpgrade = Val end)

-- ==========================================
-- [ TAB: SHOP - AUTO BUY & SELL ]
-- ==========================================
TabShop:CreateSection("Speed Upgrades")
TabShop:CreateToggle("Auto Buy Speed", false, function(Val) _E.ABuySpeed = Val end)

TabShop:CreateSection("Weight Upgrades")
_E.WeightList = {"None"}
if weightsFolder then
    for _, w in ipairs(weightsFolder:GetChildren()) do
        table.insert(_E.WeightList, w.Name)
    end
end

TabShop:CreateDropdownSearch("Target Weight", _E.WeightList, false, function(Val) _E.TTargetWeight = Val end)
TabShop:CreateToggle("Auto Buy Selected Weight", false, function(Val) _E.ABuyWeights = Val end)
TabShop:CreateToggle("Auto Buy Best Weight (Smart)", false, function(Val) _E.ABuyBest = Val end)

TabShop:CreateSection("Inventory Management")
TabShop:CreateSlider("Sell Interval (Seconds)", 1, 60, 20, function(Val) _E.SellDelay = Val end)
TabShop:CreateDropdownSearch("Keep Brainrot (Whitelist)", DB.BrainrotOptions, true, function(Val) _E.TSSellBrainrot = Val end)
TabShop:CreateDropdownSearch("Keep Rarity (Whitelist)", DB.RarityOptions, true, function(Val) _E.TSSellRarity = Val end)
TabShop:CreateDropdownSearch("Keep Mutation (Whitelist)", DB.MutationOptions, true, function(Val) _E.TSSellMutation = Val end)
TabShop:CreateToggle("Auto Sell All", false, function(Val) _E.ASellAll = Val end)
TabShop:CreateToggle("Auto Sell Selected", false, function(Val) _E.ASellFilter = Val end)

-- ==========================================
-- [ BACKGROUND PROCESSES (SAFE LOOPS) ]
-- ==========================================

-- AUTO PLACE BEST BRAINROT (OTAK V5 MATA LASIK 3D)
task.spawn(function()
    while _E.HubRunning do
        task.wait(2)
        if _E.APlaceBest and SInteractEvt then
            local char = LP.Character
            local myPlot = GetMyPlot()
            if myPlot and char then
                local worstSlotNum = nil
                local worstScore = math.huge
                local emptySlots = {}

                -- 1. Scan Plot (Baca Mutasi via Model 3D)
                if myPlot:FindFirstChild("Slots") then
                    for _, slot in ipairs(myPlot.Slots:GetChildren()) do
                        local placedPart = slot:FindFirstChild("PlacedPart")
                        local slotNum = tonumber(string.match(slot.Name, "%d+"))
                        local slotHasPet = false
                        
                        if placedPart then
                            for _, p in ipairs(placedPart:GetChildren()) do
                                if p:IsA("Model") and not p.Name:match("Hitbox") then
                                    slotHasPet = true
                                    
                                    local mut = "None"
                                    for _, child in ipairs(p:GetChildren()) do
                                        if table.find(KnownMutations, child.Name) then 
                                            mut = child.Name 
                                            break 
                                        end
                                    end
                                    
                                    local score = GetBrainrotScore(p.Name, mut)
                                    if score < worstScore then
                                        worstScore = score
                                        worstSlotNum = slotNum
                                    end
                                    break
                                end
                            end
                        end
                        
                        if not slotHasPet and slotNum then
                            table.insert(emptySlots, slotNum)
                        end
                    end
                end

                -- 2. Scan Inventory (Baca Mutasi via Attribute)
                local bestPetTool = nil
                local bestInvScore = -1
                local allTools = {}
                
                if LP.Backpack then
                    for _, t in ipairs(LP.Backpack:GetChildren()) do table.insert(allTools, t) end
                end
                for _, t in ipairs(char:GetChildren()) do
                    if t:IsA("Tool") then table.insert(allTools, t) end
                end

                for _, tool in ipairs(allTools) do
                    if tool:GetAttribute("GUID") then
                        local pMut = tool:GetAttribute("Mutation") or "None"
                        local score = GetBrainrotScore(tool.Name, pMut)
                        if score > bestInvScore then
                            bestInvScore = score
                            bestPetTool = tool
                        end
                    end
                end

                -- 3. Eksekusi Juri Tukar Tambah
                if bestPetTool then
                    if #emptySlots > 0 then
                        _E.IsPlacingPet = true
                        bestPetTool.Parent = char
                        task.wait(0.6)
                        pcall(function() SInteractEvt:FireServer(emptySlots[1]) end)
                        task.wait(0.5)
                        _E.IsPlacingPet = false
                        
                    elseif worstSlotNum and bestInvScore > worstScore then
                        _E.IsPlacingPet = true
                        -- Kosongin Tangan
                        for _, t in ipairs(char:GetChildren()) do
                            if t:IsA("Tool") then t.Parent = LP.Backpack end
                        end
                        task.wait(0.3)
                        
                        -- Cabut si ampas
                        pcall(function() SInteractEvt:FireServer(worstSlotNum) end)
                        task.wait(1)
                        
                        -- Lem si Sultan ke tangan
                        bestPetTool.Parent = char
                        task.wait(0.6)
                        
                        -- Taruh si Sultan
                        pcall(function() SInteractEvt:FireServer(worstSlotNum) end)
                        task.wait(0.5)
                        _E.IsPlacingPet = false
                    end
                end
            end
        end
    end
end)

-- Auto Train & Equip Best Weight (respects IsPlacingPet)
task.spawn(function()
    while _E.HubRunning do
        task.wait(0.5)
        if _E.ATrain and not _E.IsPlacingPet then
            local char = LP.Character
            local hum = char and char:FindFirstChild("Humanoid")
            if hum and weightsFolder then
                local bestOwnedWeight = nil
                local highestIndex = -1
                local ownedTools = {}

                for _, item in ipairs(LP.Backpack:GetChildren()) do
                    if item:IsA("Tool") then
                        table.insert(ownedTools, item)
                    end
                end
                if char then
                    local eq = char:FindFirstChildOfClass("Tool")
                    if eq then
                        table.insert(ownedTools, eq)
                    end
                end

                local sortedWeights = GetSortedWeights()
                for _, tool in ipairs(ownedTools) do
                    for i, w in ipairs(sortedWeights) do
                        if w.name == tool.Name and i > highestIndex then
                            highestIndex = i
                            bestOwnedWeight = tool
                        end
                    end
                end

                if bestOwnedWeight then
                    local currentEquipped = char:FindFirstChildOfClass("Tool")
                    if not currentEquipped or currentEquipped.Name ~= bestOwnedWeight.Name then
                        if WeightEquipEvt then
                            pcall(function()
                                WeightEquipEvt:FireServer(bestOwnedWeight.Name)
                            end)
                        end
                        if bestOwnedWeight.Parent == LP.Backpack then
                            hum:EquipTool(bestOwnedWeight)
                        end
                    end
                end
            end
        end
    end
end)

-- Auto Buy Speed
task.spawn(function()
    while _E.HubRunning do
        task.wait(0.1)
        if _E.ABuySpeed and SpeedUpEvt then
            pcall(function()
                SpeedUpEvt:FireServer(1)
            end)
        end
    end
end)

-- Auto Buy Weight (Best / Selected)
task.spawn(function()
    local weightCooldown = false
    local lastFailedWeightMoney = 0
    local lastAttemptedWeight = ""

    while _E.HubRunning do
        task.wait(0.5)
        local currentMoney = GetMyMoney()
        local targetWeightName = nil

        if _E.ABuyBest and weightsFolder then
            local char = LP.Character
            local currentWeightName = nil
            local itemsToCheck = {}
            for _, v in ipairs(LP.Backpack:GetChildren()) do
                table.insert(itemsToCheck, v)
            end
            if char then
                local eq = char:FindFirstChildOfClass("Tool")
                if eq then
                    table.insert(itemsToCheck, eq)
                end
            end
            for _, tool in ipairs(itemsToCheck) do
                if tool:IsA("Tool") and weightsFolder:FindFirstChild(tool.Name) then
                    currentWeightName = tool.Name
                end
            end

            if currentWeightName then
                local sortedWeights = GetSortedWeights()
                local currentIndex = 0
                for i, w in ipairs(sortedWeights) do
                    if w.name == currentWeightName then
                        currentIndex = i
                        break
                    end
                end
                if currentIndex > 0 and currentIndex < #sortedWeights then
                    targetWeightName = sortedWeights[currentIndex + 1].name
                elseif currentIndex == 0 and #sortedWeights > 0 then
                    targetWeightName = sortedWeights[1].name
                end
            end
        elseif _E.ABuyWeights and _E.TTargetWeight ~= "None" then
            targetWeightName = _E.TTargetWeight
        end

        if targetWeightName and ShopBuyEvt then
            local price = GetWeightPrice(targetWeightName)
            if currentMoney > lastFailedWeightMoney then
                weightCooldown = false
            end
            if lastAttemptedWeight ~= targetWeightName then
                weightCooldown = false
            end

            if currentMoney >= price and not weightCooldown then
                lastAttemptedWeight = targetWeightName
                local preMoney = GetMyMoney()
                pcall(function()
                    ShopBuyEvt:FireServer("WeightShop", targetWeightName)
                end)
                task.wait(1.5)
                local postMoney = GetMyMoney()
                if postMoney >= preMoney then
                    weightCooldown = true
                    lastFailedWeightMoney = postMoney
                else
                    weightCooldown = false
                end
            end
        end
    end
end)

-- Auto Upgrade Plot
task.spawn(function()
    local plotCooldown = false
    local lastFailedPlotMoney = 0

    while _E.HubRunning do
        task.wait(1)
        local currentMoney = GetMyMoney()
        if _E.APlotUpgrade and PlotUpgradeEvt then
            if currentMoney > lastFailedPlotMoney then
                plotCooldown = false
            end
            if not plotCooldown then
                local preMoney = GetMyMoney()
                pcall(function()
                    PlotUpgradeEvt:FireServer()
                end)
                task.wait(1)
                local postMoney = GetMyMoney()
                if postMoney >= preMoney then
                    plotCooldown = true
                    lastFailedPlotMoney = postMoney
                end
            end
        end
    end
end)

-- Auto Rebirth (Smart)
task.spawn(function()
    local rebirthCooldown = false
    while _E.HubRunning do
        task.wait(1)
        if _E.ARebirth and RebirthEvt then
            local myPower = GetMyKickPower()
            local reqPower = GetRebirthCost()
            if myPower >= reqPower and reqPower > 0 and not rebirthCooldown then
                rebirthCooldown = true
                pcall(function()
                    RebirthEvt:FireServer()
                end)
                task.wait(5)
                rebirthCooldown = false
            end
        end
    end
end)

-- Auto Click 2x Train
task.spawn(function()
    while _E.HubRunning do
        task.wait(0.2)
        if _E.A2xTrain then
            local pGui = LP:FindFirstChild("PlayerGui")
            local kUpgrades = pGui and pGui:FindFirstChild("KickUpgrades")
            if kUpgrades then
                for _, ui in ipairs(kUpgrades:GetChildren()) do
                    if ui.Name == "Bonus" then
                        pcall(function()
                            for _, click in pairs(getconnections(ui.MouseButton1Click)) do
                                click:Fire()
                            end
                            for _, click in pairs(getconnections(ui.Activated)) do
                                click:Fire()
                            end
                        end)
                    end
                end
            end
        end
    end
end)

-- Auto Collect Cash
task.spawn(function()
    local lastCollectTime = 0
    while _E.HubRunning do
        task.wait(0.5)
        local myPlot = GetMyPlot()
        if not myPlot then continue end

        if _E.ACollect and BCollectEvt then
            if tick() - lastCollectTime >= _E.CollectDelay then
                lastCollectTime = tick()
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and myPlot:FindFirstChild("Slots") and myPlot:FindFirstChild("Buttons") then
                    local originalCFrame = hrp.CFrame
                    for _, slot in ipairs(myPlot.Slots:GetChildren()) do
                        local placedPart = slot:FindFirstChild("PlacedPart")
                        if placedPart and placedPart:FindFirstChildOfClass("Model") then
                            local slotNum = tonumber(string.match(slot.Name, "%d+"))
                            if slotNum then
                                local targetButton = myPlot.Buttons:FindFirstChild(slot.Name)
                                if targetButton and targetButton:IsA("BasePart") then
                                    hrp.CFrame = targetButton.CFrame * CFrame.new(0, 3, 0)
                                    task.wait(0.15)
                                    pcall(function()
                                        BCollectEvt:FireServer(slotNum)
                                    end)
                                    task.wait(0.1)
                                end
                            end
                        end
                    end
                    hrp.CFrame = originalCFrame
                end
            end
        end
    end
end)

-- Auto Sell (All / Filter, only touches Backpack)
task.spawn(function()
    local lastSellTime = 0
    while _E.HubRunning do
        task.wait(0.5)
        local currentTime = tick()

        if _E.ASellAll and SellAllEvt then
            if currentTime - lastSellTime >= _E.SellDelay then
                lastSellTime = currentTime
                pcall(function()
                    SellAllEvt:InvokeServer()
                end)
            end

        elseif _E.ASellFilter and SellSingleEvt then
            if currentTime - lastSellTime >= _E.SellDelay then
                lastSellTime = currentTime
                if LP.Backpack then
                    for _, petObj in ipairs(LP.Backpack:GetChildren()) do
                        if petObj:IsA("Tool") and petObj:GetAttribute("Mutation") then
                            local pName   = petObj.Name
                            local pRarity = petObj:GetAttribute("Rarity") or "Unknown"
                            local pMut    = petObj:GetAttribute("Mutation") or "None"

                            local keep = isMatch(_E.TSSellBrainrot, pName)
                                and isMatch(_E.TSSellRarity, pRarity)
                                and isMatch(_E.TSSellMutation, pMut)

                            if not keep then
                                pcall(function()
                                    SellSingleEvt:InvokeServer(petObj.Name)
                                end)
                                task.wait(0.1)
                            end
                        end
                    end
                end
            end
        end
    end
end)
