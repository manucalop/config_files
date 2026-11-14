export LDFLAGS="-L$(brew --prefix)/opt/mysql-client/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/mysql-client/include"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/mysql-client/lib/pkgconfig"
