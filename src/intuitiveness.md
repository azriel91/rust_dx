## Intuitiveness

<!-- --- -->

### Intuitiveness: Equality

### 🥤 == 🥤

<!-- --- -->

### Intuitiveness: Equality

```java [1-7]
class Data { public int value; public Data(int value) { this.value = value; } }
String ab = "ab";
String c = "c";

"abc" == ab + c                  // string equality
new int[] {1} == new int[] {1}   // array equality
new Data(123) == new Data(123)   // object equality
```

<!-- --- -->

### Intuitiveness: Equality

| Language                  | ☕ Java | 🌐 JS | 🪟 C# | 💎 Ruby | 🐍 Python | 🦀 Rust |
|---------------------------|---------|-------|-------|---------|-----------|----------|
| "abc" == <br/>"ab" + "c"  |    ❓   |   🟢  |   🟢  |    🟢   |     🟢    |    🟢   |
| [1] == [1]                |    🔴   |   🔴  |   🔴  |    🟢   |     🟢    |    🟢   |
| Data(123) == Data(123)    |    🔴   |   🔴  |   🔴  |    🔴   |     🔴    | <img src="ferris_no.svg" style="width: 100px; height: 73px; display: inline-block; margin: 0;" />   |

<!-- --- -->

### Intuitiveness: Equality

```diff
+#[derive(PartialEq)]
 struct Data(i32);
```

<!-- --- -->

### Intuitiveness: Equality

| Language                  | ☕ Java | 🌐 JS | 🪟 C# | 💎 Ruby | 🐍 Python | 🦀 Rust |
|---------------------------|---------|-------|-------|---------|-----------|----------|
| "abc" == <br/>"ab" + "c"  |    ❓   |   🟢  |   🟢  |    🟢   |     🟢    |    🟢   |
| [1] == [1]                |    🔴   |   🔴  |   🔴  |    🟢   |     🟢    |    🟢   |
| Data(123) == Data(123)    |    🔴   |   🔴  |   🔴  |    🔴   |     🔴    |    🟢   |

<!-- --- -->

### Intuitiveness: Sensible defaults

Should `==` mean referential equality sometimes,<br />
and value equality other times?

🧠 Original thinking:

* primitive: value equality
* non-primitive: referential equality

🦀 Rust has chosen:

* ~~compiler error~~
* no default -- developer decides,<br />
  *but make it easy to code!*















## Intuitiveness

<!-- --- -->

### Intuitiveness: Equality

```java [1-7]
class Data { public int value; public Data(int value) { this.value = value; } }
String ab = "ab";
String c = "c";

"abc" == ab + c
new int[] {1} == new int[] {1}
new Data(123) == new Data(123)
```

<!-- --- -->

### Intuitiveness: Equality - Java

```java [1-7]
class Data { public int value; public Data(int value) { this.value = value; } }
String ab = "ab";
String c = "c";

"abc" == ab + c                // false
new int[] {1} == new int[] {1} // false
new Data(123) == new Data(123) // false
```

<!-- --- -->

### Intuitiveness: Equality - JavaScript

```js [1-7]
class Data { constructor(value) { this.value = value; } }
const ab = "ab";
const c = "c";

"abc" == ab + c                // true
[1] == [1]                     // false
new Data(123) == new Data(123) // false
```

<!-- --- -->

### Intuitiveness: Equality - C#

```cs [1-7]
class Data { public int value {get; set;} public Data(int value) {this.value = value;} }
String ab = "ab";
String c = "c";

"abc" == ab + c                // True
new int[] {1} == new int[] {1} // False
new Data(123) == new Data(123) // False
```

<!-- --- -->

### Intuitiveness: Equality - Ruby

```rb [1-7]
class Data def initialize(value) @value = value end end
ab = "ab"
c = "c"

"abc" == ab + c                # true
[1] == [1]                     # true
Data.new(123) == Data.new(123) # false
```

<!-- --- -->

### Intuitiveness: Equality - Rust

```rust ignore [1-7]
struct Data(i32);
let ab = String::from("ab");
let c = "c";

"abc" == ab + c                // true
[1] == [1]                     // true
new Data(123) == new Data(123) // compile error!
```

<!-- --- -->
