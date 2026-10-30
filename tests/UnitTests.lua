--[[
    LiyHub UI - Complete Automated Unit Test Suite
    Covers all verification test specifications including Mobile Pin Tab.
]]

local UnitTests = {}

function UnitTests.Run(LiyHubUI)
    local results = {}
    local passedCount = 0
    local failedCount = 0
    local notRunCount = 0
    
    local function test(name, fn)
        local ok, err = pcall(fn)
        if ok then
            passedCount = passedCount + 1
            table.insert(results, { Name = name, Status = "PASSED", Error = nil })
        else
            failedCount = failedCount + 1
            table.insert(results, { Name = name, Status = "FAILED", Error = tostring(err) })
        end
    end
    
    -- Test 1: Initialization
    test("1. Initialization", function()
        assert(LiyHubUI ~= nil, "LiyHubUI library failed to load")
        assert(type(LiyHubUI.CreateWindow) == "function", "CreateWindow is not a function")
        assert(LiyHubUI.Name == "LiyHub UI", "Library name mismatch")
    end)
    
    -- Test 2: Window creation and destruction
    test("2. Window creation and destruction", function()
        local win = LiyHubUI:CreateWindow({ Title = "Test Window" })
        assert(win ~= nil, "Failed to create window")
        assert(win._screenGui ~= nil, "ScreenGui not created")
        assert(win._screenGui.Parent ~= nil, "ScreenGui not parented")
        win:Destroy()
        assert(win._destroyed == true, "Window destroyed flag not set")
    end)
    
    -- Test 3: Tabs and sections
    test("3. Tabs and sections", function()
        local win = LiyHubUI:CreateWindow({ Title = "Tabs Test" })
        local group = win:CreateTabGroup("Test Group")
        assert(group ~= nil, "TabGroup creation failed")
        local tab1 = group:CreateTab({ Name = "Tab 1" })
        local tab2 = group:CreateTab({ Name = "Tab 2" })
        assert(tab1 ~= nil and tab2 ~= nil, "Tab creation failed")
        
        local sec = tab1:CreateSection("Section 1")
        assert(sec ~= nil, "Section creation failed")
        assert(#tab1._sections == 1, "Section not registered on tab")
        win:Destroy()
    end)
    
    -- Test 4: Single-column layout
    test("4. Single-column layout", function()
        local win = LiyHubUI:CreateWindow({ Title = "Single Column Test" })
        local group = win:CreateTabGroup("Group")
        local tab = group:CreateTab({ Name = "Single", TwoColumns = false })
        assert(tab._layoutEngine:IsTwoColumns() == false, "Layout should be single-column")
        local secParent = tab._layoutEngine:GetSectionParent()
        assert(secParent ~= nil and secParent.Name == "SingleColumn", "Single column parent invalid")
        win:Destroy()
    end)
    
    -- Test 5: Dual-column layout
    test("5. Dual-column layout", function()
        local win = LiyHubUI:CreateWindow({ Title = "Dual Column Test" })
        local group = win:CreateTabGroup("Group")
        local tab = group:CreateTab({ Name = "Dual", TwoColumns = true })
        assert(tab._layoutEngine:IsTwoColumns() == true, "Layout should be dual-column")
        local leftSecParent = tab._layoutEngine:GetSectionParent({ Side = "Left" })
        local rightSecParent = tab._layoutEngine:GetSectionParent({ Side = "Right" })
        assert(leftSecParent.Name == "LeftColumn", "Left column parent mismatch")
        assert(rightSecParent.Name == "RightColumn", "Right column parent mismatch")
        win:Destroy()
    end)
    
    -- Test 6: All component constructors
    test("6. All component constructors", function()
        local win = LiyHubUI:CreateWindow({ Title = "Components Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local btn = sec:CreateButton({ Text = "Btn" })
        local btnGrp = sec:CreateButtonGroup({ Buttons = {{ Text = "B1" }} })
        local tog = sec:CreateToggle({ Name = "Tog" })
        local togGrp = sec:CreateToggleGroup({ Toggles = {{ Name = "T1" }} })
        local sld = sec:CreateSlider({ Name = "Sld", Min = 0, Max = 100 })
        local sldGrp = sec:CreateSliderGroup({ Sliders = {{ Name = "S1" }} })
        local inp = sec:CreateInput({ Name = "Inp" })
        local inpGrp = sec:CreateInputGroup({ Inputs = {{ Name = "I1" }} })
        local drp = sec:CreateDropdown({ Name = "Drp", Options = { "A", "B" } })
        local drpGrp = sec:CreateDropdownGroup({ Dropdowns = {{ Name = "D1" }} })
        local key = sec:CreateKeybind({ Name = "Key" })
        local par = sec:CreateParagraph({ Title = "P", Content = "C" })
        local div = sec:CreateDivider()
        local ban = sec:CreateBanner({ Title = "Ban", Description = "Desc" })
        local prg = sec:CreateProgression({ Title = "Prg", Steps = { { Label = "1" }, { Label = "2" } } })
        
        assert(btn and btnGrp and tog and togGrp and sld and sldGrp and inp and inpGrp and drp and drpGrp and key and par and div and ban and prg, "One or more component constructors failed")
        win:Destroy()
    end)
    
    -- Test 7: Callback execution
    test("7. Callback execution", function()
        local win = LiyHubUI:CreateWindow({ Title = "Callback Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local clicked = false
        local btn = sec:CreateButton({
            Text = "Click",
            Callback = function()
                clicked = true
            end
        })
        btn._callback()
        assert(clicked == true, "Button callback was not executed")
        win:Destroy()
    end)
    
    -- Test 8: Toggle state synchronization
    test("8. Toggle state synchronization", function()
        local win = LiyHubUI:CreateWindow({ Title = "Toggle Sync Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local recordedVal = nil
        local tog = sec:CreateToggle({
            Name = "SyncToggle",
            Default = false,
            Callback = function(v) recordedVal = v end
        })
        assert(tog:GetValue() == false, "Initial toggle state incorrect")
        tog:SetValue(true, true)
        assert(tog:GetValue() == true, "Toggle GetValue did not match SetValue(true)")
        assert(recordedVal == true, "Toggle callback did not receive synchronized value")
        tog:SetValue(false, true)
        assert(tog:GetValue() == false, "Toggle GetValue did not match SetValue(false)")
        win:Destroy()
    end)
    
    -- Test 9: Slider bounds
    test("9. Slider bounds", function()
        local win = LiyHubUI:CreateWindow({ Title = "Slider Bounds Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local sld = sec:CreateSlider({
            Name = "BoundedSlider",
            Min = 10,
            Max = 50,
            Step = 5,
            Default = 20,
        })
        assert(sld:GetValue() == 20, "Slider initial default incorrect")
        sld:SetValue(100, false)
        assert(sld:GetValue() == 50, "Slider failed to clamp to upper bound 50")
        sld:SetValue(-10, false)
        assert(sld:GetValue() == 10, "Slider failed to clamp to lower bound 10")
        sld:SetValue(23, false)
        assert(sld:GetValue() == 25, "Slider failed to quantize to nearest step 25")
        win:Destroy()
    end)
    
    -- Test 10: Input defaults
    test("10. Input defaults", function()
        local win = LiyHubUI:CreateWindow({ Title = "Input Defaults Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local inp = sec:CreateInput({
            Name = "TestInput",
            Default = "InitialValue",
            Placeholder = "Type..."
        })
        assert(inp:GetValue() == "InitialValue", "Input initial default mismatch")
        inp:SetValue("UpdatedValue", false)
        assert(inp:GetValue() == "UpdatedValue", "Input SetValue failed")
        win:Destroy()
    end)
    
    -- Test 11: Dropdown selection
    test("11. Dropdown selection", function()
        local win = LiyHubUI:CreateWindow({ Title = "Dropdown Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local drp = sec:CreateDropdown({
            Name = "Fruit",
            Options = { "Apple", "Banana", "Cherry" },
            Default = "Apple"
        })
        assert(drp:GetValue() == "Apple", "Dropdown initial value mismatch")
        drp:SetValue("Cherry", false)
        assert(drp:GetValue() == "Cherry", "Dropdown SetValue failed")
        win:Destroy()
    end)
    
    -- Test 12: Multi-selection
    test("12. Multi-selection", function()
        local win = LiyHubUI:CreateWindow({ Title = "Multi Select Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local drp = sec:CreateDropdown({
            Name = "Tags",
            Options = { "Tag1", "Tag2", "Tag3" },
            MultiSelect = true,
            Default = { "Tag1", "Tag2" }
        })
        local val = drp:GetValue()
        assert(type(val) == "table", "MultiSelect dropdown must return a table")
        assert(#val == 2, "MultiSelect dropdown returned incorrect item count")
        assert(table.find(val, "Tag1") and table.find(val, "Tag2"), "MultiSelect items mismatch")
        win:Destroy()
    end)
    
    -- Test 13: Group state isolation
    test("13. Group state isolation", function()
        local win = LiyHubUI:CreateWindow({ Title = "Group Isolation Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local togGrp = sec:CreateToggleGroup()
        local t1 = togGrp:AddToggle({ Name = "T1", Default = false })
        local t2 = togGrp:AddToggle({ Name = "T2", Default = false })
        
        t1:SetValue(true, false)
        assert(t1:GetValue() == true, "T1 should be true")
        assert(t2:GetValue() == false, "T2 must remain false (state isolation)")
        win:Destroy()
    end)
    
    -- Test 14: Progression navigation
    test("14. Progression navigation", function()
        local win = LiyHubUI:CreateWindow({ Title = "Progression Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local prg = sec:CreateProgression({
            Title = "Quest",
            Steps = { { Label = "S1" }, { Label = "S2" }, { Label = "S3" } },
            CurrentStep = 1,
        })
        assert(prg:GetStep() == 1, "Initial step should be 1")
        prg:NextStep()
        assert(prg:GetStep() == 2, "NextStep failed")
        prg:NextStep()
        assert(prg:GetStep() == 3, "NextStep to max failed")
        prg:NextStep()
        assert(prg:GetStep() == 3, "Step exceeded maximum")
        prg:PrevStep()
        assert(prg:GetStep() == 2, "PrevStep failed")
        win:Destroy()
    end)
    
    -- Test 15: Configuration validation
    test("15. Configuration validation", function()
        local cfg = LiyHubUI:CreateConfigService({ FolderName = "TestConfigs", FileName = "test.json" })
        assert(cfg ~= nil, "ConfigService creation failed")
        cfg:Set("TestKey", 12345)
        assert(cfg:Get("TestKey") == 12345, "ConfigService Get/Set failed")
        local json = cfg:ExportJSON()
        assert(type(json) == "string" and #json > 2, "ExportJSON failed")
        local ok, _ = cfg:ImportJSON('{"ImportedKey": "Val"}')
        assert(ok == true, "ImportJSON failed")
        assert(cfg:Get("ImportedKey") == "Val", "Imported value not accessible")
    end)
    
    -- Test 16: Repeated destruction
    test("16. Repeated destruction", function()
        local win = LiyHubUI:CreateWindow({ Title = "Destruction Test" })
        win:Destroy()
        local ok, _ = pcall(function() win:Destroy() end)
        assert(ok == true, "Repeated destruction threw an error")
    end)
    
    -- Test 17: Invalid arguments
    test("17. Invalid arguments", function()
        local win = LiyHubUI:CreateWindow({ Title = "Validation Test" })
        local ok1, _ = pcall(function() win:CreateTabGroup(12345) end)
        assert(ok1 == false, "Window:CreateTabGroup should reject non-string name")
        win:Destroy()
    end)
    
    -- Test 18: Backward compatibility
    test("18. Backward compatibility", function()
        assert(type(LiyHubUI.Create) == "function", "LiyHubUI.Create alias missing")
        local win = LiyHubUI:Create({ Title = "Compat Test" })
        assert(win ~= nil, "LiyHubUI.Create failed to create window")
        win:Destroy()
    end)
    
    -- Test 19: Mobile Pin Tab
    test("19. Mobile Pin Tab", function()
        local win = LiyHubUI:CreateWindow({ Title = "Pin Test", MobilePin = true })
        assert(win:GetMobilePin() ~= nil, "MobilePin instance not created")
        assert(win._mobilePin._container ~= nil, "MobilePin container missing")
        win:Toggle()
        assert(win._mobilePin._subLabel.Text == "Tap to Open", "Mobile pin subtitle did not update on window hide")
        win:Toggle()
        assert(win._mobilePin._subLabel.Text == "Tap to Close", "Mobile pin subtitle did not update on window show")
        win:Destroy()
    end)
    
    return {
        Total = #results,
        Passed = passedCount,
        Failed = failedCount,
        NotRun = notRunCount,
        Results = results,
    }
end

return UnitTests
