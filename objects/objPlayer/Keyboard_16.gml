//fast unwind
if now {
     now --
}
for (i = 0; i < 10; i ++) {
    for(j = 0; j < 10; j ++) {
        focus = gridAt(i, j, now)
        if focus == entity.player || focus == entity.player + entity.target {
            global.playerX = i
            global.playerY = j
        }
    }
}