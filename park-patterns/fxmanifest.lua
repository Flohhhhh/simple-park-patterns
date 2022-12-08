fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "park-patterns"
description "Enables or disables extras on vehicles based on vehicle speed. Has a threshold for vehicle damage so vehicle doesn't get auto repaired unrealistically, and checks for open doors to prevent snapping."
author "Floh @ Dawnstar"
version "1.1.0"

client_scripts {
	'main.lua',
	'config.lua'
}

escrow_ignore {
	'config.lua'
}