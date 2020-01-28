local PLUGIN = PLUGIN
PLUGIN.name = "Clothing System"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Clothing system utilizing bonemerging."

PLUGIN.DefaultClothes = {
    [0] = {
        ["name"] = "torso",
        ["model"] = "models/stardust/outfits/outfit_citizentunic.mdl",
    }
}
function PLUGIN:spawnDefaultClothes(client)
    for k, v in pairs(self.DefaultClothes) do
        local character = client:GetCharacter()
        local entName = character:GetID() .. v["name"]
        local charClothing = ents.Create("prop_physics")
            charClothing:SetModel(v["model"])
            charClothing:SetParent(client, 1)
            charClothing:SetName(entName)
            charClothing:SetPos(Vector(0,0,0))
            charClothing:SetAngles(Angle(0,0,0))
            charClothing:AddEffects(EF_BONEMERGE)
    end
end

function PLUGIN:killAllClothes(client)
    if ents.FindByClassAndParent("prop_physics", client) ~= nil then
        for k,v in pairs(ents.FindByClassAndParent("prop_physics", client)) do
            v:Remove()
        end
    end
end

function PLUGIN:killSecClothes(client, id)
    if ents.FindByClassAndParent("prop_physics", client) ~= nil then
        for k,v in pairs(ents.FindByClassAndParent("prop_physics", client)) do
            if v:GetName() == id then
                v:Remove()
            end
        end
    end
end

function PLUGIN:createClothes(client, id, model)
    local po = ents.Create("prop_physics")
    po:SetModel(model)
    po:SetParent(client, 1)
    po:SetName(id)
    po:SetPos(Vector(0,0,0))
    po:SetAngles(Angle(0,0,0))
    po:AddEffects(EF_BONEMERGE)
end

function PLUGIN:PlayerSpawn(client, curChar, prevChar)
   PLUGIN:spawnDefaultClothes(client)
end

function PLUGIN:PlayerDeath(victim, inflictor, attacker)
    PLUGIN:killAllClothes(vicitim)
end