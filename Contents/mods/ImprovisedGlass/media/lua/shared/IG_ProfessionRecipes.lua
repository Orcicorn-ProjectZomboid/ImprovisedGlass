
-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function IGAddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Adjust Engineers with Glass Smelting by Default
    if profession == "engineer" then
        player:learnRecipe("IGPrepareGlassShards");
        player:learnRecipe("IGUnprepareGlassShards");
        player:learnRecipe("IGRemoveGlassPane");
    end

    -- Adjust Carpenters with Windows by Default
    if profession == "carpenter" then
        player:learnRecipe("IGMakeWindow01");
        player:learnRecipe("IGMakeWindow02");
        player:learnRecipe("IGMakeWindow03");
        player:learnRecipe("IGMakeWindow04");
        player:learnRecipe("IGMakeWindow05");
        player:learnRecipe("IGMakeWindow06");
    end   

    -- Adjust Mechanics with Windows by Default
    if profession == "mechanics" then
        player:learnRecipe("IGWindshield1")
        player:learnRecipe("IGWindshield2")
        player:learnRecipe("IGWindshield3")

        player:learnRecipe("IGRearWindshield1")
        player:learnRecipe("IGRearWindshield2")
        player:learnRecipe("IGRearWindshield3")

        player:learnRecipe("IGFrontWindow1")
        player:learnRecipe("IGFrontWindow2")
        player:learnRecipe("IGFrontWindow3")

        player:learnRecipe("IGRearWindow1")
        player:learnRecipe("IGRearWindow2")
        player:learnRecipe("IGRearWindow3")
    end

    -- Construction worker knows how to smelt glass
    if profession == "constructionworker" then
        player:learnRecipe("IGPrepareGlassShards")
        player:learnRecipe("IGUnprepareGlassShards")
        player:learnRecipe("IGRemoveGlassPane")
    end
end

-- Character loads into the world
Events.OnCreatePlayer.Add(IGAddRecipesToExistingPlayers);
