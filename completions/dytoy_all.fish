complete -xc dytoy_all -s h -d "Display help"
complete -xc dytoy_all -s n -d "Update only not existed tool"
complete -xc dytoy_all -s e -d "Update only essential tool"
complete -xc dytoy_all -s t -d "Only one specific tool"
type -q yq; and yq e -r -o=j -I=0 '.[].name' \
  ~/.config/.dytoy/tools.yaml | while read -l tool
  complete -xc dytoy_all -s t --arguments $tool
end
complete -xc dytoy_all -s d -d "Debug mode"
