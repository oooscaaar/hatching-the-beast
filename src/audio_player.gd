extends Node

func _ready():
  var music_file = "res://assets/audio/main_theme.mp3"
  var music_player = AudioStreamPlayer.new()
  var music = load(music_file)
  music_player.stream = music
  music_player.play()
