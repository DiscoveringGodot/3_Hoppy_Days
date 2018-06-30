extends Node
# Simple data class to keep all "magic strings" in one place

# Scene paths (must be updated MANUALLY)
const EndGame = "res://Scenes/Levels/EndGame.tscn"
const Level1 = "res://Scenes/Levels/Level 1.tscn"
const LIGHTNING = "res://Scenes/Lightning.tscn"


# Node references (updated by the relevant nodes as they load in)
var GameState = ""
var Player =""
var GUI = ""


# Asset references (must be updated MANUALLY)
var coin_sfx = "res://SFX/coin_SFX.wav"
var jump_sfx = "res://SFX/jump1.ogg"
var pain_sfx = "res://SFX/pain.ogg"
var music = "res://SFX/happy.ogg"