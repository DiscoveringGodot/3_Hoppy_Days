extends Node

# Scene paths (must be updated manually)
const EndGame = "res://Scenes/Levels/EndGame.tscn"
const Level1 = "res://Scenes/Levels/Level 1.tscn"
const LIGHTNING = "res://Scenes/Lightning.tscn"

#Node references (updated by the relevant nodes as they load in)
var GameState = ""
var Player =""
var GUI = ""