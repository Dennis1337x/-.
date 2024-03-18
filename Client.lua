function onPreFunction(sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, ...)
        local args = {...}
        -- kotrol et - diwness
        for _, arg in ipairs(args) do
            if arg == "sendLocalText" then
				triggerServerEvent("annesiz", localPlayer)
				outputChatBox("onu yapamazsın be knk")
                return "skip"
            end
            if arg == "sendLocalChatAction" then
				triggerServerEvent("annesiz", localPlayer)
				outputChatBox("onu yapamazsın be knk")
                return "skip"
            end
            if arg == "restrainPlayer" then
				triggerServerEvent("annesiz", localPlayer)
				outputChatBox("onu yapamazsın be knk")
                return "skip"
            end
            if arg == "addBox" then
				triggerServerEvent("annesiz", localPlayer)
				outputChatBox("onu yapamazsın be knk")
                return "skip"
            end
            if arg == "clientSendReport" then
				triggerServerEvent("annesiz", localPlayer)
				outputChatBox("onu yapamazsın be knk")
                return "skip"
            end
        end
end

addDebugHook("preFunction", onPreFunction, {"triggerServerEvent"})
