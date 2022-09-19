function yabai-init(){
    sudo yabai --install-sa
    sudo yabai --load-sa
}

function yabai-restart(){
    brew services restart yabai
}
