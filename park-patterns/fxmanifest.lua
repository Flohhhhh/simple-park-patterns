fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "park-patterns"
description "Enables or disables extras on vehicles based on vehicle speed. Has a threshold for vehicle damage to vehicle doesn't get auto repaired."
author "Floh @ Dawnstar"
version "1.0.0"

client_scripts {
	'main.lua',
	'config.lua'
}

escrow_ignore {
	'config.lua'
}