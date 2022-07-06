local ADDON_NAME = 'GridList'

_G[ADDON_NAME] = {
	-- [1] = {}, -- SV, SavedVars
	-- [2] = {}, -- FN, functions
	-- [3] = {}, -- G, globals constants
	-- [4] = {}, -- L, localization
	-- [5] = {}, -- P, Plugins
}

local GL = GridList

-- local SV, FN = unpack(_G[ADDON_NAME])

-- local MediaFolder = 'Interface\\AddOns\\AddOns\\media\\'

-- EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED, function(_, addonName)
	-- if addonName == ADDON_NAME then
		-- EVENT_MANAGER:UnregisterForEvent(ADDON_NAME)
	-- end
-- end)

function GL.Dummy() end
local Dummy = GL.Dummy

function GL.PostHooksSetupCallback(list, mode, typeId, onCreateFn, onUpdateFn, inject)
	local dataType = list.dataTypes[typeId]
	if not dataType then return end

	local pool				= dataType.pool
	local _hooks			= dataType.hooks
	local _m_Factory		= pool.m_Factory
	local _setupCallback	= dataType.setupCallback

	local _OnCreate
	local _OnUpdate

	if not _hooks then
		dataType.hooks = {}
		for m = 1, 3 do
			dataType.hooks[m] = {
				OnCreate	= Dummy,
				OnUpdate	= Dummy,
				CurrentFn	= Dummy,
			}
		end
	else
		_OnCreate = _hooks[mode].OnCreate
		_OnUpdate = _hooks[mode].OnUpdate

		if inject then
			if onCreateFn then
				_OnCreate = function(...)
					_OnCreate(...)
					onCreateFn(...)
				end
			end
			if onUpdateFn then
				_OnUpdate = function(...)
					_OnCreate(...)
					onCreateFn(...)
				end
			end
		end
	end


	dataType.hooks[mode] = {
		OnCreate	= onCreateFn and onCreateFn or _OnCreate and _OnCreate or Dummy,
		OnUpdate	= onUpdateFn and onUpdateFn or _OnUpdate and _OnUpdate or Dummy,
		CurrentFn	= onUpdateFn and onUpdateFn or _OnUpdate and _OnUpdate or Dummy,
	}

	if not _hooks then
		local hooks = dataType.hooks

		pool.m_Factory = function(...)
			local h = hooks[list.mode]
			h.CurrentFn = function(...)
				h.OnCreate(...)
				h.OnUpdate(...)
				h.CurrentFn = h.OnUpdate
			end

			return _m_Factory(...)
		end

		dataType.setupCallback = function(...)
			_setupCallback(...)
			hooks[list.mode].CurrentFn(...)
		end
	end
end
