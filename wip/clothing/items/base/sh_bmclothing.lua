local PLUGIN = PLUGIN

ITEM.name = "BMClothing"
ITEM.description = "A piece of clothing. You wear it."
ITEM.category = "Clothing"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 1
ITEM.slot = 1
ITEM.flag = "O"
ITEM.bmSlot = "torso"
ITEM.bmModel = "models/projectpt/suits/male_sunrise.mdl"

local function bmUpdate(item)
    local client = item.player
    local char = client:GetChar()
    local bmID = char:GetID() .. item.bmSlot
    local inv = char:GetInv()
    local items = inv:GetItems()

    PLUGIN:killClothes(client)
    PLUGIN:createClothes(client, bmID, item.bmModel)
end

local function bmUnequip(item)
    local client = item.player
    local char = client:GetChar()
    local bmID = char:GetID() .. item.bmSlot
    local inv = char:GetInv()
    local items = inv:GetItems()

    for k, v in pairs(PLUGIN.DefaultClothes) do
        if v["name"] == item.bmSlot then
            PLUGIN:killSecClothes(client, bmID)
            PLUGIN:createClothes(client, bmID, v["model"])
        end
    end
end

ITEM.functions.Equip = {
    name = "Equip",
    tip = "Puts this piece of clothing on.",
    icon = "icon16/wrench.png",
    OnCanRun = function(item)
        return (!IsValid(item.entity))
    end,
    OnRun = function(item, data)
        bmUpdate(item)
        return false
    end,
}

ITEM.functions.Unequip = {
    name = "Unequip",
    tip = "Takes this piece of clothing off.",
    icon = "icon16/wrench.png",
    OnCanRun = function(item)
        return (!IsValid(item.entity))
    end,
    OnRun = function(item, data)
        bmUnequip(item)
        return false
    end,
}

ITEM.functions.Sell = {
    name = "Sell",
    tip = "Sells Item",
    icon = "icon16/money.png",
    OnRun = function(item)
        local player = item.player;
        local character = player:GetChar();
        character:GiveMoney((item.price * 0.9));
        item:Remove()
        player:NotifyLocalized("Item sold for " .. (item.price*0.9))
        return false
    end;
    OnCanRun = function(item)
        local char = item.player:GetChar()
        if(char:HasFlags("O")) then
            return (!IsValid(item.entity))
        else
            return false
        end
    end;
}

ITEM.functions.SellPriceCheck = {
    name = "Check Value",
    tip = "Checks the value of the item you will receive",
    icon = "icon16/money_dollar.png",
    OnRun = function(item)
        local player = item.player;
        local character = player:GetChar();
        player:NotifyLocalized("Item is worth " .. (item.price*0.9) .. " if sold")
        return false
    end;
    OnCanRun = function(item)
        local char = item.player:GetChar()
        if(char:HasFlags("O")) then
            return (!IsValid(item.entity))
        else
            return false
        end
    end;
}