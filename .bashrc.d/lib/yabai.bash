
function yabai-restart(){
    brew services restart yabai
    sudo yabai --load-sa
}

function yabai-init(){
    sudo yabai --install-sa
    yabai-restart
}
