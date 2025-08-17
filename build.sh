#! /bin/bash
set -euo pipefail

mdslides --mdbook-path . \
  --output-dir ./html \
  --template template.html \
  --index-template index_template.html

for ext in svg png mp4
do
  find src/ -type f -name "*.${ext}" \
    | cut -d '/' -f 2- \
    | xargs -I {} bash -c 'mkdir -p ./html/$(dirname {}); cp src/{} ./html/{}'
done

cp -R src/js ./html
cp -R src/css ./html
