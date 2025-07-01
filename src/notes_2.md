# Notes 2

1. Learning the language: hard -- syntax is good for "normal" stuff, feels weird for new concepts, complex when you get to complex trait bounds and async.
2. Writing code (once familiar):
    1. Really nice to be able to express concepts with less syntax. Instead of `public class X { private String value; }`, you can write it as `pub struct X(String);`
    2. Boilerplate is hidden behind macros `#[derive(Clone, Debug, PartialEq, Eq, Hash)]`. Java has lombok which mimics this.
    3. Really nice to write `a == b` and know that it's value equality, not accidentally referential equality.
    4. Really nice to *not* have non-sensible defaults, i.e. things are not cloneable, don't implement equality, aren't hashable, etcetera, by default.
    5. Support for sensible operations, like `clone` is properly done with memory, not serialization.
    6. Modern Rust has a lot of features that make it easier to write idiomatic code, such as pattern matching, closures, and iterators.
3. Saving code (tooling):
    1. Code formatting: Out of the box, Rust ships with `rustfmt`, which has sensible defaults, so I don't have to spend time formatting code (yes I'm one of those people who would format code manually).
    2. Compiler messages (warnings and errors): You get more feedback than usual, so you fix more issues *before* running your code.
    3. Compiler errors: When you get errors, they tell you what isn't working, why not, and usually where and how to fix it. Before Rust, I usually get told where the error shows up, but not the code that caused the error. Also, it tells you, "you're wrong!" without explaining why, or being guided on how to fix it. Pro tip: if you're ever helping someone, don't just point out where they're wrong, guide them towards the solution. Because when you help someone recover from a bad situation, you recover their morale.
4. Development best practices:
    1. Make sure you're writing idiomatic Rust using `cargo-clippy`. (+ like a senior dev in your shell story)
    2. Check for security vulnerabilities with `cargo-audit`
    3. Include licenses from all your dependencies with `cargo-about`
    4. Make sure you aren't using dependencies that don't match your license requirements with `cargo-deny`
5. Working with dependencies / reading code:
    1. Because it's easy to set up many IDEs with `rustfmt`, when I open any repo, I find it really easy to read most source code
    2. docs.rs is really really helpful. When you publish a package, it automatically gets put up to this site. And when you're searching for a type, it *just works*.
    3. Documentation is written with markdown, which makes it really easy to write.
    4. Also, Rust code snippets in markdown are *compiled and run*, so incorrect documentation sends a signal! This is the first time I'm happy about something being able to break.
    5. Here's one thing I find about the people who've stuck with Rust: these people have this *trait*, (let's call it grit), that makes them plough through the frustration, and learn to be familiar with this language. and that same grit means they write documentation and provide examples that make it so much easier to learn how to use their library.
6. Working with dependencies 2 -- stability
    1. Periodically, I run `cargo upgrade --incompatible allow --recursive`, and I continue with my coding, I stay in the flow.
    2. You know it's so nice when keeping up-to-date is a non-event.
    3. Here's something else I think is true about the Rust community: they are so concerned about making a promise that they cannot keep, that 99.999% of them would never publish a crate as `1.0`.
    4. So I'm really happy that when I have side projects that I re-visit once every few months, I can update dependencies, and continue where I left off.
7. Finally, the experience beyond the code. When you interact with the Rust community, they are *so helpful*.
    1. When you ask a question in the users Rust forum, no matter how simple or complex it is, someone's going to answer.
    2. And the answer's going to help.
    3. If you look at the questions people ask, really clever people take time to answer, and they answer with clarity.
    4. So you not only receive the answer, you actually *feel* helped.
8. By the way, I have to address this point. This talk isn't intended to criticize or diminish the value of any other language.
    1. Rust has the late starter advantage.
    2. There are *decades* of learnings from so many languages.
    3. Not just what worked, but also what didn't work.
    4. Rust has the privileged position of taking the patterns that work for today's applications, and not having to support the patterns that don't.
    5. Without the experimentation and lessons from all these other languages, there would *be* no Rust.
    6. So Rust is simply a progression of technology.

9. If you haven't already begun learning Rust, *you* have the late starter advantage.
    1. I was there when `rustfmt` and `clippy` weren't part of the Rust installation.
    2. If you want to build games, I was there when `wgpu` and `bevy` weren't part of the Rust ecosystem.
