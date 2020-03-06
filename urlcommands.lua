local PLUGIN = PLUGIN
PLUGIN.name = "URL Commands"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Adds Chat commands for URLs."

PLUGIN.urls = {
	["Discord"] = "http://www.shavargo.com/",
	["Forums"] = "http://www.shavargo.com/"
    ["Content"] = "http://www.shavargo.com/"
}

-- Adding commands for URLs.
for k,v in pairs(PLUGIN.urls) do
    ix.command.Add(k, {
        description = "Directs you to our " .. k .. ".",
        OnRun = function(self, client)
            local lua = "gui.OpenURL('" .. v .. "')" 
            client:SendLua(lua)
        end
    })
end