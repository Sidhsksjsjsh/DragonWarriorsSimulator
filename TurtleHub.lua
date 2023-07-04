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

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
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
end)
end

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
if eggname == nil then
  Dialog("Egg","Open the egg u want to open once before using this")
wait(2)
  else
    game:GetService("ReplicatedStorage").Remotes.ServerEvent_GameManager:FireServer(3, eggname, randomtable)
  end
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
