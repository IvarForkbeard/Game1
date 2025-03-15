//on input, increment the number of steps and store the new grid at that position in the 3d array
for (j = 0; j < 10; j ++) {
    for (k = 0; k < 10; k ++) {
        global.playgrid[j][k][now + 1] = gridAt(j, k, now)
    }
}
global.dx = 0
global.dy = 0
switch keyboard_key{
    case vk_left:
        global.dx = -1
        global.dy = 0
        now ++
        global.hasPlayerMoved = true
    break
    case vk_up:
        global.dx = 0
        global.dy = -1
        now ++
        global.hasPlayerMoved = true
    break
    case vk_right:
        global.dx = 1
        global.dy = 0
        now ++
        global.hasPlayerMoved = true
    break
    case vk_down:
        global.dx = 0
        global.dy = 1
        now ++
        global.hasPlayerMoved = true
    break
    case vk_space:
        if (now > 2){
            now --
        }
        for (i = 0; i < 10; i ++) {
            for (j = 0; j < 10; j ++) {
                if gridAt(i, j, now) == entity.player|| gridAt(i, j, now) == entity.player + entity.target{
                    global.playerX = i
                    global.playerY = j
                }
            }
        }
    break
}

//move the player as long as it hasn't stepped onto the skirt
global.playgrid[global.playerX][global.playerY][now] -= entity.player
global.playerX += global.dx
global.playerY += global.dy
global.playgrid[global.playerX][global.playerY][now] += entity.player

    //if the player is on a crate, then push that crate ahead
if gridAt(global.playerX, global.playerY, now) == entity.player + entity.crate|| gridAt(global.playerX, global.playerY, now) == entity.player + entity.crate + entity.target{
        global.playgrid[global.playerX][global.playerY][now] -= entity.crate
        global.playgrid[global.playerX + global.dx][global.playerY + global.dy][now] += entity.crate
}

//check for illegal board situations
isPlayable = true
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
if !(isPlayable) {
    now --
    for (i = 0; i < 10; i ++) {
        for (j = 0; j < 10; j ++) {
            if gridAt(i, j, now) == entity.player|| gridAt(i, j, now) == entity.player + entity.target {
                global.playerX = i
                global.playerY = j
            }
        }
    }
}

// Calculate if the puzzle is complete by seeing if there are any targets either empty, or with a player on them
/*global.puzzleComplete = true
for (i = 0; i < 10; i ++) {
    for (j = 0; j < 10; j ++) {
        if gridAt(i, j, now) == entity.target|| gridAt(i, j, now) == entity.target + entity.player {
            global.puzzleComplete = false
        }
    }
}
*/
// Increment level if the puzzle is complete due to player interaction, just restart if not.
if puzzleComplete() {
    global.level ++
    audio_play_sound(golfClap6, 4, false)
    room_restart()
}