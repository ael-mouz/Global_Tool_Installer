#!/bin/bash

# Check if ~/.npm-global directory exists and create it if not
if [[ ! -d "$HOME/.npm-global" ]]; then
  echo "Creating ~/.npm-global directory..."
  mkdir "$HOME/.npm-global"
fi

# Set npm prefix to ~/.npm-global
echo "Setting npm prefix to ~/.npm-global..."
npm config set prefix "$HOME/.npm-global"

# Add ~/.npm-global/bin to PATH
echo "Adding ~/.npm-global/bin to PATH..."
export PATH="$HOME/.npm-global/bin:$PATH"

# Define tool names and commands
tools=(
  "Serve: serve"
  "Yarn: yarn"
  "Gulp: gulp"
  "Grunt: grunt"
  "Webpack: webpack"
  "Babel: babel-cli"
  "ESLint: eslint"
  "TypeScript: typescript"
  "Create React App: create-react-app"
  "Angular CLI: @angular/cli"
  "Vue CLI: @vue/cli"
  "Prettier: prettier"
  "Lodash: lodash"
  "Express Generator: express-generator"
  "Nodemon: nodemon"
)

# Define colors
green='\033[0;32m'
yellow='\033[1;33m'
bold='\033[1m'
reset='\033[0m'

# Function to install a tool
install_tool() {
  tool_name=$1
  command=$2

  echo -e "${bold}Installing $tool_name...${reset}"
  if eval "npm install -g $command" > /dev/null 2>&1; then
    echo -e "${green}$tool_name installed successfully.${reset}"
  else
    echo -e "${yellow}Failed to install $tool_name.${reset}"
  fi
}

# Function to install all tools
install_all_tools() {
  echo -e "${bold}Installing all tools...${reset}"
  echo

  for tool in "${tools[@]}"; do
    tool_name=$(echo "$tool" | awk -F':' '{print $1}')
    command=$(echo "$tool" | awk -F':' '{print $2}')
    install_tool "$tool_name" "$command"
  done

  # echo -e "${green}All tools installed successfully.${reset}"
  # echo
}

# Function to display the menu
display_menu() {
  clear
  echo -e "${bold}Welcome to the Global Tool Installer!${reset}"
  echo
  echo "Please select the tool you want to install:"
  echo

  echo -e "[0] ${green}Install all tools${reset}"
  for i in "${!tools[@]}"; do
    echo -e "[$((i + 1))] ${green}${tools[$i]}${reset}"
  done

  echo

  read -p "Enter the number of the tool to install (or 0 to install all): " choice

  if [[ $choice -eq 0 ]]; then
    install_all_tools
  elif [[ $choice -ge 1 && $choice -le ${#tools[@]} ]]; then
    tool=${tools[$choice - 1]}
    tool_name=$(echo "$tool" | awk -F':' '{print $1}')
    command=$(echo "$tool" | awk -F':' '{print $2}')
    install_tool "$tool_name" "$command"
  else
    echo -e "${yellow}Invalid choice. Please try again.${reset}"
    echo
    display_menu
  fi
}

# Run the script
display_menu
