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
            instance_create_layer(i * GRIDSIZE, j * GRIDSIZE, "Instances", objCrate)
        }
    }
}

// Display info text
window_set_caption("Treeman's Happy Fun Time Game Level: " + string(global.level))
draw_set_font(bebasNeue)
draw_set_halign(fa_center)
draw_set_colour(c_yellow)
draw_text(320, 580, "Treeman's Happy Fun Time Game Level: " + string(global.level))
draw_text(320, 610, "Steps: " + string(now - 999))