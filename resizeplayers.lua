PLUGIN.name = "Resizable Characters"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Allows resizable Characters based upon their specified height."


-- Spawn Check
function PLUGIN:PlayerSpawn(client)
	PLUGIN:SetCustomHeight(client)
end

-- Processes the client for their height and scales them
function PLUGIN:SetCustomHeight(client, height)
	local character = client:GetCharacter()
	-- Sets the specified height
	local foundHeight
	-- Initalize Scale Variable
	local scale
	-- MODIFY the table for additional heights and their scales
	local heightTable = {
		["4'10"] = 0.88,
		["4'11"] = 0.89,
		["5'0"] = 0.90,
		["5'1"] = 0.91,
		["5'2"] = 0.92,
		["5'3"] = 0.93,
		["5'4"] = 0.94,
		["5'5"] = 0.95,
		["5'6"] = 0.96,
		["5'7"] = 0.97,
		["5'8"] = 0.98,
		["5'9"] = 0.99,
		["5'10"] = 1.00,
		["5'11"] = 1.01,
		["6'0"] = 1.02,
		["6'1"] = 1.03,
		["6'2"] = 1.04,
		["6'3"] = 1.05,
		["6'4"] = 1.06
	}
	-- Table of the bones to modify
	local boneTable = { 
		"ValveBiped.Bip01_Head1",
		"ValveBiped.Bip01_Neck1",
		"ValveBiped.Bip01_Spine4",
		"ValveBiped.Bip01_Spine2",
		"ValveBiped.Bip01_Spine1",
		"ValveBiped.Bip01_Spine",
		"ValveBiped.Bip01_R_UpperArm",
		"ValveBiped.Bip01_R_Forearm",
		"ValveBiped.Bip01_R_Hand",
		"ValveBiped.Bip01_L_UpperArm",
		"ValveBiped.Bip01_L_Forearm",
		"ValveBiped.Bip01_L_Hand",
		"ValveBiped.Bip01_R_Thigh",
		"ValveBiped.Bip01_R_Calf",
		"ValveBiped.Bip01_R_Foot",
		"ValveBiped.Bip01_R_Toe0",
		"ValveBiped.Bip01_L_Thigh",
		"ValveBiped.Bip01_L_Calf",
		"ValveBiped.Bip01_L_Foot",
		"ValveBiped.Bip01_L_Toe0"
	}
	-- Gets height
	if (height) then
		foundHeight = height
	else
		-- Gets the Physical Description since its not specified
		local description = character:GetDescription()
		-- Searches the string for the height
		foundHeight = string.match(description, "%d'?%d%d?")
	end
	-- Set the scale on the character and their bones
	if (heightTable[foundHeight]) then
		scale = heightTable[foundHeight]
		character:SetModelScale(scale, 1)
		for k,v in pairs(boneTable) do
			local boneID = character:LookupBone(v)
			local boneScale = 1/scale
			character:ManipulateBoneScale(boneID, Vector(boneScale, boneScale, boneScale))
		end
	end
end

ix.command.Add("CharSetHeight", {
	description = "Sets the Character's height.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		bit.bor(ix.type.string, ix.type.optional)
	},
	OnRun = function(self, client, target, height)
		-- show string request if no flags are specified
        PLUGIN:SetCustomHeight(target, height)
	end
})