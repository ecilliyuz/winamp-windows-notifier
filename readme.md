# Winamp Windows Toast Notifier

A lightweight, zero-bloat background utility that displays native Windows 10 & 11 Toast notifications whenever a new track starts playing in Winamp.

No outdated plugins or legacy DLLs required.

---

## Features

- **Native Windows Toast:** Uses standard Windows 10/11 Action Center notifications.
- **Minimal Dependencies:** Uses internal Windows API (`ctypes`) to read Winamp's status—no heavy window-hook libraries needed.
- **Resource Friendly:** Polls with zero perceptible CPU or memory footprint.
- **Silent Background Execution:** Runs without keeping a terminal or console window open.
- **One-Click Startup Management:** Batch scripts included to easily install and uninstall from Windows Startup.

---

## Prerequisites

- Windows 10 or 11
- [Python 3.8+](https://www.python.org/downloads/) (Make sure **"Add Python to PATH"** was checked during installation)
- [Winamp](https://www.winamp.com/) (Classic or Modern versions)

---

## Installation

1. **Clone or download the repository:**
   ```bash
   git clone https://github.com/your-username/winamp-windows-notifier.git
   cd winamp-windows-notifier
   ```

2. **Install required dependency:**
   ```bash
   pip install -r requirements.txt
   ```

---

## Usage

### Run Manually
To test if it works with your current Winamp setup:
```bash
python winamp_notify.py
```
Change a song in Winamp, and a notification banner will pop up in the lower-right corner of your screen.

### Run Automatically on Startup (Recommended)
Double-click `add_to_startup.bat`.
- This creates a shortcut in your Windows Startup directory.
- It launches the script via `pythonw.exe` so **no command window remains visible**.

### Uninstall / Disable Startup
Double-click `remove_from_startup.bat`.
- Deletes the shortcut from Windows Startup.
- Automatically terminates any active background instances.

---

## In-Game Notification Troubleshooting

If notifications do not appear while playing games:

1. **Focus Assist / Do Not Disturb:**
   - Go to Windows **Settings > System > Focus Assist** (or **Notifications & actions**).
   - Under **Automatic rules**, set **"When I'm playing a game"** to **Off**.
2. **Display Mode:**
   - Toast notifications appear seamlessly in **Borderless Windowed** or **Windowed** game modes. Exclusive Fullscreen games may bypass the Windows Desktop Window Manager (DWM) layer.

---

## License

This project is open-source and available under the [MIT License](LICENSE).