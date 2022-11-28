# simple-park-patterns
A FiveM resource that can be used by vehicle developers to create park patterns using extras.



# Installation
Simply add resource to your resources folder and add ``ensure park-patterns`` to your server.cfg

# Config
``useKPH`` = DUH

``speedThreshold`` = below this speed, extras on the vehicle will switch states

``healthThreshold`` = below this vehicle body health, the effect is disabled

``vehicles`` Example
```{spawnName='police1', pExtras={1,2 }, dExtras={3}},```

```lua
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
}```
