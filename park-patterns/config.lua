-- Simple Park Patterns by Dawnstar FiveM
-- Written by Floh
-- For support: https://discord.com/invite/zH3k624aSv

-----------------------------

-- CONFIG VALUES
Config = {

    useKPH = false,

    -- extras will toggle below this speed
    speedThreshold = 1,

    -- health threashold disables this effect while vehicle is damaged to prevent unrealistic repairs upon crashing
    healthThreshold = 970, -- 999 would disable effect with ANY damage to vehicle, between 850-999 are good values

    vehicles = {
        -- pExtras = Extras enabled while parked
        -- dExtras = Extras enabled while driving
        -- EXAMPLE {spawnName='helloworld', pExtras={1, 2}, dExtras={3}},
        {spawnName='', pExtras={}, dExtras={}},
    }
}