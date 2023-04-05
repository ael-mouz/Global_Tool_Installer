#!/bin/bash

# Create a new directory for your React app
mkdir my-react-app

# Change into the new directory
cd my-react-app

# Initialize a new npm project
npm init -y

# Install the React dependencies
npm install react react-dom

# Install the serve package globally
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
npm install -g serve

# Create a build of your React app
npm run build

# Serve the build using serve
serve -s build
