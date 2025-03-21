# 🎯 ezatm

Make your terminal life easier than finding cat videos on the internet! 🐱

## 🚀 Quick Start

1. Clone this repository:
```bash
git clone git@github.com:YueNiu328/ezatm.git
cd ezatm
```

> **Note:** The repository should be cloned to your home directory. For example, if your home directory is `/Users/username`, you should clone it to `/Users/username/`. This location is used as the `SCRIPT_DIR` in the `ezatm.sh` script. You can verify your home directory by running `echo $HOME` in your terminal.

2. Give execution permission to setup script:
```bash
chmod +x setup.sh
```

3. Run the setup script:
```bash
./setup.sh
```

4. Follow the interactive setup - choose either:
   - 🔄 Restart terminal (Fresh start)
   - ⚡️ Quick reload (Source configuration)

5. Start using `ez` command in your terminal!

## 📖 How to Use

### Prerequisites for Dongoes
1. First, ensure you have configured ATM by following the guide at:
   https://github.com/AlayaCare/nabu-cli-client/blob/master/bin/README.md

2. Get full data access permission:
```bash
atm switch-scope full
```

### Using the Command
```bash
ez <tenantURL> ff/mysql/clinical
```

Example tenant URLs:
- Production: `aushomecare.alayacare.ca`
- Staging: `aushomecare.staging.alayacare.ca`

Example command:
- ez aushomecare.alayacare.ca mysql

## ✨ Features

- 🛠️ Easy installation with interactive setup
- 🔧 Automatic shell detection (supports zsh and bash)
- 🎯 Simple `ez` command alias
- 🎨 Beautiful terminal interface

## 🔍 Requirements

- macOS or Linux
- zsh or bash shell
- Terminal access

## 📝 License

MIT License - feel free to use and modify!

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create your feature branch
3. Submit a pull request

## 🐛 Issues

Found a bug or have a suggestion? Please open an issue!