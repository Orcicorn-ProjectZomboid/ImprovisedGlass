
-- Give back the recipe result AND include the original roasting pan too
function ImprovisedGlass_GiveBackRoastingPan(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.RoastingPan");
end