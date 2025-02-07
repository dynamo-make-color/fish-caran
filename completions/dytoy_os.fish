complete -xc dytoy_os -s h -d "Display help"
complete -xc dytoy_os -s e -d "Update only essential tool"
complete -xc dytoy_os -s t -d "Only one specific tool"
type -q yq; and yq e -r -o=j -I=0 'filter(.method == "os") | .[].name' \
  ~/.config/.dytoy/tools.yaml | while read -l tool
  complete -xc dytoy_os -s t --arguments $tool
end
