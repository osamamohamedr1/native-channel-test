import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_native_channel/consts.dart';
import 'package:test_native_channel/native_communication.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NativeCommunication _nativeCommunication = NativeCommunication();
  String _quote = "Shake your phone to get motivated! 💪";
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _nativeCommunication.startShakeListener(_onShakeDetected);
  }

  void _onShakeDetected() {
    setState(() {
      _quote = quotes[_random.nextInt(quotes.length)];
    });
  }

  @override
  void dispose() {
    _nativeCommunication.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Shake to Get Quote'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.format_quote,
                size: 60,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 40),
              Text(
                _quote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Shake your phone!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
