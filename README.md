# My dotfiles

Dot files are managed by chezmoi, to apply simply install chezmoi and run the following lines.

```
chezmoi init git@gitlab.com:hoftherose-config/dotfiles.git
chezmoi -v apply
```

To save change to chezmoi simply modify the chezmoi repo and commit changes once you are done.


## Extra steps
For logout to work properly on wayland you want to set /etc/systemd/logind.conf such that KillUserProcesses=yes, otherwise there will be a collision with users when you try to log back in.

