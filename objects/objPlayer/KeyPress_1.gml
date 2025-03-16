//on input, increment the number of steps and store the new grid at that position in the 3d array
for (j = 0; j < 10; j ++) {
    for (k = 0; k < 10; k ++) {
        setGrid(j, k, now + 1, gridAt(j, k, now))
    }
}
dx = 0
dy = 0
switch keyboard_key{
    case vk_left:
        dx = -1
        dy = 0
        now ++
        global.hasPlayerMoved = true
    break
    case vk_up:
        dx = 0
        dy = -1
        now ++
        global.hasPlayerMoved = true
    break
    case vk_right:
        dx = 1
        dy = 0
        now ++
        global.hasPlayerMoved = true
    break
    case vk_down:
        dx = 0
        dy = 1
        now ++
        global.hasPlayerMoved = true
    break
    case vk_space:
        if (now > 2){
            now --
        }
        for (i = 0; i < 10; i ++) {
            for (j = 0; j < 10; j ++) {
                var focus = gridAt(i, j, now)
                if focus == entity.player || focus == entity.player + entity.target{
                    global.playerX = i
                    global.playerY = j
                }
            }
        }
    break
}

//move the player as long as it hasn't stepped onto the skirt
changeGrid(global.playerX, global.playerY, now, -entity.player)
global.playerX += dx
global.playerY += dy
changeGrid(global.playerX, global.playerY, now, entity.player)

//if the player is on a crate, then push that crate ahead
var focus = gridAt(global.playerX, global.playerY, now)
if focus == entity.player + entity.crate || focus == entity.player + entity.crate + entity.target{
    changeGrid(global.playerX, global.playerY, now, -entity.crate)
    changeGrid(global.playerX + dx, global.playerY + dy, now, entity.crate)
}

//check for illegal board situations
var isPlayable = true
for (i = 0; i < 10; i ++) {
    for(j = 0; j < 10; j ++) {
        switch global.playgrid[i][j][now] {
            case 8: //player on wall
            case 16: //crate on wall
            case 30: //crate on crate
            case 33: //crate on crate on target
                isPlayable = false
            break
        } 
    }
}

//rewind time if not playable
if !(isPlayable) {
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
}

// Increment level if the puzzle is complete
if puzzleComplete() {
    global.level ++
    audio_play_sound(golfClap6, 4, false)
    room_restart()
}