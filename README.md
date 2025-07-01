# Rust DX

"The Development Experience Is Different With Rust" slides for RustForgeConf 2025.

## Building Slides

```sh
cargo install mdbook
cargo install mdslides
```

```powershell
mdslides --mdbook-path . `
  --output-dir ./html `
  --template template.html `
  --index-template index_template.html

cp src/*.svg ./html
cp src/*.png ./html
cp -Recurse -Force src/js ./html
cp -Recurse -Force src/css ./html
```

If you have [`watchexec`](https://crates.io/crates/watchexec-cli) installed, you can run:

```ps1
watchexec -w template.html -w build.ps1 -w src --shell pwsh -- ./build.ps1
```
