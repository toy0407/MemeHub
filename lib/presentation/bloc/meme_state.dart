part of 'meme_bloc.dart';

abstract class MemeState extends Equatable {
  const MemeState();

  @override
  List<Object> get props => [];
}

class MemeInitial extends MemeState {}

class MemeFetchLoading extends MemeState {}

class MemeFetchSuccess extends MemeState {}

class MemeFetchFailure extends MemeState {}

class MemeAppendSuccess extends MemeState {}

class MemeAppendFailure extends MemeState {}

class MemeSaveSuccess extends MemeState {}

class MemeSaveFailure extends MemeState {}

class MemeShareSuccess extends MemeState {}

class MemeShareFailure extends MemeState {}
