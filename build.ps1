mdslides --mdbook-path . `
  --output-dir ./html `
  --template template.html `
  --index-template index_template.html

cp src/*.svg ./html
cp src/*.png ./html
cp src/*.mp4 ./html
cp -Recurse -Force src/js ./html
cp -Recurse -Force src/css ./html
