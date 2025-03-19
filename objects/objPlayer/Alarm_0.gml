//check if past the required level to win
if global.level >= global.levelToWin {
    instance_create_layer(320, 128, "Text", objWinner)
}
else {
room_restart()
}