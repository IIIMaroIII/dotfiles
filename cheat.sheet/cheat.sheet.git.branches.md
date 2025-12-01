cat > cheat.sheet.git.branches.md <<"EFO"
# ===============================
# Git Cheat Sheet
# ===============================


# =========== Branches ====================

# 1. View branches
git branch               # list local branches
git branch -a            # list all branches (local + remote)
git branch -vv           # show upstream & last commit

# 2. Create branches
git branch <branch-name>         # create a branch
git checkout -b <branch-name>    # create + switch
git switch -c <branch-name>      # modern create + switch

# 3. Switch branches
git checkout <branch-name>       # switch branch
git switch <branch-name>         # modern switch

# 4. Delete branches
git branch -d <branch-name>      # safe delete (merged)
git branch -D <branch-name>      # force delete
git push origin --delete <branch-name>  # delete remote branch

# 5. Rename branch
git branch -m <new-branch-name>  # rename current branch

# 6. Publish branch
git push -u origin <branch-name> # push branch + set upstream

# 7. Update branch with latest changes
git fetch origin
git merge origin/main            # merge main → current branch
git rebase origin/main           # rebase current branch on top of main

# 8. Merge branches
git checkout main
git merge <feature-branch>       # merge feature into main

# 9. Stash work
git stash
git stash list
git stash apply
git stash pop

# 10. Clean up old branches
git branch --merged     # list merged branches
git branch --no-merged  # list unmerged branches

# =========== Branches ====================
