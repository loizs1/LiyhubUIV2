# LiyHub UI Configuration & Profile Service

LiyHub UI includes dedicated serialization and profile management services designed for both file-system environments and standard Roblox Studio runtime environments.

---

## 1. ConfigService

Handles key-value storage, JSON encoding/decoding, and file persistence.

```lua
local ConfigService = LiyHubUI:CreateConfigService({
    FolderName = "LiyHubConfigs",
    FileName = "settings.json",
})

-- Set and Get Values
ConfigService:Set("AutoFarm", true)
ConfigService:Set("Speed", 32)

local isFarming = ConfigService:Get("AutoFarm", false)

-- Save to file system or storage
local success, err = ConfigService:Save()
if not success then
    warn("Failed to save config:", err)
end

-- Load from file system
ConfigService:Load()

-- Export and Import JSON strings directly
local jsonString = ConfigService:ExportJSON()
ConfigService:ImportJSON(jsonString)
```

---

## 2. ProfileService

Manages multiple named profiles (e.g. "Default", "PvP", "Farming") and switches active configurations seamlessly.

```lua
local ProfileService = LiyHubUI:CreateProfileService(ConfigService)

-- Create a new profile
ProfileService:CreateProfile("CombatBuild")

-- List existing profiles
local profiles = ProfileService:GetProfiles() -- returns {"CombatBuild", "Default"}

-- Switch to a profile (automatically commits active config)
ProfileService:SwitchProfile("CombatBuild")

-- Save the currently active profile
ProfileService:SaveActiveProfile()

-- Delete a profile (Default profile cannot be deleted)
ProfileService:DeleteProfile("OldBuild")
```

