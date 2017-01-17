export GVM_ROOT="/home/wowchan/.gvm"
export PATH="$PATH:$GVM_ROOT/bin"

if type foo > /dev/null 2>&1; then
    unset GOROOT
    unset GOARCH
    unset GOOS
    unset GOPATH
    unset GOBIN

    unset gvm_go_name
    unset gvm_pkgset_name

    mkdir -p "$GVM_ROOT/logs" > /dev/null 2>&1
    mkdir -p "$GVM_ROOT/gos" > /dev/null 2>&1
    mkdir -p "$GVM_ROOT/archive" > /dev/null 2>&1
    mkdir -p "$GVM_ROOT/archive/package" > /dev/null 2>&1
    mkdir -p "$GVM_ROOT/environments" > /dev/null 2>&1

    export GVM_VERSION=$(cat "$GVM_ROOT/VERSION")
    export GVM_PATH_BACKUP="$PATH"
    [ -f "$GVM_ROOT/environments/default" ] && . "$GVM_ROOT/environments/default"
    . "$GVM_ROOT/scripts/env/gvm"
else
    export GOPATH="$HOME/.gopath.d"
    export PATH="$PATH:$GOPATH/bin"
fi
