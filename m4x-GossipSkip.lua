local frame = CreateFrame("Frame", "m4xGossipSkip", UIParent)

frame:RegisterEvent("GOSSIP_SHOW")
frame:RegisterEvent("GOSSIP_CLOSED")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" and IsShiftKeyDown() then
        frame:UnregisterEvent("GOSSIP_SHOW")
        return
    elseif event == "GOSSIP_SHOW" and (C_GossipInfo.GetNumAvailableQuests() == 0) and (C_GossipInfo.GetNumActiveQuests() == 0) and (C_GossipInfo.GetNumOptions() == 1) and not C_GossipInfo.ForceGossip() then
        if C_GossipInfo.GetOptions()[1]["type"] == "gossip" then
            C_GossipInfo.SelectOption(1)
        end
    elseif event == "GOSSIP_CLOSED" then
        frame:RegisterEvent("GOSSIP_SHOW")
    end
end)
