DATE="${{ github.event.issue.created_at }}"
cat <<'EOF' > _posts/"${DATE:0:10}-${{ github.event.issue.title }}".md
---
layout: post
title: ${{ github.event.issue.title }}
date: ${{ github.event.issue.created_at }}
---
${{ github.event.issue.body }}
EOF

REMOTE=https://${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
git config user.email "${{ github.actor }}@users.noreply.github.com"
git config user.name "${{ github.actor }}"
git pull ${REMOTE}
git checkout master
git add .
git status
git commit -am "Add new comment"
git push ${REMOTE} master