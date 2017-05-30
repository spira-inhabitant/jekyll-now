#!/bin/bash


function replace {
    FILE="$1"
    SRC_PATTERN="$2"
    DST_PATTERN="$3"

    echo "Replacing $SRC_PATTERN with $DST_PATTERN in $FILE"
    sed -i "s;$SRC_PATTERN;$DST_PATTERN;g" $FILE
} 


for file in "$@"
do
    sed -i '/\s*<img.*/d' "$file"
    sed -i '/\s*<\/a.*/d' "$file"
    sed -i '/^.*load static.*/d' "$file"
    replace "$file" "\s*<a.*\(DSC.*\.JPG\).*$" "<a href=\\\"{{ site.image-server-url }}/img/{{ page.url }}/\1\\\"><img src=\\\"{{ site.image-server-url }}/img/{{ page.url }}/c200x200.\1\\\" class=\\\"img-thumbnail\\\"></a>"
    replace "$file" "\s*<a.*\(IMG.*\.JPG\).*$" "<a href=\\\"{{ site.image-server-url }}/img/{{ page.url }}/\1\\\"><img src=\\\"{{ site.image-server-url }}/img/{{ page.url }}/c200x200.\1\\\" class=\\\"img-thumbnail\\\"></a>"
    replace "$file" "        " ""

done
