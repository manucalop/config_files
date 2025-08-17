if [ -f ~/.invoke-autocomplete.sh ]; then
    source ~/.invoke-autocomplete.sh
    alias inv="PYTHONPATH='' inv"
    alias invoke="PYTHONPATH='' invoke"
fi
