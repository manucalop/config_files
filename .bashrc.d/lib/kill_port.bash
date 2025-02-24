kill_port() {
    local port=$1
    kill -9 $(lsof -ti:$port)
}
