import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Column(children: [
        Text(
          'Name',
          style: TextStyle(color: Colors.amber),
        ),
        Text(
          'Email',
          style: TextStyle(color: Colors.amber),
        ),
      ]),
    );
  }
}
