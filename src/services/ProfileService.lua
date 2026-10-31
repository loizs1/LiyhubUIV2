local ProfileService = {}
ProfileService.__index = ProfileService

function ProfileService.new(configService)
    local self = setmetatable({
        _configService = configService,
        _profiles = {
            ["Default"] = {},
        },
        _activeProfile = "Default",
    }, ProfileService)
    
    return self
end

function ProfileService:GetProfiles()
    local list = {}
    for name, _ in pairs(self._profiles) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

function ProfileService:GetActiveProfile()
    return self._activeProfile
end

function ProfileService:CreateProfile(name)
    assert(type(name) == "string" and #name > 0, "Profile name must be a non-empty string")
    if not self._profiles[name] then
        self._profiles[name] = {}
    end
    return true
end

function ProfileService:DeleteProfile(name)
    if name == "Default" then
        return false, "Cannot delete Default profile"
    end
    if self._profiles[name] then
        self._profiles[name] = nil
        if self._activeProfile == name then
            self:SwitchProfile("Default")
        end
        return true
    end
    return false, "Profile does not exist"
end

function ProfileService:SwitchProfile(name)
    if not self._profiles[name] then
        return false, "Profile does not exist"
    end
    if self._configService then
        self._profiles[self._activeProfile] = self._configService:GetAll()
        self._configService:SetAll(self._profiles[name])
    end
    self._activeProfile = name
    return true
end

function ProfileService:SaveActiveProfile()
    if self._configService then
        self._profiles[self._activeProfile] = self._configService:GetAll()
        return self._configService:Save()
    end
    return true
end

return ProfileService