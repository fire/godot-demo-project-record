extends Node

var playback = null
var effect : AudioEffectRecord = AudioServer.get_bus_effect(2, 0)

func process_packet():
	effect.set_recording_active(false)
	effect.write_audio_stream_playback($player.get_stream_playback())
	effect.set_recording_active(true)
	
func _ready():
	playback = $player.get_stream_playback()
# warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "process_packet")
	effect.set_recording_active(true)
