// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//return the value at a certain place and time
function gridAt(x, y, z) {
    return global.playgrid[x][y][z]
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

//comments at the end here to give whitespace in the IDE
//
//
//not sure why this is, but delete these if you want to be VERY annoyed