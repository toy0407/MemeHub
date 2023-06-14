part of 'meme_bloc.dart';

abstract class MemeState extends Equatable {
  const MemeState();

  @override
  List<Object> get props => [];
}

abstract class MemeActionState extends MemeState {
  const MemeActionState();
}

class MemeInitial extends MemeState {}

class MemeFetchLoading extends MemeState {}

class MemeFetchSuccess extends MemeState {
  final List<Meme> memeList;
  const MemeFetchSuccess({required this.memeList});
}

class MemeFetchFailure extends MemeState {}

class MemeAppendSuccess extends MemeActionState {
  final List<Meme> memeList;
  const MemeAppendSuccess({required this.memeList});
}

class MemeAppendFailure extends MemeActionState {}

class MemeSaveSuccess extends MemeActionState {}

class MemeSaveFailure extends MemeActionState {}

class MemeShareSuccess extends MemeActionState {}

class MemeShareFailure extends MemeActionState {}
