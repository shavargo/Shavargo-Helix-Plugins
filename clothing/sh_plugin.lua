local PLUGIN = PLUGIN
PLUGIN.name = "Clothing System"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Clothing system utilizing bonemerging."

ix.util.Include("sv_hooks.lua")
ix.util.Include("sh_items.lua")

DMG_IGNORE = DMG_IGNORE or {}
DMG_IGNORE[DMG_BULLET] = true
DMG_IGNORE[DMG_SNIPER] = true
DMG_IGNORE[DMG_BUCKSHOT] = true

PLUGIN.DefaultClothes = {
    ["torso"] = {
        ["bmModel"] = "models/stardust/outfits/outfit_citizentunic.mdl",
        ["bmSkin"] = 0
    }
}

function PLUGIN:EntityTakeDamage(entity, damage)
    if entity.armor and not DMG_IGNORE[damage:GetDamageType()] then
		local armor = (entity.armor.ap*0.01) or 1
        local scale = math.log(armor + 1)
		
		if hitGroup == 4 or hitGroup == 5 or hitGroup == 6 or hitGroup == 7 then
			scale = (scale * 0.5)
		elseif hitGroup == 3 then
			scale = (scale * 0.75)
		elseif hitGroup == 1 then
			scale = (scale * 2)
		end
		print(scale)
		damage:ScaleDamage(1 - scale)
    end
end

function PLUGIN:killAllClothing(client)
    if ents.FindByClassAndParent("prop_physics", client) ~= nil then
        for k,v in pairs(ents.FindByClassAndParent("prop_physics", client)) do
            v:Remove()
        end
    end
end

function PLUGIN:killSpecificClothing(client, id)
    if ents.FindByClassAndParent("prop_physics", client) ~= nil then
        for k,v in pairs(ents.FindByClassAndParent("prop_physics", client)) do
            if v:GetName() == id then
                v:Remove()
            end
        end
    end
end

function PLUGIN:GetSpecificClothing(client, id)
    if ents.FindByClassAndParent("prop_physics", client) ~= nil then
        for k,v in pairs(ents.FindByClassAndParent("prop_physics", client)) do
            if v:GetName() == id then
                return v
            end
        end
    else
        return false
    end
end

function PLUGIN:createClothing(client, slot, model, skin)
    local po = ents.Create("prop_physics")
    po:SetModel(model)
    po:SetParent(client, 1)
    po:SetName(slot)
    if skin ~= nil then
        po:SetSkin(skin)
    end
    po:SetPos(Vector(0, 0, 0))
    po:SetAngles(Angle(0,0,0))
    po:AddEffects(EF_BONEMERGE)
end

function PLUGIN:PlayerSpawn(client, curChar, prevChar)
    if client:GetCharacter() ~= nil then
        for k, v in pairs(self.DefaultClothes) do
            local character = client:GetCharacter()
            PLUGIN:createClothing(client, k, v["bmModel"], v["bmSkin"])
        end
    end
end

function PLUGIN:PostPlayerDeath(ply)
    PLUGIN:killAllClothing(ply)
end