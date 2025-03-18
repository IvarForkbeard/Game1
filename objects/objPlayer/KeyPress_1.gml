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
        dx = -1
        dy = 0
        now ++
    break
    case vk_up:
        dx = 0
        dy = -1
        now ++
    break
    case vk_right:
        dx = 1
        dy = 0
        now ++
    break
    case vk_down:
        dx = 0
        dy = 1
        now ++
    break
    case vk_space:
        if now {
          now --
        }
        for (i = 0; i < 10; i ++) {
            for (j = 0; j < 10; j ++) {
                focus = gridAt(i, j, now)
                if focus == entity.player || focus == entity.player + entity.target{
                    global.playerX = i
                    global.playerY = j
                }
            }
        }
    break
}

//move the player
gridChange(global.playerX, global.playerY, now, -entity.player)
global.playerX += dx
global.playerY += dy
gridChange(global.playerX, global.playerY, now, entity.player)

//if the player is on a crate, then push that crate ahead
focus = gridAt(global.playerX, global.playerY, now)
if focus == entity.player + entity.crate || focus == entity.player + entity.crate + entity.target{
    gridChange(global.playerX, global.playerY, now, -entity.crate)
    gridChange(global.playerX + dx, global.playerY + dy, now, entity.crate)
}

//check for illegal board situations
for (i = 0; i < 10; i ++) {
    for(j = 0; j < 10; j ++) {
        switch gridAt(i, j, now) {
            case entity.wall + entity.player: //player on wall
            case entity.wall + entity.crate: //crate on wall
            case entity.crate + entity.crate: //crate on crate
            case entity.crate + entity.crate + entity.target: //crate on crate on target
                //rewind time and reposition player
                now --
                for (i = 0; i < 10; i ++) {
                    for (j = 0; j < 10; j ++) {
                        focus = gridAt(i, j, now)
                        if  focus == entity.player || focus == entity.player + entity.target {
                            global.playerX = i
                            global.playerY = j
                        }
                    }
                }
            break
        } 
    }
}

// Increment level if the puzzle is complete
if puzzleComplete() {
    global.level ++
    audio_play_sound(golfClap6, 4, false)
    alarm_set(0, 10)
}