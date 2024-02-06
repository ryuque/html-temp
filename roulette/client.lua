local rewarditem = {
    Common = {
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
    },
    Rare = {
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
    },
    Super = {
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
    },
    Legend = {
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
        {itemid = '10kgoldchain', itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', amount = 1},
    },
}
local rewardrate = {
    Common = 40,
    Rare = 30,
    Super = 20,
    Legend = 10,
}

RegisterCommand('gacha', function(source, args, rawCommand)
    startroulette(rewarditem, rewardrate)
end)

function startroulette(rewarditem, rewardrate)
    local selectedCategory = nil
    if rewardrate.Common == nil then rewardrate.Common = 0 end
    if rewardrate.Rare == nil then rewardrate.Rare = 0 end
    if rewardrate.Super == nil then rewardrate.Super = 0 end
    if rewardrate.Legend == nil then rewardrate.Legend = 0 end
    local totalrate = rewardrate.Common + rewardrate.Rare + rewardrate.Super + rewardrate.Legend
    local hitrate = math.random(1,totalrate)
    -- hitrateがどの報酬に当たったかを計算
    if hitrate <= rewardrate.Common then
        selectedCategory = rewarditem.Common
    elseif hitrate <= rewardrate.Common + rewardrate.Rare then
        selectedCategory = rewarditem.Rare
    elseif hitrate <= rewardrate.Common + rewardrate.Rare + rewardrate.Super then
        selectedCategory = rewarditem.Super
    else
        selectedCategory = rewarditem.Legend
    end
    local selectedItemIndex = math.random(1, #selectedCategory)
    local selectedItem = selectedCategory[selectedItemIndex]

    local hit = math.random(0,19)




    local item =  {
        { number = 0, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity =  'Common' },
        { number = 1, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 2, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Super' },
        { number = 3, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 4, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 5, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 6, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Common' },
        { number = 7, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 8, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Super' },
        { number = 9, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Common' },
        { number = 10, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 11, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 12, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 13, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Common' },
        { number = 14, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 15, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Super' },
        { number = 16, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Common' },
        { number = 17, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Rare' },
        { number = 18, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Common' },
        { number = 19, itemname = '金のネックレス', imageURL = 'img/10kgoldchain.png', rarity = 'Legend' },
    }

    
    local count = 1
        SendNUIMessage({
            type = 'gacha',
            data = item,
            hitnum = hit,
            getitem = selectedItem.itemid,
            amount = selectedItem.amount,
        })
        SetNuiFocus(true, true)
end




RegisterNUICallback('close', function(data, cb)
    print(data.itemname)
    print(data.amount)
    SetNuiFocus(false, false)
    cb("ok")
end)