# textOS

**textOS** is a lightweight, command-line-based simulated operating system built entirely using Windows batch scripting. Designed for educational or nostalgic purposes, it mimics an OS-like environment within the Windows Command Prompt. textOS offers system customization, basic file management, an integrated update checker, and a retro-style interface—all through the command line.

---

## Notice
This software has been archived and is designed to be used to memorialise the textOS era. Pcoo Group may release updates to this product if we spot any bugs in the code, or any vulnerabilities in the code that need to be fixed. 


---

## 🚀 Features

- **Setup Wizard** with Terms of Service agreement
- **Persistent settings** stored in Windows Registry
- **Interactive Home Menu** with multiple modules:
  - System Settings
  - Message Board (powered by online content)
  - File Manager (navigate directories, open files, create files/folders)
  - Update Checker (fetches info from GitHub)
- **Color Customization** with themed color modes
- **Basic Issue Tracker Launcher** via GitHub
- **Music Player** using VBScript and Windows Media Player COM object

---

## 🛠️ Installation

1. Download or clone the repository:

```bash
git clone https://github.com/AshleyPcoo/textOS.git
```

2. Navigate to the directory and run `textOS.bat` by double-clicking it or using Command Prompt:

```bash
cd textOS
start textOS.bat
```

> ⚠️ Make sure you're on a Windows system that supports PowerShell and Command Prompt. Administrator privileges are **not required**, but internet access is needed for some features.

---

## 📋 How It Works

- On first launch, textOS checks the Windows registry for a `firstrun` key. If missing, it starts the **setup flow**, including a Terms of Service display.
- After setup, users are presented with a simple menu to access various "apps" inside textOS.
- The system reads content from GitHub-hosted text files to keep the UI dynamic and update-friendly.

---

## 🎨 Customization

textOS supports several color modes:

- Default (White on Black)
- Green on Black
- Aqua on Black
- Red on Black
- Purple on Black
- Yellow on Black
- Light Mode (Black on White)
- Chill Mode (Custom color)

Switch between themes via the **Settings > Personalisation** menu.

---

## 🧪 File Manager Capabilities

- Browse folders and view contents
- Open files via default applications
- Create new files and folders
- Play local `.mp3` or other audio files using the built-in music player (VBScript-based)

---

## 🌐 Internet Features

- Terms of Service, message board, update checks, and version information are pulled live from:
  - [`PcooGroup/OnlineServices`](https://github.com/PcooGroup/OnlineServices)
- Make sure you're connected to the internet to access these features.

---

## 🐞 Issue Reporting

Found a bug or have a feature request?

→ Visit the [GitHub Issues Page](https://github.com/AshleyPcoo/textOS/issues)

---

## 📌 Notes

- This is a proof-of-concept project not meant to replace actual operating systems.
- It’s designed to be fun, educational, and retro-inspired.
- No user data is collected.

---

## 📄 License

This project is released under the [MIT License](LICENSE).
