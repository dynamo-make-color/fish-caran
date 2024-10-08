function install_gcloud
  type -q gcloud; or update_gcloud
end

function update_gcloud
  if not type -q asdf
    return
  end
  asdf plugin-add gcloud
  asdf install gcloud latest
  asdf global gcloud (asdf latest gcloud)
end

function install_awscli
  type -q awscli; or update_awscli
end

function update_awscli
  if not type -q asdf
    return
  end
  asdf plugin-add awscli
  asdf install awscli latest
  asdf global awscli (asdf latest awscli)
end

function install_az
  type -q az; or update_awscli
end

function update_az
  if not type -q asdf
    return
  end
  asdf plugin-add azure-cli
  asdf install azure-cli latest
  asdf global azure-cli (asdf latest azure-cli)
end

function install_asdf
  if type -q asdf; or test -e $HOME/.asdf
    return
  end

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

function update_asdf
  if not type -q asdf
    install_asdf
  end

  asdf update
end

function install_kubectl
  type -q kubectl; or update_kubectl
end

function update_kubectl
  if not type -q asdf
    return
  end

  asdf plugin-add kubectl
  asdf install kubectl latest
  asdf global kubectl (asdf latest kubectl)
end

function install_helm
  type -q helm; or update_helm
end

function update_helm
  if not type -q asdf
    return
  end

  asdf plugin-add helm
  asdf install helm latest
  asdf global helm (asdf latest helm)
end

function install_terraform
  type -q terraform; or update_terraform
end

function update_terraform
  if not type -q asdf
    return
  end

  asdf plugin-add terraform
  asdf install terraform latest
  asdf global terraform (asdf latest terraform)
end

function install_fzf
  if test -e ~/.fzf
    return
  end

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-zsh --all
end

function update_fzf
  cd ~/.fzf
  git pull origin master
  ~/.fzf/install --no-zsh --all
end

function install_cht
  mkdir -p ~/.local/bin
  curl -sSL https://cht.sh/:cht.sh -o ~/.local/bin/cht
  chmod +x ~/.local/bin/cht
end

function install_nix
  type -q nix
  and update_nix
  or curl -sSL https://nixos.org/nix/install | bash -s -- --no-daemon
end

function update_nix
  nix-channel --update
  nix-env -iA nixpkgs.nix nixpkgs.cacert
end

function install_pre_commit
  type -q pre-commit; or update_pre_commit
end

function update_pre_commit
  if not type -q asdf
    return
  end

  if not type -q python
    return
  end

  asdf plugin-add pre-commit
  asdf install pre-commit latest
  asdf global pre-commit (asdf latest pre-commit)
end
