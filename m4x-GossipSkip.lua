local frame = CreateFrame("Frame", "m4xGossipSkip", UIParent);

frame:RegisterEvent("GOSSIP_SHOW");
frame:RegisterEvent("GOSSIP_CLOSED");

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" and IsShiftKeyDown() then
        frame:UnregisterEvent("GOSSIP_SHOW");
        return;
    elseif event == "GOSSIP_SHOW" and (GetNumGossipAvailableQuests() == 0) and (GetNumGossipActiveQuests() == 0) and (GetNumGossipOptions() == 1) and not ForceGossip() then
        local _, gossipType = GetGossipOptions();
        if gossipType == "gossip" then
            SelectGossipOption(1);
        end
    elseif event == "GOSSIP_CLOSED" then
        frame:RegisterEvent("GOSSIP_SHOW");
    end
end);