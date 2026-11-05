--[[
	Protected by Roshan / What are you looking for, you bastard? Mind your own business, you little rat. 
]]
local _d = {
	104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104,
	117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111,
	109, 47, 82, 111, 115, 104, 97, 110, 68, 101, 118, 115, 115, 55, 54, 47,
	83, 99, 114, 105, 112, 116, 45, 80, 114, 111, 116, 101, 99, 116, 47, 114,
	101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 82,
	111, 115, 104, 97, 110, 80, 114, 101, 109, 105, 117, 109, 72, 117, 98, 95,
	86, 55, 46, 108, 117, 97,
}
local _k = { 0 }

local _x = bit32 and bit32.bxor or function(a, b)
	local r, p = 0, 1
	while a > 0 or b > 0 do
		local x, y = a % 2, b % 2
		if x ~= y then r = r + p end
		a, b, p = (a - x) / 2, (b - y) / 2, p * 2
	end
	return r
end

local _s = {}
for i = 1, #_d do
	_s[i] = string.char(_x(_d[i], _k[(i - 1) % #_k + 1]))
end
local _u = table.concat(_s)

local _ok, _e = pcall(function()
	local f, err = loadstring(game:HttpGet(_u))
	if not f then error("SYNTAX: " .. tostring(err)) end
	f()
end)

if not _ok then
	warn("[Roshan Hub] " .. tostring(_e))
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Roshan Hub Error", Text = tostring(_e):sub(1, 190), Duration = 20 })
	end)
end
