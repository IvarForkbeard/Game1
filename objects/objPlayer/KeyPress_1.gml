//on input, increment the number of steps and store the new grid at that position in the 3d array
for (j = 0; j < 10; j ++) {
    for (k = 0; k < 10; k ++) {
        gridSet(j, k, now + 1, gridAt(j, k, now))
    }
}
dx = 0
dy = 0
switch keyboard_key{
    case vk_left:
        left()
        move()
    break
    case vk_up:
        up()
        move()
    break
    case vk_right:
        right()
        move()
    break
    case vk_down:
        down()
    move()
    break
    case vk_space:
        undo()
        move()
    break
}

// Increment level if the puzzle is complete
if puzzleComplete() {
    global.level ++
    audio_play_sound(golfClap6, 4, false)
    alarm_set(0, 10)
}