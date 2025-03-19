// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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

//seed the random thing
function seedChoice(x) {
    random_set_seed(x)
}

//comments at the end here to give whitespace in the IDE
//
//
//not sure why this is, but delete these if you want to be VERY annoyed