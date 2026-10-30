--[[
    LiyHub UI - Test Runner
    Executes all verification tests and outputs formatted results.
]]

local TestRunner = {}

function TestRunner.Execute(LiyHubUI, UnitTestsModule)
    local UnitTests = UnitTestsModule or require(script.Parent.UnitTests)
    local report = UnitTests.Run(LiyHubUI)
    
    print("\n" .. string.rep("=", 60))
    print("           LIYHUB UI AUTOMATED VERIFICATION REPORT")
    print(string.rep("=", 60))
    
    for _, res in ipairs(report.Results) do
        local tag = "[" .. res.Status .. "]"
        if res.Status == "PASSED" then
            print(string.format("%-10s %s", tag, res.Name))
        else
            print(string.format("%-10s %s (Error: %s)", tag, res.Name, tostring(res.Error)))
        end
    end
    
    print(string.rep("-", 60))
    print(string.format("SUMMARY: Total: %d | PASSED: %d | FAILED: %d | NOT RUN: %d",
        report.Total, report.Passed, report.Failed, report.NotRun))
    print(string.rep("=", 60) .. "\n")
    
    return report
end

return TestRunner

