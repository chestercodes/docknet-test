module MyProject.Services.Tests

open NUnit.Framework
open MyProject.Domain
open MyProject.Services

[<Test>]
let ``Test appends 😊 0 times`` () =
    let appender = EmojiAppender()
    let happy = Emoji "😊"

    let result = appender.AppendNTimes("I feel ", happy, 0)
    
    Assert.AreEqual("I feel ", result)

[<Test>]
let ``Test appends 😊 5 times`` () =
    let appender = EmojiAppender()
    let happy = Emoji "😊"

    let result = appender.AppendNTimes("I feel ", happy, 5)
    
    Assert.AreEqual("I feel 😊😊😊😊😊", result)
