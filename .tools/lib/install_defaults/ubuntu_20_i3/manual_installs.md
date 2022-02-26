# Manual installs

## Gnome i3

```
cd third_party/i3-gnome
sudo make install

gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true
```

## Icons in terminal

```
cd third_party/icons-in-terminal
./install.sh
```

# Node 14.x

```
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

# One dark gnome-terminal

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
```
