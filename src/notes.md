1. Heya everyone! My name is Azriel, and I'm here to share what the development experience is like with Rust.
2. What I show in this presentation come from my time spent building:
3. a game,
4. command line tools,
5. an automation framework.

6. First, let's look at the experience of learning the language.
7. I think most of us, having written software for a decade, reckon, "I'm familiar with code, it takes about a week to be able to modify code comfortably in a different language, and in about a month I feel kind of familiar."
8. Right? Except in Rust, it took me about 6 months.
9. The point is, Rust is the first language that made me question my ability in a long time.
10. So if you feel "this is stupid, it doesn't work like other languages", I have good news. You're right!
11. I know many of you want to learn Rust, but your mind is resisting.
12. So I'm going to try and persuade your mind that "this is a good thing".

<!-- Here are some venn diagrams of "valid" and "correct" programs. -->

13. For compiled languages, valid programs are the ones that pass the compiler constraints -- though they may not necessarily be correct.
14. The more constraints there are, the more errors will be detected *before* your program is considered valid.
15. Rust has more compile-time constraints than other languages, and these constraints are to do with concepts not present in other languages.

16. Before understanding these constraints, *you know*, "I want to do X, but the compiler won't let me."
17. After understanding the constraints, those same messages are perceived as helpful.
18. "I want to do X, and, oh, I need to handle these 10 cases."
19. and I didn't spend any effort reading docs.
20. So if you are learning to use Rust and feel frustrated, I urge you to keep going, until you reach this point.

21. Second, the experience of reading and writing code.
22. Rust is *expressive* -- you can encode what you mean, with clear syntax.

23. Example 1, Deep copying an object
24. If you search "how to create deep copy in X language", you often get this:
25. `string = serialize(object); clone = deserialize(string);`
26. *sigh*. I know that achieves the *effect* I want, but it doesn't *do* what I want.
27. In fact, it teaches you to commit a heinous performance crime.
28. How do you deep copy in Rust? `object.clone()`.

29. Example 2, Accurate modelling.
30. To effectively communicate how code *should* work, make valid states possible, and make invalid states impossible.
31. In other words, what you can explain through code (the type system), don't use English (documentation).
32. In fact I'm going to use code right now.
33. Code example 1: Non-nullability must be supported by the language.

    ```rust,ignore
    struct ApiInput {
        name: String,
        score: u32,
    }

    # fn main() {
    let api_input = ApiInput {
        name: None,
        //    ^^^^ expected `String`, found `Option<_>`
        score: -1,
        //     ^^ cannot apply unary operator `-`
        //        unsigned values cannot be negated
    };
    # }
    ```

34. Code example 2: Can implement macros for custom compile time checks.

    ```rust
    struct NonEmptyString {
        value: String,
    }

    impl NonEmptyString {
        fn new(value: String) -> Result<Self, &'static str> {
            if value.is_empty() {
                Err("String cannot be empty")
            } else {
                Ok(Self { value })
            }
        }
    }

    // Usage:
    // Fails at runtime
    let s1 = NonEmptyString::new("".to_string())?;

    // Compile time check
    let s2 = non_empty_string!("");      // ❌ compile fail!
          // ^^^^^^^^^^^^^^^^^^^^^
          // `NonEmptyString` cannot be constructed from `""`.
    ```

33. Just imagine:
34. Never seeing a null pointer exception ever again.
35. Never wondering which line an exception came from.
36. Knowing every kind of error you need to handle *before* you run the code.
37. With Rust, you don't have to imagine anymore -- that's the reality.

38. Third, the experience of really nice tooling.
39. Rust comes with a code formatter, linter, and package manager out of the box.
40. That is, it comes with *one* formatter, one linter, and one package manager.
41. It sounds humourous, but having to switch between five different package managers, with a different build command for each repo, does hurt productivity.
42. It's really nice to be able to set up your tooling once, and have it work for any project.
43. instead of an obscure error message becoming the unique reference to a stack overflow solution that works on some machines.
44. I'm all for innovation an experimentation, but you know, when I'm building something, my attention should be spent on what I'm *building*, not what I'm *building with*.
45. The linter -- `clippy` -- is the senior dev I never knew I needed.
46. Instead of receiving feedback on a pull request on the idiomatic way to write code, `clippy` teaches you. Don't write code like that, write it like this, and here is why.
47. And for those of you who experience anxiety when receiving many comments on a pull request, I can relate when it feels better to be shown the errors of my ways by a tool, rather than reading a comment that says "*why* did you write it that way?". By the way, the person probably meant to say it as, "why *did* you write it that way?"

48. Fourth,


---

34. Third, the experience of making mistakes.
35.
35. You know, many compilers stop at the "what's wrong" part, and you have to figure out the rest.
36. When you break a compiler constraint, you get a compilation error telling you what is wrong, why it's wrong, and where and how to fix it. In colour!


36. There's less stupid stuff and you can accurately communicate with other developers.

35. I'll be fair, when you first feel familiar with Rust, it's all fun and games until you reach async Rust,
36. at which point generics becomes tricky again.


---

14. For non-compiled languages, programs with broken syntax are still considered valid -- it is possible to deploy them without realizing the error.

6. I'll cover the development experience for the following situations:

7. Learning the language. (compiler messages, before vs after understanding)
8. Writing code to represent a concept accurately.
9. Updating code to reflect changes in a concept.
10. Using and patching libraries.
11. Quality assurance. (rustfmt, clippy, cargo, cargo-audit, cargo-deny)
12. Stability.
13. Async.
