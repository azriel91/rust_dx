# Notes 3

1. Heya everyone, my name is Azriel, and today's talk is called "The Development Experience Is Different With Rust".
2. First, learning.
3. When you first learn to write code, with your first language, you start from zero, and it may take 3 to 5 years to "get good".
4. and when you pick up other languages, you don't start from zero, you may start from 4 or 5,
5. and after a week you may be able to modify code without too much effort, and after a month you can probably begin writing without referring to documentation.

6. With Rust, it's a bit different.
7. You start here, which is like negative 2, and it may take 3 months to *unlearn what you know*, and *then* you start at zero.
8. It can take up to a year to stop avoiding a lifetime,
9. and beyond that it's, mostly smooth sailing.
10. I find that it pushes you towards concepts not necessarily common in other languages, so the ceiling gets raised a little bit.

11. Learning Rust.
12. When you try out Rust, you may experience this.
13. Assign a number to a variable, and increment it, and immediately you get an error.
14. You don't have to read this, the point is, Rust is going to tell you, "no".
15. You learn about mutability, and you append to a string, Rust says "no".

16. You learn the difference between Strings and slices, and try to mutate a string in a collection, but then again, Rust says "no".
17. You learn move semantics, and when you put something into a collection, you need to take it out before you can use it. Still, Rust says "no".
18. When you borrow it, you need to handle the null case. And are we there yet? "no".
19. The point is, when you're learning, even for the most basic of things, it can feel like "Rust says no to everything I *know* how to do".

20. But I implore you, keep going, and be adamant -- I've never lost to a computer before, and I'm not going to start now.
21. Like, if you can learn bash, you can learn Rust.
22. Think about it this way, "the damage you can accidentally do with bash, is far worse than the damage you can't do with Rust".

23. Also, consider this perspective.
24. Software that cannot compile is invalid, and therefore, incorrect.
25. Software that successfully compiles is valid, but not necessarily correct.
26. If more of the incorrect software, can be classified as invalid, then it follows that when your code successfully compiles, it's more likely to be *correct*.
27. Hopefully that perspective makes your learning experience better.

28. Let's take a look at the compiler message again.
29. Normally I would expect a compiler message to tell me, "azriel, here's where you're wrong!" and that's it!
30. But when you look at the message from the Rust compiler, it says,
31. "azriel, here's a mistake, this is why, and here is where and how to fix it."
32. (pause) So, it's not just pointing out a fault, then leaving.
33. No, it also teaches you the reason, and shows you the solution, *in colour!*

34. If you take nothing else away from this talk, take this:
35. Don't just tell people, "things are bad", and leave them in the dark, (pause) shine a light, take them to a better place.

36. Now you may be thinking, Rust is introducing complexity where there wasn't any before.
37. and you're right!
38. But it also provides clarity.
39. *(excitedly)* Let me show you.

40. This is how you know you're a software developer.
41. *(take out two canned drinks)*
42. Are these equal? *(smile)*
43. In other words, what does equality mean?

44. The meaning of the double equals operator varies with the type and the language.
45. That is, value equality, and referential equality, and for collections, whichever of those is delegated to.
46. Rust has chosen this definition:
47. Equals equals, equals, equals.

48. In Rust, the double equals operator, means value equality,
49. which is what you would've thought it means, *before* you were clever.

50. Errors. The way errors have been represented has evolved.

51. With sentinel values, which is using a special value within your return type, to mean "error",
52. the caller has to remember to check for the error value, then diverge the code paths for success and failure.
53. Example here is, for an integer, the caller has to remember to check for -1,
54. For a success object, non-`null` represents success,
55. and for an error object, `null` represents success,
56. which is just that much more mental effort.

57. Then came exceptions, which separated the success and failure code paths with compiler support.

58. However! `try/catch` blocks can be ambiguous as to which line throws the exception.
59. To be unambiguous, you'd have to give each line that could err, its own `try/catch` block.

60. and without IDE highlighting, there's no visible marker for which methods actually throw exceptions.

61. Also, when defining exception classes, there is friction.
62. Conventionally one should define a file for every exception, and multiple constructors within each,
63. which is quite a chore, when you have to do 10 of them.

64. So exceptions have made error handling a bit better, but can we further refine this part of programming?

65. Yes. Yes we can.

66. Rust's approach to error handling is to provide a `Result` type, where you pass in your error type.
67. Different kinds of errors can be written as enum variants, which is far less boilerplate than a file per error variant.

68. On usage, control flow is unambiguous by default,
69. as every error handling block is kept separate.

70. If it makes sense, you can still commonize the error handling code.

71. For functions that can fail, errors that are propagated are marked by a `?` operator.
72. So when reading code, it is possible to see which function calls can fail.

73. Rust is expressive,
74. and by expressive I mean, you can take an idea, and write it in code, without much effort.
75. And the converse as well, you can read the code, and grasp the idea, without much effort.

76. Which of these two do you read more naturally?
77. I'll tell you why: it's because when you buy coffee, the barista doesn't say, "That's dollars five, cents fifty".
78. No they say, "That's five dollars fifty cents".
79. What you *can* do in Rust, is implement behaviour over existing types, and create API like the second snippet.
80. (pause) Why is this useful?

81. Let's say you're writing code to render markdown to a file.
82. If you inline all the function calls, to understand it, you have to read from the middle out.
83. You could break them over multiple lines, which looks a bit better.
84. With Rust traits, you can write code like the third snippet, even when the type is defined externally.
85. (pause) There's something about that empty space and alignment that makes it more readable, right?
86. Many libraries provide aesthetic APIs because *it's possible*, so it makes learning to use them much easier.

87. Cloning, or another word for deep copying.

88. How do you spell, "clone"?
89. "C-L-O-N-E"? or "serialize, deserialize"?
90. No one says, "Dolly the sheep was serialize, deserialized. They say, Dolly the sheep was cloned."
91. Software is harder to understand, when the expression of the idea is far away, from the idea itself.
92. And it's also sad when the recommended answer is,
93. "take this bit of memory, transform it to a different format, do the reverse transformation, and that's your clone".
94. Why not just, "copy paste", right?

95. There *has* been progress, some languages try to make things more expressive.
96. How do you spell "clone"? "Clone".
97. It's not guaranteed to do what you want though,
98. like sometimes it shallow clones, sometimes it doesn't clone everything, and sometimes it fails.
99. C#'s a bit funny, the docs say, "here's an interface, but don't use it!"
100. Can we get turn those yellow bits into green?
101. Of course.

102. In Rust, clone is spelt `clone()`, and `clone()`, means clone.
103. No missed type info, no failures, no surprises. *(high pitch)*
104. Because the execution matches your understanding, the idea is expressed accurately.

105. Because of Rust's clarity and expressiveness, code becomes more comprehendable.
106. For semantics, you can read things once, and not have to go, it could be this or that.
107. When there are multiple paths, you know where you came from.
108. When you want to say something, there's a word for it.
109. Communicating through software is hard enough, so let's refine our language.

110. Tooling. Rust has a really nice tooling ecosystem.

111. It ships with good standard tools, and there is *one* for each purpose.
112. You know, it's really nice when I want to code, that I can just... code,
113. and not have to install and learn the new tool of the day. Anyway.

114. `cargo` is Rust's package manager, and it has really nice UX.
115. When you tell it "run my application", it downloads dependencies, compiles your project, and runs your application.
116. And it's cancellable *and* idempotent as well, so you can stop it, and re-run the command, and it will *pick up, where it left off*.
117. Which takes away that mental check: before I run this, did I miss anything?
118. It has support for workspaces, so you can manage multiple packages in a single repository.
119. and it's easy to override dependencies, so you can test your code with a patched version of the dependency.
120. That is, *so many* things that need to be done, *can* be done, in a supported way.

121. Rust comes with a linter, called `clippy`.
122. Clippy teaches you how to write code in the idiomatic Rust way, which can help to make code easier to read, and in some cases, how to avoid bugs.
123. So it improves your code, *and!* it doesn't even use AI.
124. It really nice to be taught how to be eloquent with Rust, at a digestable pace.
125. So in pull requests, more of the discussion can be focused on what we're writing, than on our ability to speak the language.

126. There are *many*, many more tools written by the community.
127. They are generally easy to set up and integrate into your build pipeline.
128. What's really nice about all this tooling is, when you run `cargo install $tool_name`, it just works... and *I'm using Windows*.
129. You don't get an obscure error message, which, plus some keywords, becomes the unique identifier to a stack overflow question, whose solution doesn't work on your computer.
130. So you spend far less time fiddling with tools, and more time building.

131. Safety. Not the kind you're thinking of, but psychological safety.

132. Here's an interesting... observation: most of my project dependencies have a version of `0.something.something`.
133. i.e. the major version is always `0`.
134. and this reveals an interesting trait about the Rust community: people are so concerned about making a promise that they cannot keep, most would never publish a crate as `1.0`.
135. Like, "aah, I might change the API in the next 20 years! So I'm not going to promise stability now."
136. In this ecosystem, keeping dependencies up to date is not a burdensome chore.
137. Periodically, I run `cargo upgrade --incompatible allow --recursive`, and, *again*, (pause) it, just, works.
138. Stress levels and anxiety for maintenance go down, psychological safety goes up.
139. So here is a thank you to the many of you, for keeping the promises that you did not make.

140. Finally, the experience beyond the code.
141. When you interact with the community, like ask a question in the users forum, no matter how simple or complex it is, someone's going to answer, and they answer with empathy and intellect.
142. There's no sentiment of, "Don't ask stupid questions! or, your question must be this good, before we answer you".
143. So not only do you receive the answer, you actually *feel* helped.

144. To summarize, this talk isn't intended to diminish the value of any other language.
145. There are *decades* of learnings from so many languages.

146. Not just what worked, but also what didn't work.

147. Rust has the late starter advantage.

148. It has the privileged position of taking the patterns that work for today's applications, and not having to support the patterns that don't.
149. Without the experimentation and lessons from all the other languages, there would *be* no Rust.
150. So it is simply a progression of technology, not a pedestal to stand on.

151. Imagine. I'd like you to,

152. Imagine never seeing a null pointer exception ever again.
153. Imagine reading code, and not needing to guess its meaning, because there's only one.
154. Imagine upgrading versions without a second thought, and going about your day.
155. Imagine asking for help, and *being helped*.
156. (pause). With Rust, you don't have to imagine, that's the reality.

157. And if you think you're a late starter, well, *you* have the late starter advantage.
158. You don't have to deal with lexical lifetimes, where we had to add braces around borrows.
159. You don't have to check the build table for which nightly has `clippy`.
160. You no longer have to wait and see if Rust is just another hype-train -- take away the hype, the goodness is real.

161. If you haven't tried Rust yet, give it a go, and enjoy the experience.
162. Peace.
