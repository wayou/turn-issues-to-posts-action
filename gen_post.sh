#!/usr/bin/env bash

function sanitize_file_name {
    echo -n $1 | perl -pe 's/[\?\[\]\/\\=<>:;,''"&\$#*()|~`!{}%+]//g;' -pe 's/[\r\n\t -]+/-/g;'
}

DATE="${{ inputs.created_at }}"
mkdir -p ${{ inputs.dir }}
FILE_TITLE = sanitize_file_name ${{ inputs.title }}

cat <<'EOF' > _posts/"${DATE:0:10}-${FILE_TITLE}".md
---
layout: post
title: ${{ inputs.title }}
date: ${{ inputs.created_at }}
---
${{ inputs.body }}
EOF