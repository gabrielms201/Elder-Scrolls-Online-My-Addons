--[[
  * Supports for General LUA functionality
  * Author: Joviex (amorano@gmail.com)
]]--

--------------------------------------------------------------------------------
-- REGISTRATION
--------------------------------------------------------------------------------
local MAJOR, MINOR = "LibUtil", 1
local libu, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

-- Check if we already have this loaded into memory
if not libu then return end

--------------------------------------------------------------------------------
-- GLOBAL
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- METHOD
--------------------------------------------------------------------------------
local strjoin = zo_strjoin
local strsplit = zo_strsplit
function libu:print(...)
	d(strjoin("", ...))
end

local function safenext(table,index)
	local ok, k, v = pcall(next,table,index)
	if ok then
		return k, v
	else
		local newk = k:match(" function '(.-)'")
		if newk then
			return newk, ""
		else
			-- complete fail
		end
	end
end

function libu:safepairs(table)
	return safenext,table,nil
end

function libu:CHAIN(obj)
	local T={}
	setmetatable(T,{__index = function(self,fun)
		if fun=="__END" then
			return obj
		end
		return function(self,...)
			assert(obj[fun],fun.." missing in object")
			obj[fun](obj,...)
			return self
		end
	end})
	return T
end

--------------------------------------------------------------------------------
-- CLASS
--------------------------------------------------------------------------------


