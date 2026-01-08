# 🎛️ ControlDeck – Mobile Stream Deck App

ControlDeck is a **mobile-based Stream Deck application** that turns your smartphone into a **powerful, customizable control panel** for controlling applications, shortcuts, and system actions on a connected computer.

It eliminates the need for expensive hardware Stream Deck devices by using a **mobile app + desktop companion architecture**.

---

## 📌 Features

### 🎚 Stream Deck Core Features
- Customizable button grid
- Multiple profiles (Gaming, Coding, Streaming, etc.)
- App launching on PC
- Keyboard shortcuts & macros
- Media controls (Play, Pause, Volume)
- Folder-based buttons
- Long-press & multi-action buttons

### 📱 Mobile App Features
- Modern dark-mode UI
- Smooth animations & haptic feedback
- Profile switching with swipe gestures
- Local storage of layouts
- Secure device pairing

### 🖥 Desktop Companion Features
- Receives commands from mobile app
- Executes OS-level actions
- Cross-platform support (Windows / macOS / Linux)

---

## 🏗️ System Architecture

              [  Mobile App (Flutter) ]
                         ↓
                 WebSocket / Wi-Fi
                         ↓
             [ Desktop Companion App ]
                         ↓
        [ OS APIs → Applications / System ]


---

## 🛠 Tech Stack

### 📱 Mobile Application
- Framework: Flutter
- Language: Dart
- Platform: Android (iOS – future scope)

### 🖥 Desktop Application
- Runtime: Node.js
- Framework: Electron
- Communication: WebSocket

---

## 📂 Project Structure

### Mobile App

mobile_stream_deck/
│── lib/
│ ├── screens/
│ ├── widgets/
│ ├── services/
│ ├── models/
│── assets/
│── pubspec.yaml


### Desktop App

desktop_stream_deck/
│── src/
│ ├── websocket/
│ ├── actions/
│── main.js
│── package.json


---

## ⚙️ How It Works

1. Launch the desktop companion app
2. Open the ControlDeck mobile app
3. Pair devices using local Wi-Fi
4. Tap buttons on the phone
5. Actions are executed instantly on the PC

---

## 🔐 Security

- Local network communication only
- One-time pairing mechanism
- Permission-based action execution
- No cloud dependency (offline-first)

---

## 🚀 Installation (Development)

### Mobile App
```bash
git clone https://github.com/your-username/controldeck.git
cd mobile_stream_deck
flutter pub get
flutter run


# mobile_deckx

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
