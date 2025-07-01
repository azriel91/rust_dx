### Tooling: Linter

<div style="display: flex; justify-content: center; gap: 20px;">
<div style="flex-basis: 45%;">

```rust ignore [1-6]
let maybe_n = Some(123);

match maybe_n {
    Some(n) => println!("{n}"),
    _ => (),
}
```

</div>
<div
    style="
        flex-basis: 10%;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
    ">
<div>📎&nbsp;clippy</div>
<div style="font-size: 30px;">➡️</div>
</div>
<div style="flex-basis: 45%;">

```rust ignore [1-6]
let maybe_n = Some(123);

if let Some(n) = maybe_n {
    println!("{n}")
}
```

</div>
</div>

```md
warning: you seem to be trying to use `match` for destructuring a single pattern.
Consider using `if let`
```

---

### Tooling: Formatter (🧹 rustfmt)

```diff
fn main() {
-      let a = 1;
-    let b = 2;
-let   sum= a+    b;
+    let a = 1;
+    let b = 2;
+    let sum = a + b;
}
```

#### Notes

1. Rust comes with a formatter, and it, formats your code.

<!-- --- -->

### Tooling: Linter (📎clippy)

```diff
 let x = 5;
-let in_range = x >= 3 && x < 8;
+let in_range = (3..8).contains(&x);
```

```diff
-let _ = 'a'..'z';  // 'a' to 'x'
+let _ = 'a'..='z'; // 'a' to 'z'
```

#### Notes

1. and it comes with a linter, called clippy.
2. Clippy teaches you how to write code in the idiomatic Rust way,
3. which can help to make code easier to read, and it also teaches you how to avoid bugs.
4. ... and it doesn't even use AI.
5. Clippy is like having a code review, before the pull request.
6. There are over [800 lints](https://rust-lang.github.io/rust-clippy/master/index.html) in the clippy index.

<!-- --- -->

### Tooling: Package Manager (cargo)

* Nice UX
* Workspace support (multi-package repo)

    ```toml
    [workspace]
    members = ["crate/*"]
    ```

* Easily override dependencies for testing

    ```toml
    [patch.crates-io]
    uuid = { path = "../uuid" }
    ```

#### Notes

1. Rust ships with a package manager, called cargo.
2. It does the standard package manager work you'd expect,
3. and it has support for workspaces, which is a way to manage multiple packages in a single repository.
4. It's easy to override dependencies, so you can test your code with a patched version of the dependency.
5. Cargo has nice UX -- `cargo run` downloads dependencies, compiles your project, and runs your application.

7. which is a step up from working with projects, where the tooling isn't designed for these workflows, and you have to learn something different every time.

<!-- --- -->

### Tooling: Others

Many tools by the community:

* **🛡️ audit** <!-- Ensures your dependencies have no vulnerabilities.-->
* **🙅 deny** <!-- Ensures all dependencies are published with specific licenses.-->
* **❓ about** <!-- Collates all licenses into a webpage for easy publishing.-->
* more in [lib.rs #cargo-subcommand](https://lib.rs/keywords/cargo-subcommand)

All integratable into your [build pipeline](https://github.com/azriel91/peace/blob/main/.github/workflows/ci.yml)

<!-- --- -->

### Tooling: What's Special

?? or should this be a summary slide for everything / upgrades?

It just works

`cargo install $tool_name` doesn't have obscure errors that happen on different operating systems.

You stay in the flow.

---

### Tooling: Others

Many tools by the community:

* **🛡️ audit:** Checks for known vulnerabilities

* **🙅 deny:** Denies using undesired dependencies

* **❓ about:** Collates licenses for publishing

* many more &ndash; [lib.rs#cargo-subcommand](https://lib.rs/keywords/cargo-subcommand)

All integratable into your [build pipeline](https://github.com/azriel91/peace/blob/main/.github/workflows/ci.yml)

#### Notes

1. There are *many*, many more tools written by the community.
2. These are all easy to integrate into your build pipeline, so you can spend less time fiddling with tools, and more time building.

<!-- --- -->
