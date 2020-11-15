DATE="${{ github.event.issue.created_at }}"
cat <<'EOF' > _posts/${DATE:0:10}-${{ github.event.issue.title }}.md
---
layout: post
title: ${{ github.event.issue.title }}
date: ${{ github.event.issue.created_at }}
---
${{ github.event.issue.body }}
EOF
echo "::set-output name=markdown-file::$(echo 0)"