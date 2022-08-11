require "TimedActions/ISBaseTimedAction"
ISRepairWindow = ISBaseTimedAction:derive("ISRepairWindow");

function ISRepairWindow:isValid()
	return true
end

function ISRepairWindow:waitToStart()
	self.character:faceThisObject(self.window)
	return self.character:shouldBeTurning()
end

function ISRepairWindow:update()
	self.character:faceThisObject(self.window)
end

function ISRepairWindow:start()
	self:setActionAnim(CharacterActionAnims.Paint)
	self:setOverrideHandModels("Woodglue", nil);
    self.character:faceThisObject(self.window)
    self.sound = self.character:playSound("Painting")
end

function ISRepairWindow:stop()
	ISBaseTimedAction.stop(self);
end

function ISRepairWindow:perform()
    self.character:getInventory():Remove(self.glass)
    if (self.glue:getUsedDelta() - self.glue:getUseDelta()) <= (self.glue:getUseDelta() / 2) then
        self.character:getInventory():Remove(self.glue)
    else
        self.glue:setUsedDelta(self.glue:getUsedDelta() - self.glue:getUseDelta())
    end
	self.window:setSmashed(false);
	self.window:setGlassRemoved(true);
	self.window:setPermaLocked(false);
	self.window:setIsLocked(false);
	-- Still can't get this to sync in multiplayer
	-- self.window:sendObjectChange('state')
	-- self.character:reportEvent("EventRepairWindowPane");
	-- if isClient() then
	-- 	self.window:transmitCompleteItemToServer();
	-- end
	-- triggerEvent("OnObjectAdded", self.window)

	ISBaseTimedAction.perform(self)
end

function ISRepairWindow:new(character, window, glass, glue)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
    o.stopOnWalk = true;
	o.stopOnRun = true;
	o.window = window
	o.glass = glass
    o.glue = glue
	o.maxTime = 100
	if o.character:isTimedActionInstant() then o.maxTime = 1 end
	return o
end
