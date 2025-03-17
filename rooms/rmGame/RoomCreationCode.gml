//setup stuff for every time the room is remade
numberOfBoxes = ceil(global.level / 3) + 1

// create global.playgrid
for (i = 0; i < 10; i ++) {
    for (j = 0; j < 10; j ++) { 
        gridSet(i, j, 0, entity.wall)
    }
}

// add generated path
pathStep = 1
pathX = irandom(7) + 1
pathY = irandom(7) + 1
gridSet(pathX, pathY, 0, entity.floor)
while pathStep < global.level + 20 && pathStep < 64 {
    switch irandom(3){
        case 0:
            if pathY > 1 {
                pathY --
            }
        break
        case 1:
            if pathX > 1 {
                pathX --
            }
        break
        case 2:
            if pathY < 8 {
                pathY ++
            }
        break
        case 3:
            if pathX < 8 {
                pathX ++
            }
        break
    }
    if gridAt(pathX, pathY, 0) == entity.wall {
        gridSet(pathX, pathY, 0, entity.floor)
        pathStep ++
    }
}

// add player to global.playgrid
playerHasBeenPlaced = false
while !playerHasBeenPlaced {
    global.playerX = irandom(7) + 1
    global.playerY = irandom(7) + 1
    if gridAt(global.playerX, global.playerY, 0) == entity.floor {
        gridSet(global.playerX, global.playerY, 0, entity.player)
        playerHasBeenPlaced = true
    }
}

// add targets and crates to global.playgrid
boxesPlaced = 0
while boxesPlaced < numberOfBoxes {
    targetX = irandom(7) + 1
    targetY = irandom(7) + 1
    if gridAt(targetX, targetY, 0) == entity.floor {
        gridChange(targetX, targetY, 0, entity.target + entity.crate)
        boxesPlaced ++
    }
}

//now put actual objects onto the play surface except crates, which are redrawn every clock cycle
for (i = 0; i < 10; i ++) {
    for (j = 0; j < 10; j ++) {
        switch gridAt(i, j, 0) {
            case entity.wall:
                instance_create_layer(i * GRIDSIZE, j * GRIDSIZE, "Instances", objWall)
            break
            case entity.target + entity.crate:
                instance_create_layer(i * GRIDSIZE, j * GRIDSIZE, "Instances", objTarget)
            break
        }
    }
}

//instantiate player after the room has been built to prevent room scrambling prematurely
instance_create_layer(global.playerX, global.playerY, "Text", objPlayer)