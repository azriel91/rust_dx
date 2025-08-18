<style>
li { page-break-inside: avoid; }
</style>

1. Heya everyone, my name is Azriel, and this talk is called, "The Development Experience Is Different With Rust".

2. First, learning.
3. When you try out Rust, you may experience this.
4. Assign a number to a variable, and increment it, and immediately you get an error.
5. You don't have to read this, the point is, Rust is going to tell you, "no".
6. You learn about mutability, and you append to a string, Rust says "no".

7. You learn the difference between Strings and slices, and try to mutate a string in a collection, but then again, Rust says "no".
8. You learn move semantics, and when you put something into a collection, you need to take it out before you can use it. Still, Rust says "no".
9. When you borrow it, you need to handle the null case. And are we there yet? "no".
10. When you're learning, even for the most basic of things, it can feel like "Rust says no to everything I *know* how to do".

11. But I implore you, keep going, and be adamant -- I've never lost to a computer before, and I'm not going to start now.
12. Like, if you can learn bash, you can learn Rust.
13. Think about it this way, "the damage you can accidentally do with bash, is far worse than the damage you can't do with Rust".

14. Also, consider this perspective.
15. Software that cannot compile is invalid, and therefore, incorrect.
16. Software that successfully compiles is valid, but not necessarily correct.
17. If more of the incorrect software, can be classified as invalid, then it follows that when your code successfully compiles, it's more likely to be *correct*.
18. Hopefully that perspective makes your learning experience better.

19. Now you may be thinking, Rust is introducing complexity where there wasn't any before.
20. and you're right!
21. But it also provides clarity.
22. *(excitedly)* Let me show you.

23. This is how you know you're a software developer.
24. *(take out two canned drinks)*
25. Are these equal? *(smile)*
26. In other words, what does equality mean?

27. The meaning of the double equals operator varies with the type and the language.
28. That is, value equality, and referential equality, and for collections, whichever of those is delegated to.
29. Rust has chosen this definition:
30. Equals equals, equals, equals.

31. In Rust, the double equals operator, means value equality,
32. which is what you would've thought it means, *before* you were clever.
33. So your development experience up till now, has been tainted by complexity that you didn't need to know.

34. Errors. The way errors have been represented has evolved.

35. With sentinel values, which is using a special value within your return type, to mean "error",
36. the caller has to remember to check for the error value, then diverge the code paths for success and failure.
37. Example here is, for an integer, the caller has to remember to check for -1,
38. For a success object, non-`null` represents success,
39. and for an error object, `null` represents success,
40. which is just that much more mental effort when understanding code.

41. Then came exceptions, which separated the success and failure code paths with compiler support.

42. However! `try/catch` blocks can be ambiguous as to which line throws the exception.
43. If you're caught in a traffic jam, and your friend asks, "did you take a bus or cab?" It's going to be really weird to say, "I don't know! But I know it's one of them."
44. Like, "how do you not know!?"
45. In real life you know where you came from. Why don't we know in development?
46. Some people mistake our tolerance for pain as intelligence.

47. To be unambiguous, you'd have to give each line that could fail, its own block.

48. Also, without IDE highlighting, there's no visible marker for which functions *actually* throw exceptions.

49. And defining errors takes a bit of effort.
50. Conventionally one should define a file for every exception, and multiple constructors within each,
51. which is quite a chore, when you have to do 10 of them.

52. So exceptions have made error handling a bit better, but can we further refine this part of programming?

53. Yes. Yes we can.

54. Rust's approach to error handling is to provide a `Result` type, where you pass in your error type.
55. Different kinds of errors can be written as enum variants, which is far less boilerplate than a file per error variant.

56. On usage, control flow is unambiguous by *default*,
57. as every error handling block is kept separate.

58. If it makes sense, you can still commonize the error handling code.

59. For functions that can fail, function calls are marked by a `?`.
60. So when reading code, you can *see* where errors can happen.

61. Rust is expressive,
62. and by expressive I mean, you can take an idea, and write it in code, without much effort.
63. And the converse as well, you can read the code, and grasp the idea, without much effort.

64. Which of these two do you read more naturally?
65. I'll tell you why: it's because when you buy coffee, the barista doesn't say, "That's dollars five, cents fifty".
66. No they say, "That's five dollars fifty cents".
67. What you *can* do in Rust, is implement behaviour over existing types, and create API like the second snippet.
68. (pause) Why is this useful?

69. Let's say you're writing code to render markdown to a file.
70. If you inline all the function calls, to understand it, you have to read from the middle out.
71. You could break them over multiple lines, which looks a bit better.
72. With Rust traits, you can write code like the third snippet.
73. (pause) There's something about that empty space and alignment that makes it more readable, right?
74. Many libraries provide aesthetic APIs because *it's possible*, so it makes learning to use them *correctly*, much easier.

75. Cloning, or another word for deep copying.

76. How do you spell, "clone"?
77. "C-L-O-N-E"? or "serialize, deserialize"?
78. No one says, "Dolly the sheep was serialize, deserialized. They say, Dolly the sheep was cloned."
79. Software is harder to understand, when the expression of the idea is far away, from the idea itself.
80. And it's also sad when the recommended answer is,
81. "take this bit of memory, transform it to a different format, do the reverse transformation, and that's your clone".
82. Why not just, "copy paste", right?

83. There *has* been progress, some languages try to make things more expressive.
84. How do you spell "clone"? "structuredClone".
85. It's not guaranteed to do what you want though,
86. like sometimes it shallow clones, sometimes it doesn't clone type info, and sometimes it fails.
87. C#'s a bit funny, the docs say, "here's an interface, but don't use it!"
88. Can we do better?
89. Of course.

90. In Rust, clone is spelt `clone()`, and `clone()`, means clone.
91. No missed type info, no failures, no surprises. *(high pitch)*
92. When the representation matches your understanding, the expression is *perfect*.

93. Because of Rust's clarity and expressiveness, code is more comprehendable.
94. For semantics, you can read things once, and not have to go, it could be this or that. No, it's always, *the one*.
95. When there are multiple paths, you know where you came from.
96. When you want to say something, there's a word for it.
97. Communicating through software is hard enough, so let's refine our language.

98. Tooling. Rust has a really nice tooling ecosystem.

99. It ships with good standard tools, and there is *one* for each purpose.
100. You know, it's really nice when I want to code, that I can just... code,
101. and not have to install and learn the new tool of the day. Anyway.

102. `cargo` is Rust's package manager, and it has really nice UX.
103. When you tell it "run my application", it downloads dependencies, compiles your project, and runs your application.
104. And it's cancellable *and* idempotent as well, so you can stop it, and re-run the command, and it will *pick up, where it left off*.
105. Which takes away that mental check: before I run this, did I miss anything?
106. It has support for workspaces, so you can manage multiple packages in a single repository.
107. and it's easy to override dependencies, so you can test your code with a patched version of the dependency.
108. That is, *so many* things that need to be done, *can* be done, in a supported way.

109. Rust comes with a linter, called `clippy`.
110. Clippy teaches you how to write code in the idiomatic Rust way, which can help to make code easier to read, and in some cases, how to avoid bugs.
111. So it improves your code, *and!* it doesn't even use AI.
112. It's really nice to be taught how to be eloquent with Rust, at a digestable pace.
113. So in pull requests, more of the discussion can be focused on what we're writing, than on our ability to speak the language.

114. There are *many*, many more tools written by the community.
115. They are generally easy to set up and integrate into your build pipeline.
116. What's really nice about all this tooling is, when you run `cargo install $tool_name`, it just works... and *I'm using Windows*.
117. You don't get an obscure error message, which, plus some keywords, becomes the unique identifier to a stack overflow question, whose solution doesn't work on your computer.
118. So you spend far less time fiddling with tools, and more time building.

119. Safety. Not the kind you're thinking of, but psychological safety.

120. Here's an interesting... observation: most of my project dependencies have a version of `0.something.something`.
121. i.e. the major version is always `0`.
122. and this reveals an interesting trait about the Rust community: people are so concerned about making a promise that they cannot keep, most would never publish a crate as `1.0`.
123. Like, "aah, I might change the API in the next 20 years! So I'm not going to promise stability now."
124. In this ecosystem, keeping dependencies up to date is not a burdensome chore.
125. Periodically, I run `cargo upgrade --incompatible allow --recursive`, and, *again*, (pause) it, just, works.
126. Stress levels and anxiety for maintenance go down, psychological safety goes up.
127. So here is a thank you to the many of you, for keeping the promises that you did not make.

128. Finally, the experience beyond the code.
129. When you interact with the community, like ask a question in the users forum, no matter how simple or complex it is, someone's going to answer, and they answer with empathy and intellect.
130. There's no sentiment of, "Don't ask stupid questions! or, your question must be this good, before we answer you".
131. So not only do you receive the answer, you actually *feel* helped.

132. To summarize, this talk isn't intended to diminish the value of any other language.
133. There are *decades* of learnings from so many languages.

134. Not just what worked, but also what didn't work.

135. Rust has the late starter advantage.

136. It has the privileged position of taking the patterns that work for today's applications, and not having to support the patterns that don't.
137. Without the experimentation and lessons from all the other languages, there would *be* no Rust.
138. So it is simply a progression of technology, not a pedestal to stand on.

139. Imagine. I'd like you to,

140. Imagine never seeing a null pointer exception ever again.
141. Imagine reading code, and not needing to guess its meaning, because there's only one.
142. Imagine upgrading all your software, and *it just works*.
143. Imagine asking for help, and *being helped*.

144. (pause). With Rust, you don't have to imagine, take away the hype, that's the reality.
145. (glance up) Help. I'm `asyncing`. I need a lifetime. "move".
146. That's why we call it, the execution pool.

147. If you haven't tried Rust yet, give it a go, and enjoy the experience.
148. Peace.
