
-- Give back the recipe result AND include the original roasting pan too
function ImprovisedGlass_GiveBackRoastingPan(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.RoastingPan");
end

-- Give back a glass pane and the original responses
function ImprovisedGlass_GiveBackGlassPane(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("ImprovisedGlass.GlassPane");
end

-- Grant XP for Wooden Windows
function ImprovisedGlass_XPMakeWindowWood(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 10);
end
function ImprovisedGlass_XPDestroyWindowWood(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 5);
end

-- Grant XP for Metal Windows
function ImprovisedGlass_XPMakeWindowMetal(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 10);
end
function ImprovisedGlass_XPDestroyWindowMetal(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 5);
end

-- Grant XP on Cooking Glass
function ImprovisedGlass_XPMakeGlass(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 1);
end

-- Grant XP for Mechanic Windows
function ImprovisedGlass_XPMakeWinshieldCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end
function ImprovisedGlass_XPMakeWindowCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 5);
end