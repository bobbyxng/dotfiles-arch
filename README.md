# dotfiles-arch

Personal dotfiles for arch + niri + noctalia setup, managed with GNU Stow.

## Adding new dotfiles

```bash
mv ~/.config/something ~/dotfiles/appname/.config/something
cd ~/dotfiles
stow appname
git add .
git commit -m "add appname config"
git push
```
