local eggname = nil
local randomtable = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == 'ServerEvent_GameManager' and tonumber(Args[1]) == 3  then
eggname = Args[2]
randomtable = Args[3]
end
	return namecall(self, ...) 
end)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local MakeItNumber = {
        K = "",
        M = "",
	B = "",
	T = "",
	Qa = "",
	Qi = ""

}

function ConvertNumber(PriceTag)
return PriceTag:gsub("K",MakeItNumber.K):gsub("M",MakeItNumber.M):gsub("B",MakeItNumber.B):gsub("T",MakeItNumber.T):gsub("Qa",MakeItNumber.Qa):gsub("Qi",MakeItNumber.Qi)
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local EggList = {}
function AddTable(TableString,LocalTrigger)
for _,v in pairs(TableString:GetChildren()) do
	table.insert(LocalTrigger,v.Name)
end
end

AddTable(game:GetService("Workspace").PetEggs,EggList)

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local Status = T2:AddParagraph("Egg","Egg name: #EGG_ERROR \nDelete: #DELETE_ERROR \nPrice: #PRICE_ERROR | Your money: #MONEY_ERROR")

local IconImage = "rbxassetid://12860696020"
T2:AddDropdown({
  Name = "Select Egg",
  Default = "EGGA",
  Options = EggList,
  Callback = function(Value)
    _G.eggmetatable = Value
    IconImage = game:GetService("Workspace").PetEggs[Value].PriceTag.Part.SurfaceGui.Frame.Icon.Image
  end    
})

local T3 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://0",
PremiumOnly = false
})

function Dialog(title,desc)
OrionLib:MakeNotification({
   Name = title,
   Content = desc,
   Image = "rbxassetid://0",
   Time = 5
})
end

T1:AddToggle({
  Name = "Kill Aura",
  Default = false,
  Callback = function(Value)
  _G.lol = Value
     while wait() do
       if _G.lol == false then break end
  for i,v in pairs(game:GetService("Workspace").ClientEntities:GetChildren()) do
  if v.ClassName == "Part" and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 300 then
  game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(1, v:GetAttribute("TeamID"), v.Name)
  end
  end
  end
end
})

T1:AddToggle({
  Name = "Auto Heal",
  Default = false,
  Callback = function(Value)
  _G.Heal = Value
     while wait() do
       if _G.Heal == false then break end
  for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
	if v.Name == game.Players.LocalPlayer then
           game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(2, v:GetAttribute("TeamID"), {game.Players.LocalPlayer.Name}, -math.huge)
  end
  end
  end
end
})

T1:AddToggle({
  Name = "Auto Start Wave",
  Default = false,
  Callback = function(Value)
  _G.WaveStarter = Value
     while wait() do
       if _G.WaveStarter == false then break end
  for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
  if v.ClassName == "BasePart" and v.Name == "TeamArea1" then
   if game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 300 then
     OrionLib:Teleport(game:GetService("Workspace").TeamArea1.Part)
   end
  elseif v.ClassName == "BasePart" and v.Name == "TeamArea2" then
   if game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 300 then
     OrionLib:Teleport(game:GetService("Workspace").TeamArea2.Part)
   end
  elseif v.ClassName == "BasePart" and v.Name == "TeamArea3" then
   if game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 300 then
     OrionLib:Teleport(game:GetService("Workspace").TeamArea3.Part)
  end
  end
  end
  end
end
})

T1:AddButton({
  Name = "Get 1M+ Diamonds",
  Callback = function()
game:GetService("Players").LocalPlayer.PlayerGui.MainGUI:Destroy()
for i=1,5000 do
    task.spawn(function()
for i=1,12 do
local ohNumber1 = 27
local ohNumber2 = i

game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(ohNumber1, ohNumber2)
end
end)
end

Dialog("Auto Rejoin","Pls wait 10 seconds")        
wait(10)
game.Players.LocalPlayer:Kick("We are now rejoining")
game:GetService("TeleportService"):Teleport(game.PlaceId)
end
})

T1:AddButton({
  Name = "Get 700 Token (Summer Event)",
  Callback = function()
game:GetService("Players").LocalPlayer.PlayerGui.MainGUI:Destroy()
task.spawn(function()
for i=1,12 do
local ohNumber1 = 33
local ohNumber2 = i

game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(ohNumber1, ohNumber2)
end
end)

Dialog("Auto Rejoin","Pls wait 10 seconds")        
wait(10)
game.Players.LocalPlayer:Kick("We are now rejoining")
game:GetService("TeleportService"):Teleport(game.PlaceId)
end
})

T2:AddToggle({
  Name = "Egg Opener",
  Default = false,
  Callback = function(Value)
_G.egg = Value
while wait() do
  if _G.egg == false then break end
    game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(3,_G.eggmetatable,{})
  end
end
  })

T2:AddToggle({
  Name = "Equip Best",
  Default = false,
  Callback = function(Value)
  _G.BestPet = Value
    while wait() do
      if _G.BestPet == false then break end
         game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(21)
    end
end
})

T3:AddButton({
  Name = "Teleport to World 1",
  Callback = function()
game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(30, "WorldA")
end
  })

T3:AddButton({
  Name = "Teleport to World 2",
  Callback = function()
  game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(30, "WorldB")
  end
  })

  T3:AddButton({
  Name = "Teleport to World 3",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(30, "WorldC")
    end
  })
--[[
Diamond: 12860695788
Coin: 12860696020
]]
local AutoDelete = "{1,2,3,4,5}"
while wait() do
if IconImage == "rbxassetid://12860696020" then
         Status:Set("Egg name: " .. tostring(_G.eggmetatable) .." \nDelete: " .. tostring(AutoDelete) .. " \nPrice: " .. tostring(game:GetService("Workspace").PetEggs[_G.eggmetatable].PriceTag.Part.SurfaceGui.Frame.Price.Text) .. " [Coins] | Your money: " .. tostring(game.Players.LocalPlayer.leaderstats["💰 Coin"].Value),"Egg Status")
      elseif IconImage == "rbxassetid://12860695788" then
         Status:Set("Egg name: " .. tostring(_G.eggmetatable) .." \nDelete: " .. tostring(AutoDelete) .. " \nPrice: " .. tostring(game:GetService("Workspace").PetEggs[_G.eggmetatable].PriceTag.Part.SurfaceGui.Frame.Price.Text) .. " [Diamonds] | Your money: " .. tostring(game.Players.LocalPlayer.leaderstats["💰 Coin"].Value),"Egg Status")
	else
	Status:Set("Egg name: " .. tostring(_G.eggmetatable) .." \nDelete: " .. tostring(AutoDelete) .. " \nPrice: " .. tostring(game:GetService("Workspace").PetEggs[_G.eggmetatable].PriceTag.Part.SurfaceGui.Frame.Price.Text) .. " [Robux] | Your money: " .. tostring(game.Players.LocalPlayer.leaderstats["💰 Coin"].Value),"Egg Status")
end
end
