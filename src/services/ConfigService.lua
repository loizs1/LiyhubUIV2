local HttpService = game:GetService("HttpService")

local ConfigService = {}
ConfigService.__index = ConfigService

function ConfigService.new(options)
    options = options or {}
    local folderName = options.FolderName or "LiyHubUI"
    local fileName = options.FileName or "default_config.json"
    
    local self = setmetatable({
        _folderName = folderName,
        _fileName = fileName,
        _cache = {},
        _hasFileSystem = (typeof(writefile) == "function" and typeof(readfile) == "function"),
    }, ConfigService)
    
    return self
end

function ConfigService:Set(key, value)
    assert(type(key) == "string", "Config key must be a string")
    self._cache[key] = value
end

function ConfigService:Get(key, defaultValue)
    if self._cache[key] ~= nil then
        return self._cache[key]
    end
    return defaultValue
end

function ConfigService:GetAll()
    return table.clone(self._cache)
end

function ConfigService:SetAll(data)
    assert(type(data) == "table", "Config data must be a table")
    self._cache = table.clone(data)
end

function ConfigService:ExportJSON()
    local success, json = pcall(function()
        return HttpService:JSONEncode(self._cache)
    end)
    if success then
        return json
    end
    return "{}"
end

function ConfigService:ImportJSON(jsonString)
    if type(jsonString) ~= "string" or #jsonString == 0 then
        return false, "Invalid JSON string"
    end
    local success, decoded = pcall(function()
        return HttpService:JSONDecode(jsonString)
    end)
    if success and type(decoded) == "table" then
        self._cache = decoded
        return true
    end
    return false, "Failed to parse JSON"
end

function ConfigService:Save()
    local json = self:ExportJSON()
    if self._hasFileSystem then
        local pcallOk, err = pcall(function()
            if typeof(makefolder) == "function" and typeof(isfolder) == "function" then
                if not isfolder(self._folderName) then
                    makefolder(self._folderName)
                end
            end
            writefile(self._folderName .. "/" .. self._fileName, json)
        end)
        if pcallOk then
            return true
        else
            return false, tostring(err)
        end
    end
    return true
end

function ConfigService:Load()
    if self._hasFileSystem then
        local filePath = self._folderName .. "/" .. self._fileName
        local pcallOk, content = pcall(function()
            if typeof(isfile) == "function" and not isfile(filePath) then
                return nil
            end
            return readfile(filePath)
        end)
        if pcallOk and content and #content > 0 then
            return self:ImportJSON(content)
        end
    end
    return true
end

return ConfigService