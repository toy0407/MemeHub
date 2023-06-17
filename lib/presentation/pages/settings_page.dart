import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Settings'),
        titleTextStyle: const TextStyle(
            fontSize: 32, color: Colors.amber, fontWeight: FontWeight.w200),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
    );
  }
}
