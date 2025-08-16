# Compiler Error slide

### Keep Going: Feedback

<pre class="terminal">
<b><span style='color:var(--bright-red,#f55)'>error[E0384]</span><span style='color:var(--bright-white,#fff)'>: cannot assign twice to immutable variable `x`</span></b>
 <b><span style='color:var(--bright-cyan,#5ff)'>--&gt; </span></b>src\main.rs:3:5
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>
<b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     let x = 0;
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <b><span style='color:var(--bright-cyan,#5ff)'>-</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>first assignment to `x`</span></b>
<b><span style='color:var(--bright-cyan,#5ff)'>3</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     x += 1;
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     <b><span style='color:var(--bright-red,#f55)'>^^^^^^</span></b> <b><span style='color:var(--bright-red,#f55)'>cannot assign twice to immutable variable</span></b>
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>
<b><span style='color:var(--bright-cyan,#5ff)'>help</span></b>: consider making this binding mutable
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>
<b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>| </span></b>    let <span style='color:var(--bright-green,#5f5)'>mut </span>x = 0;
  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <span style='color:var(--bright-green,#5f5)'>+++</span>

<b><span style='color:var(--bright-white,#fff)'>For more information about this error, try `rustc --explain E0384`.</span></b>
<b><span style='color:var(--yellow,#a60)'>warning</span>:</b> `simple` (bin &quot;simple&quot;) generated 2 warnings
<b><span style='color:var(--red,#a00)'>error</span>:</b> could not compile `simple` (bin &quot;simple&quot;) due to 1 previous error; 2 warnings emitted
</pre>

#### Notes

29. Let's take a look at the compiler message again.

<!-- --- -->

### Keep Going: Feedback

<pre class="terminal">
<span style="opacity: 0.3;"><b><span style='color:var(--bright-red,#f55)'>error[E0384]</span><span style='color:var(--bright-white,#fff)'>: cannot assign twice to immutable variable `x`</span></b></span>
<span style="opacity: 1.0;"> <b><span style='color:var(--bright-cyan,#5ff)'>--&gt; </span></b>src\main.rs:3:5</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     let x = 0;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <b><span style='color:var(--bright-cyan,#5ff)'>-</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>first assignment to `x`</span></b></span>
<span style="opacity: 1.0;"><b><span style='color:var(--bright-cyan,#5ff)'>3</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     x += 1;</span>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>     <b><span style="opacity: 1.0;"><span style='color:var(--bright-red,#f55)'>^^^^^^</span></span></b> <b><span style="opacity: 0.3;"><span style='color:var(--bright-red,#f55)'>cannot assign twice to immutable variable</span></span></b>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>help</span></b>: consider making this binding mutable</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>| </span></b>    let <span style='color:var(--bright-green,#5f5)'>mut </span>x = 0;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <span style='color:var(--bright-green,#5f5)'>+++</span></span>
<span style="opacity: 0.3;"></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-white,#fff)'>For more information about this error, try `rustc --explain E0384`.</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--yellow,#a60)'>warning</span>:</b> `simple` (bin &quot;simple&quot;) generated 2 warnings</span>
<span style="opacity: 0.3;"><b><span style='color:var(--red,#a00)'>error</span>:</b> could not compile `simple` (bin &quot;simple&quot;) due to 1 previous error; 2 warnings emitted</span>
</pre>

#### Notes

31. "azriel, here's where you're wrong!", and, and, "this is why, and here is how to fix it."

<!-- --- -->

### Keep Going: Feedback

<pre class="terminal">
<span style="opacity: 1.0;"><b><span style='color:var(--bright-red,#f55)'>error[E0384]</span><span style='color:var(--bright-white,#fff)'>: cannot assign twice to immutable variable `x`</span></b></span>
<span style="opacity: 0.3;"> <b><span style='color:var(--bright-cyan,#5ff)'>--&gt; </span></b>src\main.rs:3:5</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     let x = 0;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <b><span style='color:var(--bright-cyan,#5ff)'>-</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>first assignment to `x`</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>3</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     x += 1;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>     <b><span style="opacity: 0.3;"><span style='color:var(--bright-red,#f55)'>^^^^^^</span></span></b> <b><span style="opacity: 1.0;"><span style='color:var(--bright-red,#f55)'>cannot assign twice to immutable variable</span></span></b>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>help</span></b>: consider making this binding mutable</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>| </span></b>    let <span style='color:var(--bright-green,#5f5)'>mut </span>x = 0;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <span style='color:var(--bright-green,#5f5)'>+++</span></span>
<span style="opacity: 0.3;"></span>
<span style="opacity: 1.0;"><b><span style='color:var(--bright-white,#fff)'>For more information about this error, try `rustc --explain E0384`.</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--yellow,#a60)'>warning</span>:</b> `simple` (bin &quot;simple&quot;) generated 2 warnings</span>
<span style="opacity: 0.3;"><b><span style='color:var(--red,#a00)'>error</span>:</b> could not compile `simple` (bin &quot;simple&quot;) due to 1 previous error; 2 warnings emitted</span>
</pre>

<!-- --- -->

### Keep Going: Feedback

<pre class="terminal">
<span style="opacity: 0.3;"><b><span style='color:var(--bright-red,#f55)'>error[E0384]</span><span style='color:var(--bright-white,#fff)'>: cannot assign twice to immutable variable `x`</span></b></span>
<span style="opacity: 0.3;"> <b><span style='color:var(--bright-cyan,#5ff)'>--&gt; </span></b>src\main.rs:3:5</span>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 1.0;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     let x = 0;</span>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <b><span style='color:var(--bright-cyan,#5ff)'>-</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>first assignment to `x`</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-cyan,#5ff)'>3</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>     x += 1;</span>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>     <b><span style="opacity: 0.3;"><span style='color:var(--bright-red,#f55)'>^^^^^^</span></span></b> <b><span style="opacity: 1.0;"><span style='color:var(--bright-red,#f55)'>cannot assign twice to immutable variable</span></span></b>
<span style="opacity: 0.3;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 1.0;"><b><span style='color:var(--bright-cyan,#5ff)'>help</span></b>: consider making this binding mutable</span>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b></span>
<span style="opacity: 1.0;"><b><span style='color:var(--bright-cyan,#5ff)'>2</span></b> <b><span style='color:var(--bright-cyan,#5ff)'>| </span></b>    let <span style='color:var(--bright-green,#5f5)'>mut </span>x = 0;</span>
<span style="opacity: 1.0;">  <b><span style='color:var(--bright-cyan,#5ff)'>|</span></b>         <span style='color:var(--bright-green,#5f5)'>+++</span></span>
<span style="opacity: 1.0;"></span>
<span style="opacity: 0.3;"><b><span style='color:var(--bright-white,#fff)'>For more information about this error, try `rustc --explain E0384`.</span></b></span>
<span style="opacity: 0.3;"><b><span style='color:var(--yellow,#a60)'>warning</span>:</b> `simple` (bin &quot;simple&quot;) generated 2 warnings</span>
<span style="opacity: 0.3;"><b><span style='color:var(--red,#a00)'>error</span>:</b> could not compile `simple` (bin &quot;simple&quot;) due to 1 previous error; 2 warnings emitted</span>
</pre>

<!-- --- -->

<blockquote style="text-align: justify; max-width: 64%; padding: 0.5em 1.0em; width: fit-content;">

Don't just tell people, "things are bad", and
leave them in the dark,<br/>
<br/>
Shine a light, and take them to a better place.

</blockquote>

#### Notes

34. If you take nothing else away from this talk, take this:
35. Don't just tell people, "things are bad", and leave them in the dark, (pause) shine a light, and take them to a better place.

28. Let's take a look at the compiler message again, and this is what it says:
31. "azriel, here's a mistake, this is why, and here is where and how to fix it."
32. (pause) So, it's not just pointing out a fault, then leaving.
33. No, it also teaches you the reason, and shows you the solution, *in colour!*

34. If you take nothing else away from this talk, take this:
35. Don't just tell people, "things are bad", and leave them in the dark, (pause) shine a light, and take them to a better place.
36. Consider that, the next time you return a 400.
