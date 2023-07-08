# Global Tool Installer
This script is a bash script that helps you install various tools globally using npm. It provides a menu-based interface to select and install individual tools or install all tools at once.
- Node.js and npm

### Prerequisites
Before using this script, make sure you have the following prerequisites installed:

- npm: Node Package Manager (npm) is required to install the tools. You can install it by installing ~~Node.js~~.

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
1. Create a build of your React app: `npm run build`

2. Serve the build using `serve`:

```shell
serve -s build
```

3. The app should now be accessible at `http://localhost:5000`

### 🐛 Troubleshooting
- If you encounter issues serving the app, make sure that you've installed the `serve` package globally and that your `PATH` variable is set up correctly.

- If you see a "port already in use" error, try specifying a different port with the `-l` option, for example:

```shell
serve -s build -l 3000
```

### 💡 Conclusion
That's it! You should now have a React app up and running using `serve`. If you have any issues or questions, feel free to reach out for help.
