// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//constants
#macro GRIDSIZE 64
enum entity {
    floor = 0,
    wall = 1,
    target = 3,
    player = 7,
    crate = 15
}

//return the value at a certain place and time
function gridAt(x, y, z) {
    return global.playgrid[x][y][z]
}

//check if the puzzle is complete
function puzzleComplete() {
    for (i = 0; i < 10; i ++) {
        for (j = 0; j < 10; j ++) {
            var focus = gridAt(i, j, now)
            if focus == entity.target || focus == entity.target + entity.player {
                return false
            }
        }
    }
    return true
}

//set the grid at a certain place and time
function gridSet(x, y, z, thing) {
    global.playgrid[x][y][z] = thing
}

//change the grid at a certain place and time
function gridChange(x, y, z, thing) {
    global.playgrid[x][y][z] += thing
}

//draw the array for debugging
function gridDraw () {
    for (i = 0; i < 10; i++){
        for (j = 0; j < 10;  j++){
            draw_text(32 + i * 32, 32 + j * 32, gridAt(i, j, now))
        }
    }
}

//seed the random thing
function seedChoice(x) {
    random_set_seed(x)
}

//fast rewind
function fastRewind(){
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
}

//undo
function undo(){
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
}

//left
function left(){
    dx = -1
    dy = 0
    now ++
}

//right
function right(){
    dx = 1
    dy = 0
    now ++
}

//up
function up(){
    dx = 0
    dy = -1
    now ++
}

//down
function down(){
    dx = 0
    dy = 1
    now ++
}




//comments at the end here to give whitespace in the IDE
//
//
//not sure why this is, but delete these if you want to be VERY annoyed