REMOTE=https://${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
git config user.email "${{ github.actor }}@users.noreply.github.com"
git config user.name "${{ github.actor }}"
git pull ${REMOTE}
git checkout ${{ inputs.branch-name }}
git add .
git status
git commit -am "Add new comment"
git push ${REMOTE} ${{ inputs.branch-name }}