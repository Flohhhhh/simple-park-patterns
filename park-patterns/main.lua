
-- functions
function GetVehicleFromTableByVehicleId(vehicle)
    for k,v in pairs(Config.vehicles) do
        if GetEntityModel(vehicle) == GetHashKey(v.spawnName) then
            print("Got: " .. v.spawnName)
            return true, v
        end
    end
end

-- thread
CreateThread(function()
    while true do
        
        local veh = GetVehiclePedIsIn(PlayerPedId())
        local passed, vehConfig = GetVehicleFromTableByVehicleId(veh)

        print(passed)
        print(vehConfig)

        if passed then
            local speed = 0
            local vehHealth = GetVehicleBodyHealth(veh)
                
            if vehHealth > Config.healthThreshold then
                if Config.useKPH then
                    speed = GetEntitySpeed(Entity(veh)) * 3.6
                else
                    speed = GetEntitySpeed(Entity(veh)) * 2.236936
                end

                print(speed)
                -- if slow
                if speed < Config.speedThreshold then
                    -- enable pExtras
                    for k,v in pairs(vehConfig.pExtras) do
                        SetVehicleExtra(veh, v, 0)
                    end
                    -- disable dExtras
                    for k,v in pairs(vehConfig.dExtras) do
                        SetVehicleExtra(veh, v, 1)
                    end
                -- if fast
                else
                    -- disable pExtras
                    for k,v in pairs(vehConfig.pExtras) do
                        SetVehicleExtra(veh, v, 1)
                    end
                    -- enable dExtras
                    for k,v in pairs(vehConfig.dExtras) do
                        SetVehicleExtra(veh, v, 0)
                    end
                end
            end
            
        end
        Wait(1000)
    end
end)
