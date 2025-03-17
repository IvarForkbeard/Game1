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
            if gridAt(i, j, now) == entity.target || gridAt(i, j, now) == entity.target + entity.player {
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