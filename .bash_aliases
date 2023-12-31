alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gc!='git commit --verbose --amend'
alias gcn!='git commit --verbose --no-edit --amend'
alias gcf='git commit --verbose --fixup'
alias gcfa='git commit --verbose --fixup --all'
alias gcfgl='git config --list'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gf='git fetch'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias glg='git log --stat'
alias glgp='git log --stat --patch'
alias gm='git merge'
alias gma='git merge --abort'
alias gms='git merge --squash'
alias gmtl='git mergetool --no-prompt'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsd='git push --dry-run'
alias gpsf!='git push --force'
alias gpsv='git push --verbose'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbia='git rebase --interactive --autosquash'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias grev='git revert'
alias grm='git rm'
alias grmc='git rm --cached'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gstall='git stash --all'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias gta='git tag --annotate'
alias gtv='git tag | sort -V'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'

alias wakeupaplha='wakeonlan -i 192.168.0.49 08:60:6E:DA:07:E8'
