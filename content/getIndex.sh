
cat << _EOF_ > ./_index.md
---
title: Introduction
type: docs
---
_EOF_


find './docs' -maxdepth 1 -type d -not -name "docs" | sort -n | while read top; do
cat << _EOF_ > "$top/_index.md"
---
bookFlatSection: true
weight: 1
title: "`basename $top`"
---

_EOF_
if [ -f "$top/README.md" ]; then
    cat "$top/README.md" >> "$top/_index.md"
    rm "$top/README.md";
fi
echo "Done: $top"
done


find './docs' -mindepth 2 -type d | sort -n | while read node; do
cat << _EOF_ > "$node/_index.md"
---
bookCollapseSection: true
title: "`basename $node`"
---

_EOF_
if [ -f "$node/README.md" ]; then
    cat "$node/README.md" >> "$node/_index.md"
    rm "${node}/README.md"
fi
echo "Done: $node"
done