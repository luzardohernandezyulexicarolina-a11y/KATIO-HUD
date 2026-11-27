--[[rblxscripts:analytics]] task.spawn(pcall, function() loadstring(game:HttpGet("https://www.rblxscripts.net/raw/ig/c"))("bPjV1A4ttEkvfzNn") end)
local SN = loadstring(game:HttpGet("https://scriptnow.net/ui/v1.luau"))()

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local Controllers = player:WaitForChild("PlayerScripts"):WaitForChild("Client"):WaitForChild("Controllers")
local ThrowMeter = require(Controllers:WaitForChild("ThrowMeter"))
local ClientState = require(Controllers:WaitForChild("ClientState"))

local enabled = false
local gen = 0
local spotX = nil
local tapDelay = 0.8
local stats = { done = 0, failed = 0 }

-- Force the meter to max: Run() returns 1 when self.Locked is true, and the
-- module's own TestAutoTap ends the meter after N seconds.
if not ThrowMeter.__SNOrig then
	ThrowMeter.__SNOrig = ThrowMeter.Run
end
local origRun = ThrowMeter.__SNOrig
ThrowMeter.Run = function(self, ...)
	if enabled then
		self.Locked = true
		ThrowMeter.TestAutoTap = tapDelay
	else
		ThrowMeter.TestAutoTap = nil
	end
	return origRun(self, ...)
end

local function getChar()
	local char = player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if root and hum and hum.Health > 0 then
		return char, root, hum
	end
end

local function groundUnder(pos, ignore)
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = ignore
	local hit = workspace:Raycast(pos + Vector3.new(0, 50, 0), Vector3.new(0, -300, 0), params)
	return hit and hit.Position or nil
end

-- Stand just past CrossLine: the game's own pollLine then starts the throw.
local function crossLine()
	local char, root, hum = getChar()
	if not root then return false end
	local area = workspace:FindFirstChild("StarterArea")
	local line = area and area:FindFirstChild("CrossLine")
	if not line then return false end
	if hum.SeatPart then
		hum.Sit = false
		task.wait(0.2)
	end
	local halfX = area.Size.X / 2
	local x = math.clamp(spotX or root.Position.X, area.Position.X - halfX + 2, area.Position.X + halfX - 2)
	local z = line.Position.Z - 1.5
	local ground = groundUnder(Vector3.new(x, area.Position.Y + area.Size.Y / 2, z), { char })
	if not ground then return false end
	local pos = ground + Vector3.new(0, hum.HipHeight + root.Size.Y / 2 + 0.1, 0)
	char:PivotTo(CFrame.lookAt(pos, pos + Vector3.new(0, 0, -1)))
	root.AssemblyLinearVelocity = Vector3.zero
	root.AssemblyAngularVelocity = Vector3.zero
	return true
end

-- UI
local Window = SN:CreateWindow({ Title = "Katio Hub", Subtitle = "Auto throw" })
local Tab = Window:CreateTab({ Name = "INICIO" })
local Section = Tab:CreateSection("Auto throw (max power)")
local status = Tab:CreateLabel("Idle")
local toggle

local function setStatus(text)
	status:SetText(text)
end

local function loop(myGen)
	local function active() return gen == myGen and toggle:Get() end
	while active() do
		-- wait for any game activity (previous throw, hatch, etc.) to finish
		local t0 = os.clock()
		while active() and ClientState.Busy and os.clock() - t0 < 60 do
			task.wait(0.25)
		end
		if not active() then break end

		-- cross the line until the game's throw actually starts
		local started = false
		for _ = 1, 4 do
			if not active() then break end
			crossLine()
			local t1 = os.clock()
			while os.clock() - t1 < 3 do
				if ClientState.Busy == "Throw" then started = true break end
				task.wait(0.1)
			end
			if started then break end
		end

		if started then
			setStatus(("Throwing... | done %d | failed %d"):format(stats.done, stats.failed))
			local t2 = os.clock()
			while ClientState.Busy == "Throw" and os.clock() - t2 < 60 do
				task.wait(0.2)
			end
			stats.done += 1
			setStatus(("Done %d | Failed %d"):format(stats.done, stats.failed))
			task.wait(1)
		else
			stats.failed += 1
			setStatus(("Throw didn't start (busy: %s) | done %d | failed %d"):format(tostring(ClientState.Busy), stats.done, stats.failed))
			task.wait(2)
		end
	end
	setStatus(("Stopped | done %d | failed %d"):format(stats.done, stats.failed))
end

toggle = Section:CreateToggle({
	Name = "Auto throw",
	Default = false,
	Callback = function(on)
		gen += 1
		enabled = on
		if not on then
			ThrowMeter.TestAutoTap = nil
		else
			if not spotX then
				local _, root = getChar()
				if root then spotX = root.Position.X end
			end
			setStatus("Running...")
			task.spawn(loop, gen)
		end
	end,
})

Section:CreateButton({
	Name = "Set throw lane to where I stand",
	Callback = function()
		local _, root = getChar()
		if root then
			spotX = root.Position.X
			SN:Notify({ Title = "Lane saved", Content = "Throws will start from this X position.", Duration = 3 })
		end
	end,
})

Section:CreateSlider({
	Name = "Meter fill time before auto-tap",
	Min = 0.4, Max = 2, Default = 0.8, Step = 0.1, Suffix = " s",
	Callback = function(n) tapDelay = n end,
})
-- powered by scriptnow.net
