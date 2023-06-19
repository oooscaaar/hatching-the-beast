extends Node

var nickname := 'John Doe'
var last_score_in_time := 0.0
# Dummy owned beast
var beasts_owned: Array[Dictionary] = [
	{'name':'Frostwhisper', 'rarity': 'Legendary','sprite': 3 },
	{'name':'Thornclaw', 'rarity':'Rare', 'sprite': 5 },
	{'name':'Drakonshard', 'rarity': 'Common','sprite': 0 },
	{'name':'Shadowfang', 'rarity': 'Common','sprite': 1 },
	{'name':'Emberwing', 'rarity': 'Legendary','sprite': 2 },
	{'name':'Stormcaller', 'rarity': 'Rare','sprite': 4 },
	]
var active_beast_index = null
var has_read_instructions = false
