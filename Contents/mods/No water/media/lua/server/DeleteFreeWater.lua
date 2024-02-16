local function IsWaterContainer(object)
    return (object:hasWater() and (not object:getUsesExternalWaterSource()))
end

local function DeleteWater(square)
    if square:Is(IsoFlagType.waterPiped) then
        local objectArray = square:getObjects()
        for i = 0, objectArray:size() - 1 do
            local object = objectArray:get(i)
            if IsWaterContainer(object) then
                object:setWaterAmount(0)
            end
        end
    end
end

Events.LoadGridsquare.Add(DeleteWater)