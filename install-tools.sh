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
	# Serve and Build Tools
	"Serve: serve"
	"Yarn: yarn"
	"Gulp: gulp"
	"Grunt: grunt"
	"Webpack: webpack"
	"Parcel: parcel-bundler"
	"PM2: pm2"
	
	# JavaScript Tools
	"Babel: babel-cli"
	"ESLint: eslint"
	"TypeScript: typescript"
	"Jest: jest"
	"Mocha: mocha"
	"Karma: karma"
	"Protractor: protractor"
	"Nightwatch: nightwatch"
	"Cypress: cypress"
	"Artillery: artillery"
	"Newman: newman"
	
	# Frameworks and Libraries
	"Create React App: create-react-app"
	"Angular CLI: @angular/cli"
	"Vue CLI: @vue/cli"
	"Nest CLI: @nestjs/cli"
	"Next.js: next"
	"Nuxt.js: nuxt"
	"Svelte: svelte"
	"Ember CLI: ember-cli"
	"Meteor: meteor"
	"Backbone.js: backbone-cli"
	"Preact: preact-cli"
	"Ionic CLI: ionic"
	"Cordova: cordova"
	"Electron: electron"
	"Polymer CLI: polymer-cli"
	"Nx: nx"
	"Storybook: @storybook/cli"
	"React Native: react-native-cli"
	
	# CSS and Styling Tools
	"Sass: node-sass"
	"Less: less"
	"Stylus: stylus"
	"PostCSS: postcss"
	"Autoprefixer: autoprefixer"
	"CSSO: csso"
	"Stylelint: stylelint"
	"PurgeCSS: purgecss"
	"Tailwind CSS: tailwindcss"
	"Bootstrap: bootstrap"
	"Bulma: bulma-cli"
	"Material-UI: @material-ui/cli"
	"Styled Components: styled-components"
	"CSS Modules: css-modules"
	"CSSnano: cssnano"
	
	# Utility Tools
	"Lodash: lodash"
	"Moment.js: moment"
	"Ramda: ramda"
	"Axios: axios"
	"UUID: uuid"
	"Cheerio: cheerio"
	"Dotenv: dotenv"
	"Nodemon: nodemon"
	"Commander: commander"
	"Inquirer: inquirer"
	"Chalk: chalk"
	"Puppeteer: puppeteer"
	"PM2: pm2"
	"Lerna: lerna"
	
	# Documentation Tools
	"JSDoc: jsdoc"
	"ESDoc: esdoc"
	"Swagger: swagger"
	"Docusaurus: docusaurus"
	"Typedoc: typedoc"
	"GitBook: gitbook"
	"MkDocs: mkdocs"
	
	# Static Site Generators
	"Gatsby: gatsby-cli"
	"Hugo: hugo"
	"Hexo: hexo-cli"
	"Eleventy: eleventy"
	"Jekyll: jekyll"
	
	# Server-side Frameworks
	"Express.js: express-generator"
	"Koa: koa-generator"
	"Feathers: feathers-cli"
	"AdonisJS: adonis"
	
	# Serverless Frameworks
	"Serverless Framework: serverless"
	"Chalice: chalice"
	"AWS Amplify: amplify"
	"Architect: arc"
	
	# Database Tools
	"Knex.js: knex"
	"Sequelize: sequelize-cli"
	"Mongoose: mongoose"
	
	# Deployment Tools
	"Netlify CLI: netlify-cli"
	"Vercel: vercel"
	"Heroku: heroku"
	"Now: now"
	"Surge: surge"
	"Firebase CLI: firebase-tools"
	
	# Task Management Tools
	"Taskbook: taskbook"
	"Taskell: taskell"
	"Taskwarrior: task"
	"Trello: trello-cli"
	"GitHub CLI: gh"
	
	# Version Control Tools
	"Git: git"
	"Git Flow: git-flow"
	"GitHub CLI: gh"
	"GitLab CI/CD: gitlab-ci-multi-runner"
	
	# Build Tools
	"Grunt: grunt"
	"Ant: ant"
	"MSBuild: msbuild"
	"Cake: cake"
	"GNU Make: make"
	"Rake: rake"
	
	# Testing Tools
	"Selenium WebDriver: selenium-webdriver"
	"TestCafe: testcafe"
	"Cucumber: cucumber"
	"AVA: ava"
	"Enzyme: enzyme"
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
