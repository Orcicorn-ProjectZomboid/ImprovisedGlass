
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
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeWindowWood(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 10);
end
function Recipe.OnGiveXP.ImprovisedGlass_XPDestroyWindowWood(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 5);
end

-- Grant XP for Metal Windows
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeWindowMetal(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 10);
end
function Recipe.OnGiveXP.ImprovisedGlass_XPDestroyWindowMetal(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 5);
end

-- Grant XP on Cooking Glass
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeGlass(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 1);
end

-- Grant XP for Mechanic Windows
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeWinshieldCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeWindowCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 5);
end
