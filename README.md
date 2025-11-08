# Shake to Get Quote App

A Flutter app that shows motivational quotes when you shake your phone.

## How It Works

### Native Side (Android - Kotlin)
**File**: `MainActivity.kt`

- Uses **SensorManager** to detect phone shakes
- Listens to accelerometer data
- When shake detected → sends event to Flutter via **EventChannel**

### Flutter Side (Dart)
**File**: `home_view.dart`

- Listens to **EventChannel** for shake events
- When event received → displays random motivational quote

## Communication

```
Android (Kotlin)          Flutter (Dart)
─────────────────         ──────────────
SensorManager              EventChannel
      ↓                          ↑
Shake detected                   │
      ↓                          │
EventChannel.send("shake") ──────┘
                                 ↓
                         Show random quote
```

## Channel Name
`shake_detector_channel`

## Key Files

- `MainActivity.kt` - Shake detection + EventChannel sender
- `native_communication.dart` - EventChannel listener wrapper
- `home_view.dart` - UI + quote display
- `consts.dart` - List of quotes



Then shake your phone to see quotes!

## Technologies Used

- **EventChannel** - One-way communication from native → Flutter
- **SensorManager** - Android accelerometer access
- **Accelerometer** - Detects phone movement

---

Simple and clean native communication with EventChannel! 🚀

