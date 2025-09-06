venv_a() {
    if [ -z "$1" ]; then
        echo "Activating venv in current dir."
        # Call the default command here
        source .venv/bin/activate
    else
        echo "Activating venv in: $1."
        source "$1/.venv/bin/activate"
    fi
}