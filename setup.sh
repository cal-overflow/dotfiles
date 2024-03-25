#!/bin/zsh

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
LIGHT_GRAY='\033[90m'
RED='\033[0;31m'
RESET='\033[0m'

DEBUG_LOGFILE="$(pwd)/setup_logfile"
ERROR_DID_OCCUR=1

GIT_CLONE_URL=$(git config --get remote.origin.url)

echo $(date) > $DEBUG_LOGFILE
echo "${BOLD}Running setup script${RESET}"


get_done_message_based_on_status_code () {
  if [ $1 -eq "0" ]; then
    echo "${GREEN}Done${RESET}"
  else
    echo "${YELLOW}An error occured ${LIGHT_GRAY}(See logs for details)${RESET}"
    ERROR_DID_OCCUR=0
  fi
}

# Clone the repository if this script is called from elsewhere (i.e., quick-setup from README)
if [[ ! "$GIT_CLONE_URL" =~ (https:\/\/|git@)github.com(\/|:)cal-overflow\/dotfiles\.git ]]; then
  echo -n "Cloning repository cal-overflow/dotfiles from GitHub... " | tee -a $DEBUG_LOGFILE

  # First try cloning with SSH, then try HTTPS as a last resort
  git clone git@github.com:cal-overflow/dotfiles.git > $DEBUG_LOGFILE 2>&1 ||\
  git clone https://github.com/cal-overflow/dotfiles.git > $DEBUG_LOGFILE 2>&1

  cd dotfiles
  echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE
fi


echo "\n${BOLD}Installations${RESET}" | tee -a $DEBUG_LOGFILE

echo -n "Installing Oh My Zsh... " | tee -a $DEBUG_LOGFILE
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> $DEBUG_LOGFILE 2>&1
else
  echo "ZSH detected. Skipping installation" >> $DEBUG_LOGFILE
fi
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE


echo -n  "Installing Homebrew... " | tee -a $DEBUG_LOGFILE
if [ ! $(command -v brew) ]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >> $DEBUG_LOGFILE 2>&1

  if [[ ! -f ~/.zprofile ]]; then
    touch ~/.zprofile
  fi

  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)" >> $DEBUG_LOGFILE 2>&1
  brew update >> $DEBUG_LOGFILE 2>&1
else
    echo "Homebrew detected. Skipping installation" >> $DEBUG_LOGFILE
fi
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE

echo "${BOLD}Installing formulae${RESET}" | tee -a $DEBUG_LOGFILE
while read formulae_name; do 
  echo -n "Installing formulae $formulae_name... " | tee -a $DEBUG_LOGFILE
  brew install $formulae_name >> $DEBUG_LOGFILE 2>&1
  echo $(get_done_message_based_on_status_code $?)
done < brew_formulae.txt



echo "\n${BOLD}Configurations${RESET}" | tee -a $DEBUG_LOGFILE

echo -n "Configuring ZSH... " | tee -a $DEBUG_LOGFILE
cp -r .zsh ~
echo "PATH=$PATH" >> ~/.zsh/paths
cp .zshrc ~
source ~/.zshrc
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE


echo -n "Configuring NVM... " | tee -a $DEBUG_LOGFILE # necessary for some neovim plugins
echo "export NVM_DIR=~/.nvm\nsource \$(brew --prefix nvm)/nvm.sh" >> ~/.zsh/config
source ~/.zshrc
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE


# echo -n "Installing Node LTS... " | tee -a $DEBUG_LOGFILE # necessary for some neovim plugins
# nvm install >> $DEBUG_LOGFILE 2>&1
# echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE
# nvm use | tee -a $DEBUG_LOGFILE


# # LSP installation (node modules)
# echo -n "Installing LSP Servers via NPM... " | tee -a $DEBUG_LOGFILE # necessary for some neovim plugins
# npm i -g vscode-langservers-extracted 2>&1
# echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE


##############
# Neovim setup
##############
echo "\n${BOLD}Neovim${RESET}" | tee -a $DEBUG_LOGFILE
mkdir ~/.config/nvim >> $DEBUG_LOGFILE 2>&1
echo -n "Saving repository config in ~/.config/nvim... " | tee -a $DEBUG_LOGFILE
cp -r .config/nvim/* ~/.config/nvim/.
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE

echo -n "Installing vim-plug... " | tee -a $DEBUG_LOGFILE
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' >> $DEBUG_LOGFILE 2>&1
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE


echo -n "Installing neovim plugins... " | tee -a $DEBUG_LOGFILE
nvim --headless +PlugClean! +PlugInstall +qa
echo $(get_done_message_based_on_status_code $?) | tee -a $DEBUG_LOGFILE

echo "${BOLD}Installing LSP servers through neovim mason${RESET}" | tee -a $DEBUG_LOGFILE
while read server; do 
  echo -n "Installing language server $server... " | tee -a $DEBUG_LOGFILE
  nvim --headless  -c "MasonInstall $server" -c qa >> $DEBUG_LOGFILE 2>&1
  echo $(get_done_message_based_on_status_code $?)
done < language_servers.txt


echo "\n${BOLD}Git ${LIGHT_GRAY}(interactive)${RESET}" | tee -a $DEBUG_LOGFILE
git config --global commit.gpgsign true
echo "${LIGHT_GRAY}commit gpg signing: enabled${RESET}" | tee -a $DEBUG_LOGFILE
git config --global core.editor "vim"
echo "${LIGHT_GRAY}default editor: vim${RESET}" | tee -a $DEBUG_LOGFILE

PREV_GIT_NAME=$(git config --global user.name)
echo "${LIGHT_GRAY}Current git user.name: \"$PREV_GIT_NAME\"$RESET" | tee -a $DEBUG_LOGFILE
echo -n "${BOLD}Enter your full name:$RESET ${LIGHT_GRAY}(Press enter to skip)$RESET "
read user_name
if [[ ! -z "$user_email" ]]; then
  git config --global user.name "$user_name"
  echo "git config --global user.name \"$user_name\"" >> $DEBUG_LOGFILE
fi

PREV_GIT_EMAIL=$(git config --global user.email)
echo "${LIGHT_GRAY}Current git user.email: \"$PREV_GIT_EMAIL\"$RESET" | tee -a $DEBUG_LOGFILE
echo -n "${BOLD}Enter your email address:$RESET ${LIGHT_GRAY}(Press enter to skip)$RESET "
read user_email
if [[ ! -z "$user_email" ]]; then
  git config --global user.email "$user_email"
  echo "git config --global user.email \"$user_name\"" >> $DEBUG_LOGFILE
fi

# cleanup log file (remove color codes)
cleaned_logs=$(sed -e "s/\x1B[^m]*m//g" $DEBUG_LOGFILE)
echo $cleaned_logs > $DEBUG_LOGFILE

if [ $ERROR_DID_OCCUR -eq 0 ]; then
  echo "\n${RED}At least one error occurred during the setup.${RESET}"
  echo "See $DEBUG_LOGFILE to troubleshoot errors"
  exit 1
else
  echo "\n${GREEN}Setup complete${RESET}"
  echo "Some things you may still want to do:"
  echo "1) Configure git credentials (SSH)"
  echo "2) Configure git GPG for signed commits"
fi

