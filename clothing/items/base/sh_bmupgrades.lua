local PLUGIN = PLUGIN

ITEM.name = "Upgrade"
ITEM.description = "An Upgrade. It goes on an outfit."
ITEM.category = "Clothing"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 1
ITEM.slot = 1
ITEM.quantity = 1
ITEM.flag = "R"
ITEM.isAttachment = true
ITEM.isClothing = false

local function attachment(item, data, combine)
    local client = item.player
    local char = client:GetChar()
    local inv = char:GetInv()
    local items = inv:GetItems()
	local id = 0
    local target = {}
    local bmID = nil
	
	for k,v in pairs(data) do
		id = v
	end
	
    for k, invItem in pairs(items) do
        if (data) then
            if (invItem:GetID() == id) then
                target = invItem
                break
            end
        else
            if (invItem.isClothing) then
                target = invItem
                break
            end
        end
    end
    if (!target) then
        client:NotifyLocalized("No Target")
        return false
    else
        local mods = target:GetData("mod", {})
        local d = PLUGIN:GetSpecificClothing(client, target.bmSlot)
        if (mods[item.slot]) then
            client:NotifyLocalized("Slot Filled")
            return false
        end
        
        curPrice = target:GetData("RealPrice")
	    if !curPrice then
		    curPrice = target.price
		end
		
		
		local pass = false
        for a,b in pairs(item.models) do
			if b == target.bmModel then
				pass = true
			end
		end
		
		if pass == false then
			client:NotifyLocalized("Incompatible/Must Equip")
			return false
		end
		
		local bodygs = target:GetData("Bodygroups",{})
		
		if item.depnames ~= nil then
			for k,v in pairs(item.depnames) do
				local x = d:FindBodygroupByName(v)
				if x >= 0 then
					if bodygs[x][2] ~= item.depy then
						client:NotifyLocalized("Requires "..v)
						return false
					end
				end
			end
		end
		
		for k,v in pairs(item.bgnames) do
			local x = d:FindBodygroupByName(v)
			if x >= 0 and d:GetModel() == target.bmModel then
				bodygs[x] = {x,item.bgy}
				d:SetBodygroup(x,item.bgy)
			end
		end
		
		target:SetData("Bodygroups",bodygs)
        target:SetData("RealPrice", (curPrice + item.price))
        
        mods[item.slot] = {item.uniqueID, item.name}
        target:SetData("mod", mods)
        local itemweight = item.weight or 0
		local itemap = item.ap or 1
        local targetweight = target:GetData("weight",0)
        local totweight = itemweight + targetweight
		local totap = itemap + target:GetData("addap",0)
        target:SetData("weight", totweight)
		target:SetData("addap",totap)
		client.armor.ap = (totap + target.ap)
        target.weight = totweight
		client:EmitSound("cw/holster4.wav")
        return true
    end

    client:NotifyLocalized("noArmor")
    return false
end

ITEM.functions.Upgrade = {
    name = "Upgrade",
    tip = "Puts this upgrade on the specified piece of clothing.",
    icon = "icon16/wrench.png",
    
    
    OnCanRun = function(item)
		return (!IsValid(item.entity))
    end,
	
    OnRun = function(item, data)
		return attachment(item, data, false)
	end,
    
    isMulti = true,
    
    multiOptions = function(item, client)
        local targets = {}
        local char = client:GetChar()
        if (char) then
            local inv = char:GetInv()
            if (inv) then
                local items = inv:GetItems()
                for k, v in pairs(items) do
                    if (v.isClothing) then
                        for m, a in pairs(item.models) do
                            if v.bmModel == a then
                                table.insert(targets, {
                                    name = L(v.name),
                                    data = {v:GetID()},
                                })
                            else
                                continue
                            end
                        end
					else
						continue
					end
				end
			end
		end
    return targets
	end,
}

ITEM.functions.Sell =
{
    name = "Sell",
    tip = "Sells Item",
    icon = "icon16/money.png",
    
    OnRun = function(item)
        local player = item.player;
        local character = player:GetChar();
		character:GiveMoney(item.price);
		item:Remove()
		player:NotifyLocalized("Item sold for "..item.price)
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
        local character = player:GetChar();
		player:NotifyLocalized("Item is worth " .. (item.price) .. " if sold")
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

function ITEM:GetDescription()
	local description = self.description
	description = description.."\nWeight: "..self.weight.."kg" .. "\nAP: " .. self.ap
	return description
end