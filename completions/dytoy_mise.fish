complete -xc dytoy_mise -s h -d "Display help"
complete -xc dytoy_mise -s e -d "Update only essential tool"
complete -xc dytoy_mise -s t -d "Only one specific tool"
type -q yq; and yq e -r -o=j -I=0 'filter(.method == "mise") | .[].name' \
  ~/.config/.dytoy/tools.yaml | while read -l tool
  complete -xc dytoy_mise -s t --arguments $tool
end
