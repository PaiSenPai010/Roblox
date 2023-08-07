https://www.roblox.com/games/4999590694/Zombie-Defense-Tycoon?refPageId=29057d67-a63b-49b6-820b-f09d98e2ba47&AssetId=4999590694
---------------------------
--Kill all zombies--

--[[ Variables ]]
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local Client = RS:WaitForChild("CIient")
local Zombies = WS:WaitForChild("Zombies")


function Kill(v)
   spawn(function()
       if v:FindFirstChild("Humanoid") then
           repeat wait()
               Client:FireServer("FireShot", "Golden Gun",v:WaitForChild("Head"),0,0,0)
           until v.Parent == nil
       end
   end)
end

Zombies.ChildAdded:Connect(function(v)
   Kill(v)
end)

for _,v in pairs (Zombies:GetChildren()) do
   Kill(v)
end

--------------------------------------------------------------------------
--infinite goo--

--[[ Variables ]]
local RS = game:GetService("ReplicatedStorage")
local Client = RS:WaitForChild("CIient")

Client:FireServer("PlaceObject", "Turrets", "Crossbow Turret",CFrame.new(0,0,0,0,0,0,0), -math.huge)

-----------------------------------------------------------------------------
--infinite money--

--[[ Variables ]]
local RS = game:GetService("ReplicatedStorage")
local PS = game:GetService("Players")
local Client = RS:WaitForChild("CIient")
local RunSrv = game:GetService("RunService")

RunSrv.RenderStepped:Connect(function()
   Client:FireServer("Melee", "Divine Shield", PS.LocalPlayer.Character)
end)

-------------------------------------------------------------------------------------
--unlock all skins--

--[[ Variables ]]
local RS = game:GetService("ReplicatedStorage")
local Client = RS:WaitForChild("CIient")
local Melee = RS:WaitForChild("MeleeModels")
for _,v in pairs (Melee:GetChildren()) do
Client:FireServer("Skin", v.Name)
end
