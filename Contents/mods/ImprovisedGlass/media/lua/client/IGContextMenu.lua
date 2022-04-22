
function IGDebug(message)
    print("DEBUG: " .. message)
end

function ImprovisedGlassRightClick(playerID, context, worldobjects, test)
    -- Check if you have a Glass Pane
    local player = getSpecificPlayer(playerID);
    local inventory = player:getInventory();
    local glass = inventory:getAllEvalRecurse(function(item, player)
        return item:getType() == 'GlassPane'
    end, ArrayList.new())
    local glue = inventory:getAllEvalRecurse(function(item, player)
        return item:getType() == 'Woodglue'
    end, ArrayList.new())

    -- Do you have glass?
    if glass:size() <= 0 then
        IGDebug("no glass")
        return
    end

    -- Do you ahve wood glue?
    if glue:size() <= 0 then
        IGDebug("no glue")
        return
    end

    for _, object in ipairs(worldobjects) do
        local objects = object:getSquare():getObjects()
        for i = 0, objects:size() -1 do
            if instanceof(objects:get(i), 'IsoWindow') then
                if objects:get(i):isGlassRemoved() and not objects:get(i):isBarricaded() then
                    IGDebug("It's a smashed window")
                    context:addOption(getText('ContextMenu_IGRepairWindow'), worldobjects, ImprovisedGlassRepairWindow, player, window, glass:get(0), glue:get(0))
                    return
                else 
                    IGDebug("Fine/shards/barricaded")
                end
            else
                IGDebug("not window")
            end
        end
    end
end

function ImprovisedGlassRepairWindow(worldobjects, player, window, glass, glue)
    if luautils.walkAdjWindowOrDoor(player, window:getSquare(), window) then
        ISTimedActionQueue.add(ISRepairWindow:new(player, window, glass, glue))
    end
end



function ImprovisedGlassRepairWindow2(worldobjects, player, window, glass, glue) 
    if luautils.walkAdjWindowOrDoor(player, window:getSquare(), window) then

        IGDebug("Fixing the window")
        player:getInventory():Remove(glass)
        if math.floor(glue:getUsedDelta() - glue:getUseDelta()) <= 0 then
            IGDebug("Glue is empty, delete")
            player:getInventory():Remove(glue)
        else 
            IGDebug("Removing some glue")
            glue:setUsedDelta(glue:getUsedDelta()-glue:getUseDelta())
        end
        window:setSmashed(false)
    end
end


Events.OnFillWorldObjectContextMenu.Add(ImprovisedGlassRightClick)