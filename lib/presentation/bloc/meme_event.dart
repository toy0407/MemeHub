part of 'meme_bloc.dart';

abstract class MemeEvent extends Equatable {
  const MemeEvent();

  @override
  List<Object> get props => [];
}

class SaveMemeEvent extends MemeEvent {
  final Meme meme;
  const SaveMemeEvent({required this.meme});
}

class ShareMemeEvent extends MemeEvent {
  final Meme meme;
  const ShareMemeEvent({required this.meme});
}

class FetchMemesEvent extends MemeEvent {}

class AppendMemesEvent extends MemeEvent {
  final List<Meme> memeList;
  const AppendMemesEvent({required this.memeList});
}
