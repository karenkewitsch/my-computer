venv_a() {
    venv_dir="${1:-.venv}"
    echo "Activating venv in: $venv_dir."
    source "$venv_dir/bin/activate"
}

venv_r() {
    deactivate
    venv_dir="${1:-.venv}"
    rm -r "$venv_dir"
}