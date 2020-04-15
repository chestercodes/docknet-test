module MyProject.Domain.Tests

open NUnit.Framework
open MyProject.Domain

[<Test>]
let ``emojiFrom creates 😊 emoji from :)`` () =
    let expected = Emoji "😊"
    
    let result = emojiFrom ":)"
    
    Assert.AreEqual (expected, result)

[<Test>]
let ``emojiFrom creates 😢 emoji from :(`` () =
    let expected = Emoji "😢" 
    
    let result = emojiFrom ":("
    
    Assert.AreEqual (expected, result)
