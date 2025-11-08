import 'dart:async';
import 'package:flutter/services.dart';

/// A simple class to handle native shake detection communication
/// Uses EventChannel to receive shake events from Android
class NativeCommunication {
  // Channel name - must match Android implementation
  static const String _shakeEventChannelName = 'shake_detector_channel';

  // EventChannel for receiving shake events from native
  static const EventChannel _eventChannel = EventChannel(
    _shakeEventChannelName,
  );

  // Stream subscription
  StreamSubscription? _shakeSubscription;

  /// Start listening for shake events
  /// Callback function will be called whenever a shake is detected
  void startShakeListener(Function() onShakeDetected) {
    _shakeSubscription = _eventChannel.receiveBroadcastStream().listen(
      (event) {
        // Shake detected! Call the callback
        onShakeDetected();
      },
      onError: (error) {
        print('Error listening to shake events: $error');
      },
    );
  }

  /// Stop listening for shake events
  void stopShakeListener() {
    _shakeSubscription?.cancel();
    _shakeSubscription = null;
  }

  /// Clean up resources
  void dispose() {
    stopShakeListener();
  }
}
