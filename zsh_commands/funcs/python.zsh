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
}