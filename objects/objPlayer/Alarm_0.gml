/// @description
//check to see if player has finished
if global.level >= global.levelToWin {
    instance_create_layer(320, 128, "Text", objWinner)
}
else {
    room_restart()
}