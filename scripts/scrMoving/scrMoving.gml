// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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

//now handle moving and checking and undoing if an illegal state
function move(){
    
   //move the player
   gridChange(global.playerX, global.playerY, now, -entity.player)
   global.playerX += dx
   global.playerY += dy
   gridChange(global.playerX, global.playerY, now, entity.player)
   
   //if the player is on a crate, then push that crate ahead
   focus = gridAt(global.playerX, global.playerY, now)
   if focus == entity.player + entity.crate || focus == entity.player + entity.crate + entity.target{
       gridChange(global.playerX, global.playerY, now, -entity.crate)
       gridChange(global.playerX + dx, global.playerY + dy, now, entity.crate)
   }
   
   //check for illegal board situations
   for (i = 0; i < 10; i ++) {
       for(j = 0; j < 10; j ++) {
           switch gridAt(i, j, now) {
               case entity.wall + entity.player: //player on wall
               case entity.wall + entity.crate: //crate on wall
               case entity.crate + entity.crate: //crate on crate
               case entity.crate + entity.crate + entity.target: //crate on crate on target
                   //rewind time and reposition player
                   now --
                   for (i = 0; i < 10; i ++) {
                       for (j = 0; j < 10; j ++) {
                           focus = gridAt(i, j, now)
                           if  focus == entity.player || focus == entity.player + entity.target {
                               global.playerX = i
                               global.playerY = j
                           }
                       }
                   }
               break
           } 
       }
   }
}

//comments at the end here to give whitespace in the IDE
//
//
//not sure why this is, but delete these if you want to be VERY annoyed