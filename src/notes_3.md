<style>
li { page-break-inside: avoid; }
</style>

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
19. When you're learning, even for the most basic of things, it can feel like "Rust says no to everything I *know* how to do".

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
35. Don't just tell people, "things are bad", and leave them in the dark, (pause) shine a light, and take them to a better place.

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
50. So your development experience up till now, has been tainted by complexity that you didn't need to know.

51. Errors. The way errors have been represented has evolved.

52. With sentinel values, which is using a special value within your return type, to mean "error",
53. the caller has to remember to check for the error value, then diverge the code paths for success and failure.
54. Example here is, for an integer, the caller has to remember to check for -1,
55. For a success object, non-`null` represents success,
56. and for an error object, `null` represents success,
57. which is just that much more mental effort when understanding code.

58. Then came exceptions, which separated the success and failure code paths with compiler support.

59. However! `try/catch` blocks can be ambiguous as to which line throws the exception.
60. To be unambiguous, you'd have to give each line that could fail, its own `try/catch` block.

61. and without IDE highlighting, there's no visible marker for which functions *actually* throw exceptions.

62. On the definition side, when defining exception classes, there is friction.
63. Conventionally one should define a file for every exception, and multiple constructors within each,
64. which is quite a chore, when you have to do 10 of them.

65. So exceptions have made error handling a bit better, but can we further refine this part of programming?

66. Yes. Yes we can.

67. Rust's approach to error handling is to provide a `Result` type, where you pass in your error type.
68. Different kinds of errors can be written as enum variants, which is far less boilerplate than a file per error variant.

69. On usage, control flow is unambiguous by default,
70. as every error handling block is kept separate.

71. If it makes sense, you can still commonize the error handling code.

72. For functions that can fail, errors that are propagated are marked by a `?` operator.
73. So when reading code, it is possible to see which function calls can fail.

74. Rust is expressive,
75. and by expressive I mean, you can take an idea, and write it in code, without much effort.
76. And the converse as well, you can read the code, and grasp the idea, without much effort.

77. Which of these two do you read more naturally?
78. I'll tell you why: it's because when you buy coffee, the barista doesn't say, "That's dollars five, cents fifty".
79. No they say, "That's five dollars fifty cents".
80. What you *can* do in Rust, is implement behaviour over existing types, and create API like the second snippet.
81. (pause) Why is this useful?

82. Let's say you're writing code to render markdown to a file.
83. If you inline all the function calls, to understand it, you have to read from the middle out.
84. You could break them over multiple lines, which looks a bit better.
85. With traits, you can write code like the third snippet, even when the type is defined externally.
86. (pause) There's something about that empty space and alignment that makes it more readable, right?
87. Many libraries provide aesthetic APIs because *it's possible*, so it makes learning to use them much easier.

88. Cloning, or another word for deep copying.

89. How do you spell, "clone"?
90. "C-L-O-N-E"? or "serialize, deserialize"?
91. No one says, "Dolly the sheep was serialize, deserialized. They say, Dolly the sheep was cloned."
92. Software is harder to understand, when the expression of the idea is far away, from the idea itself.
93. And it's also sad when the recommended answer is,
94. "take this bit of memory, transform it to a different format, do the reverse transformation, and that's your clone".
95. Why not just, "copy paste", right?

96. There *has* been progress, some languages try to make things more expressive.
97. How do you spell "clone"? "Clone".
98. It's not guaranteed to do what you want though,
99. like sometimes it shallow clones, sometimes it doesn't clone everything, and sometimes it fails.
100. C#'s a bit funny, the docs say, "here's an interface, but don't use it!"
101. Can we get turn those yellow bits into green?
102. Of course.

103. In Rust, clone is spelt `clone()`, and `clone()`, means clone.
104. No missed type info, no failures, no surprises. *(high pitch)*
105. Because the execution matches your understanding, the idea is expressed accurately.

106. Because of Rust's clarity and expressiveness, code becomes more comprehendable.
107. For semantics, you can read things once, and not have to go, it could be this or that. No, it's always, *the one*.
108. When there are multiple paths, you know where you came from. You don't go, "I am on this path. did I come from here, or there? Oh *what* a mystery."
109. When you want to say something, there's a word for it.
110. Communicating through software is hard enough, so let's refine our language.

111. Tooling. Rust has a really nice tooling ecosystem.

112. It ships with good standard tools, and there is *one* for each purpose.
113. You know, it's really nice when I want to code, that I can just... code,
114. and not have to install and learn the new tool of the day. Anyway.

115. `cargo` is Rust's package manager, and it has really nice UX.
116. When you tell it "run my application", it downloads dependencies, compiles your project, and runs your application.
117. And it's cancellable *and* idempotent as well, so you can stop it, and re-run the command, and it will *pick up, where it left off*.
118. Which takes away that mental check: before I run this, did I miss anything?
119. It has support for workspaces, so you can manage multiple packages in a single repository.
120. and it's easy to override dependencies, so you can test your code with a patched version of the dependency.
121. That is, *so many* things that need to be done, *can* be done, in a supported way.

122. Rust comes with a linter, called `clippy`.
123. Clippy teaches you how to write code in the idiomatic Rust way, which can help to make code easier to read, and in some cases, how to avoid bugs.
124. So it improves your code, *and!* it doesn't even use AI.
125. It really nice to be taught how to be eloquent with Rust, at a digestable pace.
126. So in pull requests, more of the discussion can be focused on what we're writing, than on our ability to speak the language.

127. There are *many*, many more tools written by the community.
128. They are generally easy to set up and integrate into your build pipeline.
129. What's really nice about all this tooling is, when you run `cargo install $tool_name`, it just works... and *I'm using Windows*.
130. You don't get an obscure error message, which, plus some keywords, becomes the unique identifier to a stack overflow question, whose solution doesn't work on your computer.
131. So you spend far less time fiddling with tools, and more time building.

132. Safety. Not the kind you're thinking of, but psychological safety.

133. Here's an interesting... observation: most of my project dependencies have a version of `0.something.something`.
134. i.e. the major version is always `0`.
135. and this reveals an interesting trait about the Rust community: people are so concerned about making a promise that they cannot keep, most would never publish a crate as `1.0`.
136. Like, "aah, I might change the API in the next 20 years! So I'm not going to promise stability now."
137. In this ecosystem, keeping dependencies up to date is not a burdensome chore.
138. Periodically, I run `cargo upgrade --incompatible allow --recursive`, and, *again*, (pause) it, just, works.
139. Stress levels and anxiety for maintenance go down, psychological safety goes up.
140. So here is a thank you to the many of you, for keeping the promises that you did not make.

141. Finally, the experience beyond the code.
142. When you interact with the community, like ask a question in the users forum, no matter how simple or complex it is, someone's going to answer, and they answer with empathy and intellect.
143. There's no sentiment of, "Don't ask stupid questions! or, your question must be this good, before we answer you".
144. So not only do you receive the answer, you actually *feel* helped.

145. To summarize, this talk isn't intended to diminish the value of any other language.
146. There are *decades* of learnings from so many languages.

147. Not just what worked, but also what didn't work.

148. Rust has the late starter advantage.

149. It has the privileged position of taking the patterns that work for today's applications, and not having to support the patterns that don't.
150. Without the experimentation and lessons from all the other languages, there would *be* no Rust.
151. So it is simply a progression of technology, not a pedestal to stand on.

152. Imagine. I'd like you to,

153. Imagine never seeing a null pointer exception ever again.
154. Imagine reading code, and not needing to guess its meaning, because there's only one.
155. Imagine upgrading versions without a second thought, and going about your day.
156. Imagine asking for help, and *being helped*.
157. (pause). With Rust, you don't have to imagine, that's the reality.

158. And if you think you're a late starter, well, *you* have the late starter advantage.
159. You don't have to deal with lexical lifetimes, where we had to add braces around borrows.
160. You don't have to check the build table for which nightly has `clippy`.
161. You no longer have to wait and see if Rust is just another hype-train -- take away the hype, the goodness is real.

162. If you haven't tried Rust yet, give it a go, and enjoy the experience.
163. Peace.
