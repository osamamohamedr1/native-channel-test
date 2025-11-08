import 'package:flutter/material.dart';
import 'package:test_native_channel/home_view.dart';

void main() {
  runApp(const TestNativeChannel());
}

class TestNativeChannel extends StatelessWidget {
  const TestNativeChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Native Channel',
      theme: ThemeData(primarySwatch: Colors.blue),
      showSemanticsDebugger: false,
      home: const HomeView(),
    );
  }
}
