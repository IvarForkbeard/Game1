if room != rmGame {
    seedChoice(global.seed)
    audio_play_sound(theme, 5, true)
    object_set_sprite(objCrate, sprBag)
    room_goto(rmGame)
}