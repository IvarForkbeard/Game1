// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// gridAt method acesses the grid at a location in time and place.

#macro GRIDSIZE 64

function gridAt(x, y, z) {
    return global.playgrid[x][y][z]
}

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

function setGrid(x, y, z, thing) {
    global.playgrid[x][y][z] = thing
}

function changeGrid(x, y, z, thing) {
    global.playgrid[x][y][z] += thing
}