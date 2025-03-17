//player pulls blocks around randomly to set up playable surface
now = 999
for (i = 0; i <= now; i ++) {
    dx = 0
    dy = 0
    switch irandom(3) {
        case 0:
            dy = -1
        break
        case 1:
            dx = +1
        break
        case 2:
            dy = +1
        break
        case 3:
            dx = -1
        break
    }
    focus = gridAt(global.playerX + dx, global.playerY + dy, i)
    if focus == entity.floor || focus == entity.target {
        gridChange(global.playerX, global.playerY, i, -entity.player)
        global.playerX += dx
        global.playerY += dy
        gridChange(global.playerX, global.playerY, i, entity.player)
        focus2 = gridAt(global.playerX - dx * 2, global.playerY - dy * 2, i)
        if focus2 == entity.crate || focus2 == entity.crate + entity.target {
            gridChange(global.playerX - dx * 2, global.playerY - dy * 2, i, -entity.crate)
            gridChange(global.playerX - dx, global.playerY - dy, i, entity.crate)
        }
    }
    for (j = 0; j < 10; j ++) {
        for (k = 0; k < 10; k ++) {
            gridSet(j, k, i + 1, gridAt(j, k, i))
        }
    }
}

//if the room is solved already, restart
if puzzleComplete() {
    room_restart()
}