local PLUGIN = PLUGIN

PLUGIN.name = "Tying"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Ported from HL2RP; Adds the ability to tie players."

ix.lang.AddTable("english", {
	tying = "Tying...",
	unTying = "Untying...",
	isTied = "Tied",
	fTiedUp = "You have been tied up.",
	fBeingTied = "You are being tied up.",
	tiedUp = "They have been tied up.",
	beingTied = "They are being tied up.",
	beingUntied = "They are being untied."
})

if (SERVER) then
	function PLUGIN:PlayerUse(client, entity)
		if (!client:IsRestricted() and entity:IsPlayer() and entity:IsRestricted() and !entity:GetNetVar("untying")) then
			entity:SetAction("@beingUntied", 5)
			entity:SetNetVar("untying", true)

			client:SetAction("@unTying", 5)

			client:DoStaredAction(entity, function()
				entity:SetRestricted(false)
				entity:SetNetVar("untying")
			end, 5, function()
				if (IsValid(entity)) then
					entity:SetNetVar("untying")
					entity:SetAction()
				end

				if (IsValid(client)) then
					client:SetAction()
				end
			end)
		end
	end

	function PLUGIN:PlayerLoadout(client)
		client:SetNetVar("restricted")
	end

	function PLUGIN:CanPlayerJoinClass(client, class, info)
		if (client:IsRestricted()) then
			client:Notify("You cannot change classes when you are restrained!")
			return false
		end
	end

	function PLUGIN:SearchPlayer(client, target)
		if (!target:GetCharacter() or !target:GetCharacter():GetInventory()) then
			return false
		end

		local name = hook.Run("GetDisplayedName", target) or target:Name()
		local inventory = target:GetCharacter():GetInventory()

		ix.storage.Open(client, inventory, {
			entity = target,
			name = name
		})

		return true
	end
end

if (CLIENT) then
	function PLUGIN:PopulateCharacterInfo(client, character, tooltip)
		if (client:IsRestricted()) then
			local panel = tooltip:AddRowAfter("name", "ziptie")
			panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
			panel:SetText(L("tiedUp"))
			panel:SizeToContents()
		elseif (client:GetNetVar("tying")) then
			local panel = tooltip:AddRowAfter("name", "ziptie")
			panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
			panel:SetText(L("beingTied"))
			panel:SizeToContents()
		elseif (client:GetNetVar("untying")) then
			local panel = tooltip:AddRowAfter("name", "ziptie")
			panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
			panel:SetText(L("beingUntied"))
			panel:SizeToContents()
		end
	end
end

do
	local COMMAND = {}

	function COMMAND:OnRun(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:IsRestricted()) then
			if (!client:IsRestricted()) then
				PLUGIN:SearchPlayer(client, target)
			else
				return "@notNow"
			end
		end
	end

	ix.command.Add("CharSearch", COMMAND)
end