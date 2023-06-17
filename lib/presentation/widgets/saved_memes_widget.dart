import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SavedMemesWidget extends StatefulWidget {
  const SavedMemesWidget({super.key});

  @override
  State<SavedMemesWidget> createState() => _SavedMemesWidgetState();
}

class _SavedMemesWidgetState extends State<SavedMemesWidget> {
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    loadImagesFromPath();
  }

  Future<void> loadImagesFromPath() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    final files = await directory.list().toList();

    for (var file in files) {
      if (file is File &&
          (file.path.endsWith('.png') ||
              file.path.endsWith('.jpg') ||
              file.path.endsWith('.gif'))) {
        images.add(file);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Saved Memes',
          style: TextStyle(
              fontSize: 24, color: Colors.amber, fontWeight: FontWeight.w300),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              child: Image.file(
                images[index],
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ]),
    );
  }
}
