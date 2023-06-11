import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/entities/meme.dart';
import '../bloc/meme_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentMeme = 0;
  late List<Meme> memeList;
  int sizeOfMemeList = 0;

  @override
  void initState() {
    super.initState();
    getMemes();
  }

  getMemes() async {
    memeList = await BlocProvider.of<MemeBloc>(context).fetchMemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('MemeHub'),
          titleTextStyle: const TextStyle(fontSize: 32, color: Colors.amber),
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
        body: BlocListener<MemeBloc, MemeState>(
            listener: (context, state) {
              if (state is MemeSaveSuccess) {
                Fluttertoast.showToast(msg: 'Meme saved');
              } else {}
            },
            child: _body()));
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: BlocBuilder<MemeBloc, MemeState>(builder: (context, state) {
            if (state is MemeFetchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MemeFetchSuccess) {
              return Image.network(
                memeList[currentMeme].url!,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Failed to load'));
            }
          }),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (Platform.isAndroid) ? androidNavbar() : iosNavbar(),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> iosNavbar() {
    return [
      IconButton(
        onPressed: () {
          if (currentMeme > 0) {
            setState(() {
              currentMeme--;
            });
          }
        },
        icon: const Icon(Icons.keyboard_double_arrow_left_outlined),
        color: Colors.amber,
        iconSize: 36,
      ),
      BlocBuilder<MemeBloc, MemeState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<MemeBloc>(context)
                  .shareMeme(memeList[currentMeme]);
            },
            icon: const Icon(CupertinoIcons.share),
            color: Colors.amber,
          );
        },
      ),
      BlocBuilder<MemeBloc, MemeState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              if (currentMeme != sizeOfMemeList - 1) {
                if (currentMeme > sizeOfMemeList - 2 - 1) {
                  BlocProvider.of<MemeBloc>(context).appendMemes(memeList);
                }
                setState(() {
                  currentMeme++;
                });
              }
            },
            icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
            color: Colors.amber,
            iconSize: 36,
          );
        },
      ),
    ];
  }

  List<Widget> androidNavbar() {
    return [
      IconButton(
        onPressed: () {
          if (currentMeme > 0) {
            setState(() {
              currentMeme--;
            });
          }
        },
        icon: const Icon(Icons.keyboard_double_arrow_left_outlined),
        color: Colors.amber,
        iconSize: 36,
      ),
      BlocBuilder<MemeBloc, MemeState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<MemeBloc>(context)
                  .saveMeme(memeList[currentMeme]);
            },
            icon: const Icon(Icons.save_alt),
            color: Colors.amber,
          );
        },
      ),
      IconButton(
        onPressed: () {
          BlocProvider.of<MemeBloc>(context).shareMeme(memeList[currentMeme]);
        },
        icon: const Icon(Icons.share),
        color: Colors.amber,
      ),
      BlocBuilder<MemeBloc, MemeState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              if (currentMeme != sizeOfMemeList - 1) {
                if (currentMeme > sizeOfMemeList - 2 - 1) {
                  BlocProvider.of<MemeBloc>(context).appendMemes(memeList);
                }
                setState(() {
                  currentMeme++;
                });
              }
            },
            icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
            color: Colors.amber,
            iconSize: 36,
          );
        },
      ),
    ];
  }
}
