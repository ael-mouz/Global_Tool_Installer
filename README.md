# Global Tool Installer
This script is a bash script that helps you install various tools globally using npm. It provides a menu-based interface to select and install individual tools or install all tools at once.
- Node.js and npm

### Prerequisites
Before using this script, make sure you have the following prerequisites installed:

- npm: Node Package Manager (npm) is required to install the tools. You can install it by installing [Node.js](https://nodejs.org/).

### Usage
To use this script, follow these steps:
1. Copy the script code into a file and save it with a `.sh` extension (e.g., `install-tools.sh`).

2. Open a terminal and navigate to the directory where you saved the script.

3. Make the script file executable by running the following command:
```bash
    chmod +x install-tools.sh
```

4. Run the script using the following command:
```bash
    ./install-tools.sh
```

5. The script will display a menu with a list of available tools. Enter the number corresponding to the tool you want to install or enter `0` to install all tools.

6. The script will install the selected tool(s) globally using npm. If you chose to install all tools, it will install each tool one by one.

7. Once the installation is complete, the script will display a success message for each installed tool.

### Tools
The script supports the installation of the following tools:
- Serve: `serve`
- Yarn: `yarn`
- Gulp: `gulp`
- Grunt: `grunt`
- Webpack: `webpack`
- Babel: `babel-cli`
- ESLint: `eslint`
- TypeScript: `typescript`
- Create React App: `create-react-app`
- Angular CLI: `@angular/cli`
- Vue CLI: `@vue/cli`
- Prettier: `prettier`
- Lodash: `lodash`
- Express Generator: `express-generator`
- Nodemon: `nodemon`
- ...

Note: The tool names listed above are the names used in the menu for selection. The corresponding npm package names are mentioned after the colon.
### Customization
You can modify the script to add or remove tools according to your needs. To add a new tool, follow these steps:
1. Open the script file in a text editor.
2. Locate the tools array declaration.
3. Add a new entry in the format `"Tool Name: npm-package-name"` to the `tools` array. Replace `Tool Name` with the name you want to display in the menu and `npm-package-name` with the actual npm package name.
Example: To add a tool named "My Tool" with the npm package name `my-tool`, add the following entry:

```bash
    "My Tool: my-tool"
```
4. Save the script file.
Now, when you run the script, your new tool will be available in the menu for installation.
