randomise()
global.gridSize = 64
global.level = 0
global.playgrid[0][0][0] = 0
window_set_size(640, 640)
room_goto_next()
audio_play_sound(theme, 5, true)