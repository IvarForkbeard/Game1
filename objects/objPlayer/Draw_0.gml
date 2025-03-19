// Position player
x = global.playerX * GRIDSIZE
y = global.playerY * GRIDSIZE
draw_self()

//destroy and recreate crates
instance_destroy(objCrate)
for (i = 0; i < 10; i ++) {
    for (j = 0; j < 10;  j ++) {
        focus = gridAt(i, j, now)
        if focus == entity.crate || focus = entity.crate + entity.target {
            instance_create_layer(i * GRIDSIZE, j * GRIDSIZE, "cratesPlayer", objCrate)
        }
    }
}

// Display info text
window_set_caption("Treeman's Happy Fun Time Game Levels Remaining: " + string(global.levelToWin - global.level))
draw_set_font(bebasNeue)
draw_set_halign(fa_center)
draw_set_colour(c_yellow)
draw_text(320, 580, "Treeman's Happy Fun Time Game Levels Remaining: " + string(global.levelToWin - global.level))
draw_text(320, 610, "Steps: " + string(now - 999))
var minutes = string(int64(global.elapsedTime / 1800))
if string_length(minutes) < 2 {
    minutes = "0" + minutes
}
var seconds = string(int64(global.elapsedTime / 30) % 60)
if string_length(seconds) < 2 {
    seconds = "0" + seconds
}
var degrees = string((int64(global.elapsedTime / 2) % 30))
if string_length(degrees) < 2 {
    degrees = "0" + degrees
}
    
draw_text(320, 30, "Elapsed Time: " + minutes + ":" + seconds + ":" + degrees)

//advance timer if still playing
if global.level < global.levelToWin {
    global.elapsedTime ++
}