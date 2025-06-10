venv_activate() {
    if [ -z "$1" ]; then
        echo "Activating venv in current dir."
        # Call the default command here
        source .venv/bin/activate
    else
        echo "Activating venv in: $1."
        source "$1/.venv/bin/activate"
    fi
}

venv_create() {
    py_v=$(python --version)
    if [ -z "$1" ]; then
        echo "Creating venv with Python version $py_v in current dir."
        python -m venv .venv
    else
        echo "Creating venv with Python version $py_v in: $1."
        python -m venv "$1/.venv"
    fi
    venv_activate $1
    pip install --upgrade pip
    pip install poetry
}

venv_reset() {
    # set variable to input arg if there else use PWD
    venv_path=${1:-$(pwd)}
    venv_path=$venv_path/.venv
    echo "Resetting venv: $venv_path"
    deactive 2>/dev/null || true
    rm -rf $venv_path 2>/dev/null
    venv_create $venv_path
}