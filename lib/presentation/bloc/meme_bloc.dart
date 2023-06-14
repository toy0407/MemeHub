import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memehub/domain/usecases/append_memes_usecase.dart';
import 'package:memehub/domain/usecases/fetch_memes_usecase.dart';
import 'package:memehub/domain/usecases/save_meme_usecase.dart';
import 'package:memehub/domain/usecases/share_meme_usecase.dart';
import '../../domain/entities/meme.dart';

part 'meme_event.dart';
part 'meme_state.dart';

class MemeBloc extends Bloc<MemeEvent, MemeState> {
  final SaveMemeUseCase saveMemeUseCase;
  final ShareMemeUseCase shareMemeUseCase;
  final FetchMemesUseCase fetchMemesUseCase;
  final AppendMemesUseCase appendMemesUseCase;

  MemeBloc(
      {required this.saveMemeUseCase,
      required this.shareMemeUseCase,
      required this.fetchMemesUseCase,
      required this.appendMemesUseCase})
      : super(MemeInitial()) {
    on<SaveMemeEvent>(saveMeme);
    on<ShareMemeEvent>(shareMeme);
    on<FetchMemesEvent>(fetchMemes);
    on<AppendMemesEvent>(appendMemes);
  }

  FutureOr<void> saveMeme(SaveMemeEvent event, Emitter<MemeState> emit) async {
    try {
      var result = await saveMemeUseCase.saveMeme(event.meme);
      result.fold((failure) => emit(MemeSaveFailure()), (success) {
        emit(MemeSaveSuccess());
      });
    } catch (err) {
      emit(MemeSaveFailure());
    }
  }

  FutureOr<void> shareMeme(
      ShareMemeEvent event, Emitter<MemeState> emit) async {
    try {
      var result = await shareMemeUseCase.shareMeme(event.meme);
      result.fold((failure) => emit(MemeShareFailure()),
          (success) => emit(MemeShareSuccess()));
    } catch (err) {
      emit(MemeShareFailure());
    }
  }

  FutureOr<void> fetchMemes(
      FetchMemesEvent event, Emitter<MemeState> emit) async {
    emit(MemeFetchLoading());
    try {
      var result = await fetchMemesUseCase.fetchMemes();
      result.fold((failure) => emit(MemeFetchFailure()), (success) {
        emit(MemeFetchSuccess(memeList: success));
      });
    } catch (err) {
      emit(MemeFetchFailure());
    }
  }

  FutureOr<void> appendMemes(
      AppendMemesEvent event, Emitter<MemeState> emit) async {
    try {
      var result = await appendMemesUseCase.appendMemes(event.memeList);
      result.fold((failure) => emit(MemeAppendFailure()), (success) {
        emit(MemeAppendSuccess(memeList: success));
      });
    } catch (err) {
      emit(MemeAppendFailure());
    }
  }
}
