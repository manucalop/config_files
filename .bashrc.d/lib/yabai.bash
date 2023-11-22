
function yabai-restart(){
    yabai --start-service
    yabai --restart-service
    sudo yabai --load-sa
}

function yabai-init(){
    sudo yabai --install-sa
    yabai-restart
}
