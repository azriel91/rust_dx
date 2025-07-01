## Writing Code: Ergonomics

<!-- --- -->

### Writing Code: Ergonomics

```java [1-15]
try { download(/* .. */); }
catch (UnknownHostException e) { /* Tell user to check if the URL is correct. */ }
catch (ConnectException e)     { /* Tell user to check the service status. */ }
catch (SocketException e)      { /* Retry -- may be an intermittent issue. */ }
```

<!-- --- -->

### Writing Code: Ergonomics

Function definition:

```java [1-15]
public void download(/* .. */)
throws
    UnknownHostException,
    ConnectException,
    SocketException { /* .. */ }
```

<!-- --- -->

### Writing Code: Ergonomics

Error definitions -- 3 of these:

```java [1-11]
public void UnknownHostException extends Exception {
    public UnknownHostException(String message) {
        super(message);
    }
    public UnknownHostException(String message, Throwable cause) {
        super(message, cause);
    }
    public UnknownHostException(Throwable cause) {
        super(cause);
    }
}
```

<!-- --- -->

### Writing Code: Ergonomics

* Function definition: One line per error variant
* Error definition: One file per error variant
* Error definition: 3 constructors per variant

<!-- --- -->

### Writing Code: Ergonomics

<!-- TODO: diagram -->

It's not that it's not possible to write resilient code; it's that, friction is high.

<!-- --- -->


### Writing Code: Ergonomics

Same concept in Rust

```rust ignore [1-7]
if let Err(error) = download(/* .. */) {
    match error {
        Error::DnsLookupFailed => { /* Tell user to check if the URL is correct. */ }
        Error::ConnectFailed   => { /* Tell user to check the service status. */ }
        Error::ConnectionBroke => { /* Retry -- may be an intermittent issue. */ }
    }
}
```

#### Notes

1. You know that code is how you communicate with the computer,
2. it is also how you communicate with another developer, which may be the future version of you.
3. While it is possible to do this in other languages, Rust's tooling support makes it really easy.

<!-- --- -->

### Writing Code: Ergonomics

```rust ignore [1-11]
pub fn download(/* .. */)
-> Result<(), Error> {
    // ..
}
```

<!-- --- -->

### Writing Code: Ergonomics

```rust ignore [1-11]
pub enum Error {
    DnsLookupFailed,
    ConnectFailed,
    ConnectionBroke,
}
```

<!-- --- -->
