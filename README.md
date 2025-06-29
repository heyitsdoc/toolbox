
# 🧰 toolbox.sh

A modular shell script to manage and run your personal or project-specific scripts from a centralized command-line interface.

----------

## ⚙️ Features

-   Run multiple scripts from one entry point
    
-   Add new tools easily using `add_tools` utility
    
-   Add new tools by dropping scripts into a folder
    
-   Color-coded terminal output (optional)
    
-   Extendable architecture with functions or modular files
    

----------

## 🚀 Usage

```bash
./toolbox.sh [command] [options]

```

### Examples:

```bash
./toolbox.sh --pro --cpu
./toolbox.sh --net --latency
./toolbox.sh --kp

```

----------

## 🧩 Structure

```
toolbox
add_tool
proglist.txt
help.txt
scripts/
  ├── procdat.sh
  ├── netdat.sh
  └── kill_proc.sh

```

Each sub-script can be independently maintained, and `toolbox` will call them based on the command provided.

----------

## ➕ Adding Tools

Use the `add_tool` utility to simplify adding new scripts to the toolbox. It will handle:

-   Naming and placing scripts in the correct directory
    
-   Setting executable permissions
    
-   Adding optional templates or comments
    

```bash
./add_tools [tool-path]

```

----------

## 📥 Requirements

-   Bash 4+
    
-   (Optional)
    
    -   `curl` for web calls
        
    -   `jq` for JSON parsing
        
    -   `fzf` for fuzzy finding
        

----------

## 🛠️ Setup

1.  Make the main script and utility executable:
    

```bash
chmod +x toolbox add_tool

```

2.  (Optional) Make sub-scripts in `scripts/` executable:
    

```bash
chmod +x scripts/*.sh

```

3.  Run the toolbox:
    

```bash
./toolbox --help

```

----------

## 🧪 Contributing

If you’re using this as a public project:

-   Fork and clone the repo
    
-   Follow existing script formatting
    
-   Submit a pull request
    

----------

## 📌 Notes

This toolbox is meant to streamline repetitive tasks. Keep your commands descriptive and scripts minimal.

> Example aliases you might add to your `.bashrc` or `.zshrc`:

```bash
alias tb='./toolbox.sh'
alias tbu='./toolbox.sh update-system'

```
