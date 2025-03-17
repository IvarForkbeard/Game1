//this is a room to set up the entire game, it only is called once and then moves on to the actual game room
randomise()
global.level = 0
global.playgrid[0][0][0] = entity.wall
window_set_size(640, 640)
room_goto_next()