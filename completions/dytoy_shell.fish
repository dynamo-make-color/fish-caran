complete -xc dytoy_shell -s h -d "Display help"
complete -xc dytoy_shell -s e -d "Update only essential tool"
complete -xc dytoy_shell -s t -d "Only one specific tool"
type -q yq; and yq e -r -o=j -I=0 'filter(.method == "shell") | .[].name' \
  ~/.config/.dytoy/tools.yaml | while read -l tool
  complete -xc dytoy_shell -s t --arguments $tool
end
