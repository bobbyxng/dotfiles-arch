# dotfiles-arch

Personal dotfiles for arch + niri + noctalia setup, managed with GNU Stow.

## Structure

- `bash/` — `.bashrc`
- `zsh/` — `.zshrc` (autosuggestions, syntax-highlighting, starship)
- `starship/` — `~/.config/starship.toml`
- `vscode/` — `~/.config/Code/User/settings.json`
- `git/` — `.gitconfig`
- ...

## Adding new dotfiles

```bash
mv ~/.config/something ~/dotfiles/appname/.config/something
cd ~/dotfiles
stow appname
git add .
git commit -m "add appname config"
git push
```
