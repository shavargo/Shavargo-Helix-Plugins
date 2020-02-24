local PLUGIN = PLUGIN

ITEM.name = "Nice name"
ITEM.description = "Nice desc"
ITEM.width = 2
ITEM.height = 2
ITEM.isClothing = true
ITEM.price = 1
ITEM.model = "models/props_c17/BriefCase001a.mdl"
ITEM.ap = 1
ITEM.quantity = 1

ITEM.bmSlot = "head"
ITEM.bmModel = "models/stardust/outfits/headgear_combattactical.mdl"
ITEM.bmSkin = 0

ITEM:Hook("drop", function(item)
	if (item:GetData("equip")) then
		item:SetData("equip", nil)

		PLUGIN:killSpecificClothing(item.player, item.bmSlot)

		for k, v in pairs(PLUGIN.DefaultClothes) do
			if k == item.bmSlot then
				PLUGIN:createClothing(item.player, item.bmSlot, v["bmModel"], item.bmSkin)
			end
		end

	end
end)

ITEM.functions.RemoveUpgrade = {
	name = "Remove",
	tip = "Remove",
	icon = "icon16/wrench.png",
    isMulti = true,
    multiOptions = function(item, client)
	
	local targets = {}

	for k, v in pairs(item:GetData("mod", {})) do
    local attTable = ix.item.list[v[1]]
    local niceName = attTable:GetName()
    table.insert(targets, {
		name = niceName,
		data = {k},
    })
    end
    return targets
end,
	OnCanRun = function(item)
		if (table.Count(item:GetData("mod", {})) <= 0) then
			return false
		end
				
		return (!IsValid(item.entity))
	end,
	OnRun = function(item, data)
		local client = item.player
		local target = data
		local char = client:GetChar()
		
		for k,v in pairs(data) do
			data = v
		end
		
		if (data) then
			local char = client:GetChar()
			if (char) then
				local inv = char:GetInv()
				if (inv) then
					local mods = item:GetData("mod", {})
					local attData = mods[data]
					local bodygs = item:GetData("Bodygroups",{})
					if (attData) then
						
                        curPrice = item:GetData("RealPrice")
						if !curPrice then
                			curPrice = item.price
						end
						
                        item:SetData("RealPrice", (curPrice - ix.item.list[attData[1]].price))
                        
						
						local nomodel = true
						local b = PLUGIN:GetSpecificClothing(client, item.bmSlot)
						for k,v in pairs(ix.item.list[attData[1]]) do
							if b ~= nil then
								for x,y in pairs(ix.item.list[attData[1]].bgnames) do
									local x = b:FindBodygroupByName(y)
									if x >= 0 then 
										b:SetBodygroup(x,0)
										bodygs[x] = nil
									end
								end 
								nomodel = false
							end
						end
						
						if nomodel == true then 
							client:NotifyLocalized("Equip Outfit")
							return false 
						end
						
						item:SetData("Bodygroups",bodygs)
						
						local itemweight = item:GetData("weight",0)
						local itemap = item:GetData("addap",0)
                        local targetweight = ix.item.list[attData[1]].weight
                        local totweight = itemweight - targetweight
						local totap = itemap - ix.item.list[attData[1]].ap
                        item:SetData("weight",totweight)
						item:SetData("addap",totap)
						client.armor.ap = (totap + item.ap)
                        item.weight = totweight
						
						client:EmitSound("cw/holster4.wav")
						inv:Add(attData[1])
						
						mods[data] = nil
						if (table.Count(mods) == 0) then
							item:SetData("mod", nil)
						else
							item:SetData("mod", mods)
						end
						
					else
						client:NotifyLocalized("Not an Upgrade")
					end
				end
			end
		else
			client:NotifyLocalized("detTarget")
		end
	return false
end,
}

ITEM.functions.UnEquip =
{
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	OnRun = function(item)
		local client = item.player
		local char = client:GetChar()
		
		client.armor = client.armor or {}
		
		PLUGIN:killSpecificClothing(client, item.bmSlot)

		for k, v in pairs(PLUGIN.DefaultClothes) do
			if k == item.bmSlot then
				PLUGIN:createClothing(client, k, v["bmModel"], item.bmSkin)
			end
		end
		
		
		client.armor["ap"] = 0
		
		item:SetData("equip", false)
		return false
	end,

	OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("equip") == true)
	end
}

ITEM.functions.Equip =
{
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
		OnRun = function(item)
		local client = item.player
		local items = client:GetChar():GetInv():GetItems()
		local char = client:GetChar()
		client.armor = client.armor or {}
		
		PLUGIN:killSpecificClothing(client, item.bmSlot)

		PLUGIN:createClothing(client, item.bmSlot, item.bmModel, item.bmSkin)

		timer.Simple( 1, function() 
			local d = PLUGIN:GetSpecificClothing(client, item.bmSlot)
			
			for k,v in pairs(item:GetData("Bodygroups",{})) do
				d:SetBodygroup(k,v[2])
			end
		end )
		
		client.armor["ap"] = (item:GetData("addap",0) + item.ap)
		item:SetData("equip", true)
        client:SetupHands()
		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("equip") ~= true and item.player:GetChar():GetModel() == item.player:GetModel())
	end
}

ITEM.functions.Sell =
{
    
    name = "Sell",
    tip = "Sells Item",
    icon = "icon16/money.png",
    
    OnRun = function(item)
        local player = item.player;
		local character = player:GetChar();
        
        curPrice = item:GetData("RealPrice")
	    if !curPrice then
		    curPrice = item.price
		end

        if item:GetData("equip", true) then
			PLUGIN:killSpecificClothing(player, item.bmSlot)
			for k, v in pairs(PLUGIN.DefaultClothes) do
				if k == item.bmSlot then
					PLUGIN:createClothing(player, k, v["bmModel"], v["bmSkin"])
				end
			end
    		item:SetData("equip", false)
		end
        
		character:GiveMoney(curPrice);
		item:Remove()
		player:NotifyLocalized("Item sold for " .. curPrice)
        return false
    end;
	
    OnCanRun = function(item)
        local char = item.player:GetChar()
        if( char:HasFlags("a")
    	    )
    	then
    		return (!IsValid(item.entity))
    	else
    	    return false
	    end
	end;
}

ITEM.functions.SellPriceCheck =
{
    
    name = "Check Value",
    tip = "Checks the value of the item you will receive",
    icon = "icon16/money_dollar.png",
    
        OnRun = function(item)
        local player = item.player;
        
        curPrice = item:GetData("RealPrice")
	    if !curPrice then
		    curPrice = item.price
		end
        
		player:NotifyLocalized("Item is worth " .. curPrice .. " if sold")
        return false
    end;
	
    OnCanRun = function(item)
        local char = item.player:GetChar()
        if( char:HasFlags("a")
    	    )
    	then
    		return (!IsValid(item.entity))
    	else
    	    return false
	    end
	end;
}

function ITEM:onCanBeTransfered(oldInventory, newInventory) return true end
function ITEM:onTransfered()
	if self:GetData("equip") then self:SetData("equip", false) end
end

function ITEM:onInstanced()
	return
end

function ITEM:OnLoadout()
	if (self:GetData("equip")) then
		local client = self.player
		local char = client:GetChar()
		timer.Simple( 1, function() 
			PLUGIN:killSpecificClothing(client, self.bmSlot)

			PLUGIN:createClothing(client, self.bmSlot, self.bmModel, self.bmSkin)
			timer.Simple( 1, function() 
				local d = PLUGIN:GetSpecificClothing(client, self.bmSlot)
				
				for k,v in pairs(self:GetData("Bodygroups",{})) do
					d:SetBodygroup(k,v[2])
				end 
			end )
		end )
		--self:SetData("equip", false)
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		local durability = math.Round(item:GetData("durability", 10000)/100)
		surface.SetDrawColor(item:GetData("equip") and Color(110, 255, 110, 100) or Color(255, 110, 110, 100))
		surface.DrawRect(w - 14, 14, 8, 8)
	end
end

function ITEM:GetDescription()
	local description = self.description
	local weight = self:GetData("weight",0)
	weight = weight + self.weight
	description = description.."\nWeight: "..weight.."kg"
	description = description.."\n[*] AP: "..(self:GetData("addap",0) + self.ap)

    local attachnames = ""

    for k, v in pairs(self:GetData("mod", {})) do
        local attTable = ix.item.list[v[1]]
        local niceName = attTable:GetName()
        attachnames = attachnames .. "\n" .. niceName
    end
    
    description = description .. attachnames

	return description
end