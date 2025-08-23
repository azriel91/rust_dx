<style>
li { page-break-inside: avoid; }
</style>

1. Heya everyone, my name is Azriel, and this talk is called, "The Development Experience Is Different With Rust".

2. First, learning.
3. When you try out Rust, you may experience this.
4. Assign a number to a variable, and increment it, and immediately you get an error.
5. You don't have to read this, the point is, Rust is going to tell you, "no".
6. You learn about mutability, and you append to a string, again, Rust says "no".

7. You learn the difference between Strings and slices, and try to mutate a string in a collection. Still, Rust says "no".
8. You learn move semantics, and when you put something into a collection, you need to take it out before you can use it. Are we there yet? "no".
9. When you're learning, even for the most basic of things, it can feel like "Rust says no to everything I *know* how to do".

10. But I implore you, keep going, and be adamant -- You've never lost to a computer before, don't start now.

11. Also, consider this perspective.
12. Software that cannot compile is invalid, and therefore, incorrect.
13. Software that successfully compiles is valid, but not necessarily correct.
14. If more of the incorrect software, can be classified as invalid, then it follows that when your code successfully compiles, it's more likely to be *correct*.
15. Hopefully that perspective makes your learning experience better.

16. Now you may be thinking, Rust is introducing complexity where there wasn't any before.
17. and you're right!
18. But it also provides clarity.
19. *(excitedly)* Let me show you.

20. This is how you know you're a software developer.
21. *(take out two canned drinks)*
22. Are these equal? *(smile)*
23. They look the same. You know what else looks the same?

24. All of these on the left and right of the double equals. *(pause)*
25. The meaning of the double equals operator varies with the type and the language.
26. Rust has chosen this definition:
27. Equals equals, equals, equals.

28. In Rust, the double equals operator, means value equality,
29. which is what you would've thought it means, *before* you were clever.
30. So your development experience up till now, has been tainted by complexity that you didn't need to know.

31. Errors. The way errors have been represented has evolved.

32. With sentinel values, which is using a special value within your return type, to mean "error",
33. the caller has to remember to check for the error value, then diverge the code paths for success and failure.
34. Example here is, for an integer, the caller has to remember to check for -1,
35. For a success object, non-`null` represents success,
36. and for an error object, `null` represents success,
37. which is just that much more mental effort when understanding code.

38. Then came exceptions, which separated the success and failure code paths with compiler support.

39. However! `try/catch` blocks can be ambiguous as to which line throws the exception.
40. If you're caught in a traffic jam, and your friend asks, "did you take a bus or cab?" It's going to be really weird to say, "I don't know! But I know it's one of them."
41. Like, "how do you not know!?"
42. In real life you know where you came from. Why don't we know in development?
43. Some people mistake our tolerance for pain as intelligence.

44. To be unambiguous, you'd have to give each line that could fail, its own block.

45. Also, without IDE highlighting, there's no visible marker for which functions *actually* throw exceptions.

46. And defining errors takes a bit of effort.
47. Conventionally one should define a file for every exception, and multiple constructors within each,
48. which is quite a chore, when you have to do 10 of them.

49. So exceptions have made error handling a bit better, but can we further refine this part of programming?

50. Yes. Yes we can.

51. Rust's approach to error handling is to provide a `Result` type, where you pass in your error type.
52. Different kinds of errors can be written as enum variants, which is far less boilerplate than a file per error variant.

53. On usage, control flow is unambiguous by *default*,
54. as every error handling block is kept separate.

55. If it makes sense, you can still commonize the error handling code.

56. For functions that can fail, function calls are marked by a `?`.
57. So when reading code, you can *see* where errors can happen.

58. With reduced ambiguity, there's less pain, more clarity, better experience.

59. Rust is expressive,
60. and by expressive I mean, you can take an idea, and write it in code, without much effort.
61. And the converse as well, you can read the code, and grasp the idea, without much effort.

62. Which of these two do you read more naturally?
63. I'll tell you why: it's because when you buy coffee, the barista doesn't say, "That's dollars five, cents fifty".
64. No they say, "That's five dollars fifty cents".
65. What you *can* do in Rust, is implement behaviour over existing types, and create API like the second snippet.
66. *(pause)* Why is this useful?

67. Let's say you're writing code to render markdown to a file.
68. If you inline all the function calls, to understand it, you have to read from the middle out.
69. You could break them over multiple lines, which looks a bit better.
70. With Rust traits, you can write code like the third snippet.
71. (pause) There's something about that empty space and alignment that makes it more readable, right?
72. Many libraries provide aesthetic APIs because *it's possible*, so it makes learning to use them *correctly*, much easier.

73. Cloning, or another word for deep copying.

74. How do you spell, "clone"?
75. "C-L-O-N-E"? or "serialize, deserialize"?
76. No one says, "Dolly the sheep was serialize, deserialized. They say, Dolly the sheep was cloned."
77. Software is harder to understand, when the expression of the idea is far away, from the idea itself.
78. And it's also sad when the recommended answer is,
79. "take this bit of memory, transform it to a different format, do the reverse transformation, and that's your clone".
80. Why not just, "copy paste", right?

81. There *has* been progress, like here in Javascript and C#.
82. How do you spell "clone"? "structuredClone".
83. It's not guaranteed to do what you want though,
84. like sometimes it shallow clones, sometimes it doesn't clone type info, and sometimes it fails.
85. C#'s a bit funny, the docs say, "here's an interface, but don't use it!"
86. Can we do better?
87. Of course.

88. In Rust, clone is spelt `clone()`, and `clone()`, means clone.
89. No missed type info, no failures, no surprises. *(high pitch)*
90. When the representation matches your understanding, the expression is *perfect*.

91. Because of Rust's clarity and expressiveness, code is more comprehendable.
92. For semantics, you can read things once, and not have to go, it could be this or that. No, it's always, *the one*.
93. When there are multiple paths, you know where you came from.
94. When you want to say something, there's a word for it.
95. Communicating through software is hard enough, so let's refine our language.

96. Tooling. Rust has a really nice tooling ecosystem.

97. It ships with good standard tools, and there is *one* for each purpose.
98. You know, it's really nice when I want to code, that I can just... code,
99. and not have to install and learn the new tool of the day. Anyway.

100. `cargo` is Rust's package manager, and it has really nice UX.
101. When you tell it "run my application", it downloads dependencies, compiles your project, and runs your application.
102. And it's cancellable *and* idempotent as well, so you can stop it, and re-run the command, and it will *pick up, where it left off*.
103. Which takes away that mental check: before I run this, did I miss anything?
104. It has support for workspaces, so you can manage multiple packages in a single repository.
105. and it's easy to override dependencies, so you can test your code with a patched version of the dependency.
106. That is, *so many* things that need to be done, *can* be done, in a supported way.

107. Rust comes with a linter, called `clippy`.
108. Clippy teaches you how to write code in the idiomatic Rust way, which can help to make code easier to read, and in some cases, how to avoid bugs.
109. So it improves your code, *and!* it doesn't even use AI.
110. It's really nice to be taught how to be eloquent with Rust, at a digestable pace.
111. So in pull requests, more of the discussion can be focused on what we're writing, than on our ability to speak the language.

112. There are *many*, many more tools written by the community.
113. They are generally easy to set up and integrate into your build pipeline.
114. What's really nice about all this tooling is, when you run `cargo install $tool_name`, it just works... and *I'm using Windows*.
115. You don't get an obscure error message, which, plus some keywords, becomes the unique identifier to a stack overflow question, whose solution doesn't work on your computer.
116. So you spend far less time fiddling with tools, and more time building.

117. Safety. Not the kind you're thinking of, but psychological safety.

118. Here's an interesting... observation: most of my project dependencies have a version of `0.something.something`.
119. i.e. the major version is always `0`.
120. and this reveals an interesting trait about the Rust community: people are so concerned about making a promise that they cannot keep, most would never publish a crate as `1.0`.
121. Like, "aah, I might change the API in the next 20 years! So I'm not going to promise stability now."
122. In this ecosystem, keeping dependencies up to date is not a burdensome chore.
123. Periodically, I run `cargo upgrade --incompatible allow --recursive`, and, *again*, (pause) it, just, works.
124. Stress levels and anxiety for maintenance go down, psychological safety goes up.
125. So here is a thank you to the many of you, for keeping the promises that you did not make.

126. Finally, the experience beyond the code.
127. When you interact with the community, like ask a question in the users forum, no matter how simple or complex it is, someone's going to answer, and they answer with empathy and intellect.
128. There's no sentiment of, "Don't ask stupid questions! or, your question must be this good, before we answer you".
129. So not only do you receive the answer, you actually *feel* helped.

130. To summarize, this talk isn't intended to diminish the value of any other language.
131. There are *decades* of learnings from so many languages.

132. Not just what worked, but also what didn't work.

133. Rust has the late starter advantage.

134. It has the privileged position of taking the patterns that work for today's applications, and not having to support the patterns that don't.
135. Without the experimentation and lessons from all the other languages, there would *be* no Rust.
136. So it is simply a progression of technology, not a pedestal to stand on.

137. Imagine. I'd like you to,

138. Imagine never seeing a null pointer exception ever again.
139. Imagine upgrading all your software, and *it just works*.
140. Imagine asking for help, and *being helped*.

141. *(pause)*. With Rust, you don't have to imagine, take away the hype, that's the reality.
142. *(glance up)* Help. I'm `asyncing`. I need a lifetime. "move".
143. That's why we call it, the execution pool.

144. If you haven't tried Rust yet, give it a go, and enjoy the experience.
145. Peace.
