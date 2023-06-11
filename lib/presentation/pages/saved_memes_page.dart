import 'package:flutter/material.dart';

class SavedMemesPage extends StatefulWidget {
  const SavedMemesPage({super.key});

  @override
  State<SavedMemesPage> createState() => _SavedMemesPageState();
}

class _SavedMemesPageState extends State<SavedMemesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved'),
          titleTextStyle: const TextStyle(color: Colors.red),
          // backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Colors.amber,
                child: Column(),
              ),
            );
          },
        ));
  }
}
