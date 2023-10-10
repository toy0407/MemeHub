import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewerPage extends StatefulWidget {
  final File image;
  const ImageViewerPage({super.key, required this.image});

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.file(widget.image)],
      ),
    );
  }
}
