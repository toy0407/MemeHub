import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/meme.dart';
import '../bloc/meme_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.memeBloc});
  final MemeBloc memeBloc;

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
    widget.memeBloc.add(FetchMemesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MemeHub'),
        titleTextStyle: const TextStyle(
            fontSize: 32, color: Colors.amber, fontWeight: FontWeight.w200),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.amber),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () => context.push('/profile'),
          )
        ],
      ),
      body: _body(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: BlocConsumer<MemeBloc, MemeState>(
              bloc: widget.memeBloc,
              listener: (context, state) {
                if (state is MemeSaveSuccess) {
                  Fluttertoast.showToast(msg: 'Meme saved');
                }
              },
              buildWhen: (previous, current) => current is! MemeActionState,
              builder: (context, state) {
                if (state is MemeFetchSuccess) {
                  memeList = state.memeList;
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
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Text('Failed to load image')),
                  );
                } else if (state is MemeFetchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MemeFetchFailure) {
                  return const Center(
                      child: Text(
                    'Failed to load memes',
                    style: TextStyle(color: Colors.amber),
                  ));
                } else {
                  return const Center(
                      child: Text(
                    'Some error',
                    style: TextStyle(color: Colors.amber),
                  ));
                }
              }),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<MemeBloc, MemeState>(
              bloc: widget.memeBloc,
              builder: (context, state) {
                if (state is! MemeFetchFailure) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: navbar());
                } else {
                  return TextButton(
                      onPressed: () => widget.memeBloc.add(FetchMemesEvent()),
                      child: const Text('Try Again'));
                }
              },
            ),
          ),
        )
      ],
    );
  }

  List<Widget> navbar() {
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
      IconButton(
        onPressed: () {
          widget.memeBloc.add(SaveMemeEvent(meme: memeList[currentMeme]));
        },
        icon: const Icon(Icons.save_alt),
        color: Colors.amber,
      ),
      IconButton(
        onPressed: () {
          //TODO:Implement create new meme
        },
        icon: const Icon(
          Icons.add_box_outlined,
          size: 28,
        ),
        color: Colors.amber,
      ),
      IconButton(
        onPressed: () {
          widget.memeBloc.add(ShareMemeEvent(meme: memeList[currentMeme]));
        },
        icon: const Icon(Icons.share),
        color: Colors.amber,
      ),
      IconButton(
        onPressed: () {
          if (currentMeme != sizeOfMemeList - 1) {
            if (currentMeme > sizeOfMemeList - 2 - 1) {
              widget.memeBloc.add(AppendMemesEvent(memeList: memeList));
            }
            setState(() {
              currentMeme++;
            });
          }
        },
        icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
        color: Colors.amber,
        iconSize: 36,
      ),
    ];
  }
}
