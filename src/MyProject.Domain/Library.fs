module MyProject.Domain
    
open System

type Emoji = Emoji of string

let emojiFrom input =
    if input = ":)" then
        Emoji "😊"
    elif input = ":(" then
        Emoji "😢"
    else
        raise (ArgumentException("input needs to be either :) or :("))
