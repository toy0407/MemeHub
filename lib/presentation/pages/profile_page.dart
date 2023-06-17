import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/saved_memes_widget.dart';
import '../widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
            fontSize: 32, color: Colors.amber, fontWeight: FontWeight.w200),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.amber),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () => context.push('/settings'),
          )
        ],
      ),
      body: ListView(
        children: const [ProfileWidget(), SavedMemesWidget()],
      ),
    );
  }
}
