
-- -- functions
-- function GetVehicleFromTableByVehicleId(vehicle)
--     for k,v in pairs(Config.vehicles) do
--         if GetEntityModel(vehicle) == GetHashKey(v.spawnName) then
--             return true, v
--         end
--     end
-- end

-- -- thread
-- CreateThread(function()
--     while true do
        
--         local veh = GetVehiclePedIsIn(PlayerPedId())
--         local passed, vehConfig = GetVehicleFromTableByVehicleId(veh)

--         if passed then
--             local speed = 0
--             local vehHealth = GetVehicleBodyHealth(veh)
                
--             if vehHealth > Config.healthThreshold then
--                 if Config.useKPH then
--                     speed = GetEntitySpeed(Entity(veh)) * 3.6
--                 else
--                     speed = GetEntitySpeed(Entity(veh)) * 2.236936
--                 end

--                 -- if slow
--                 if speed < Config.speedThreshold then
--                     -- enable pExtras
--                     for k,v in pairs(vehConfig.pExtras) do
--                         SetVehicleExtra(veh, v, 0)
--                     end
--                     -- disable dExtras
--                     for k,v in pairs(vehConfig.dExtras) do
--                         SetVehicleExtra(veh, v, 1)
--                     end
--                 -- if fast
--                 else
--                     -- disable pExtras
--                     for k,v in pairs(vehConfig.pExtras) do
--                         SetVehicleExtra(veh, v, 1)
--                     end
--                     -- enable dExtras
--                     for k,v in pairs(vehConfig.dExtras) do
--                         SetVehicleExtra(veh, v, 0)
--                     end
--                 end
--             end
            
--         end
--         Wait(Config.delay*1000)
--     end
-- end)






































local veh = GetVehiclePedIsIn(PlayerPedId())
local myVehParked = false

-- functions
function GetVehicleFromTableByVehicleId(vehicle)
    for k,v in pairs(Config.vehicles) do
        -- find which vehicle matches
        if GetEntityModel(vehicle) == GetHashKey(v.name) then
            -- check if vehicle is set to use park patterns
            if v.parkConfig.usePark then
                return true, v
            else
                print("Vehicle [" .. v.name .. "] not set to use park patterns.")
            end
        end
    end
end

function AreChecksPassed()
    local areDoorsOpen = false
    local vehHealth = GetVehicleBodyHealth(veh)
    local numberOfDoors = GetNumberOfVehicleDoors(veh)

    if Config.checkDoors then
        for i = 0, numberOfDoors, 1 do
            if GetVehicleDoorAngleRatio(veh, i) > 0.0 then
                print("[AreChecksPassed] Door " .. i .. " is open.")
                areDoorsOpen = true
                break
            end
        end
    end
    
    print("[AreChecksPassed] Are doors open: " .. tostring(areDoorsOpen))

    if vehHealth > Config.healthThreshold and not areDoorsOpen then
        print("[AreChecksPassed()] Checks passed.")
        return true
    else
        print("[AreChecksPassed()] Checks failed.")
        return false
    end
end

CreateThread(function()
    while true do
        if IsPedInAnyVehicle(PlayerPedId()) then
            veh = GetVehiclePedIsIn(PlayerPedId())
            local speed = 0
            if Config.useKPH then
                speed = GetEntitySpeed(Entity(veh)) * 3.6
            else
                speed = GetEntitySpeed(Entity(veh)) * 2.236936
            end

            if myVehParked then
                if speed > Config.speedThreshold then
                    TriggerEvent("uls:vehDrive")
                end
            else
                if speed < Config.speedThreshold then
                    TriggerEvent('uls:vehPark')
                end
            end
            Wait(Config.delay*1000)
        else
            Wait(2000)
        end
    end
end)

AddEventHandler('uls:vehPark', function()
    print('[uls:vehPark] My vehicle parked.')
    myVehParked = true

    local passed, vehConfig = GetVehicleFromTableByVehicleId(veh)
    local vehHealth = GetVehicleBodyHealth(veh)
    
    if Lights then
        if passed and AreChecksPassed() then
            -- enable pExtras
            for k,v in pairs(vehConfig.parkConfig.pExtras) do
                SetVehicleExtra(veh, v, 0)
            end
            -- disable dExtras
            for k,v in pairs(vehConfig.parkConfig.dExtras) do
                SetVehicleExtra(veh, v, 1)
            end
        end
    end
end)

AddEventHandler('uls:vehDrive', function()
    print('[uls:vehDrive] My vehicle is driving.')
    myVehParked = false

    local passed, vehConfig = GetVehicleFromTableByVehicleId(veh)
    local vehHealth = GetVehicleBodyHealth(veh)

    if Lights then 
        if passed and AreChecksPassed() then
            -- disable pExtras
            for k,v in pairs(vehConfig.parkConfig.pExtras) do
                SetVehicleExtra(veh, v, 1)
            end
            -- enable dExtras
            for k,v in pairs(vehConfig.parkConfig.dExtras) do
                SetVehicleExtra(veh, v, 0)
            end
        end
    end
end)