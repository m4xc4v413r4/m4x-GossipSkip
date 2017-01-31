local frame = CreateFrame("Frame", "m4xGossipSkip", UIParent);

frame:RegisterEvent("GOSSIP_SHOW");

frame:SetScript("OnEvent", function(self, event, ...)
    if (GetNumGossipAvailableQuests() == 0) and (GetNumGossipActiveQuests() == 0) and (GetNumGossipOptions() == 1) and not ForceGossip() then
        local _, gossipType = GetGossipOptions();
        if gossipType == "gossip" then
            SelectGossipOption(1);
        end
    end
end);