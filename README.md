# simple-park-patterns
A FiveM resource that can be used by vehicle developers to create park patterns using extras.



# Installation
Simply add resource to your resources folder and add ``ensure park-patterns`` to your server.cfg

# Config
``useKPH`` = DUH

``speedThreshold`` = below this speed, extras on the vehicle will switch states

``healthThreshold`` = below this vehicle body health, the effect is disabled

``checkDoors`` = when true, effect is disabled while a door is open (prevents doors/trunk/hood snapping shut)

``delay`` = time between checks, should not need to be any lower than .5 seconds, higher values may look more realistic

``vehicles`` Example
```{spawnName='police1', pExtras={1,2}, dExtras={3}},```

![image](https://user-images.githubusercontent.com/48927090/206566973-f07ccb4e-f065-4acf-b41a-43cb6ac633c6.png)
