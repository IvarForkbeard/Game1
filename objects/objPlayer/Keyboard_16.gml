//fast unwind
if now > 2 {
    now --
}
for (i = 0; i < 10; i ++) {
    for(j = 0; j < 10; j ++) {
        if gridAt(i, j) == entity.player || gridAt(i, j, now) == entity.player + entity.target {
            global.playerX = i
            global.playerY = j
        }
    }
}