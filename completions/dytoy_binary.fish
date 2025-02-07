complete -xc dytoy_binary -s h -d "Display help"
complete -xc dytoy_binary -s n -d "Update only not existed tool"
complete -xc dytoy_binary -s e -d "Update only essential tool"
complete -xc dytoy_binary -s t -d "Only one specific tool"
type -q yq; and yq e -r -o=j -I=0 'filter(.method == "binary") | .[].name' \
  ~/.config/.dytoy/tools.yaml | while read -l tool
  complete -xc dytoy_binary -s t --arguments $tool
end
complete -xc dytoy_binary -s d -d "Debug mode"
