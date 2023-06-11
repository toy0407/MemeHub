// ignore_for_file: invalid_use_of_visible_for_testing_member

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
    // on<MemeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  Future<void> appStarted() async {
    emit(MemeFetchLoading());
  }

  Future<List<Meme>> fetchMemes() async {
    List<Meme> memeList = [];
    emit(MemeFetchLoading());
    try {
      var result = await fetchMemesUseCase.fetchMemes();
      result.fold((failure) => MemeFetchFailure(), (success) {
        emit(MemeFetchSuccess());
        memeList = success;
      });
    } catch (err) {
      emit(MemeFetchFailure());
    }

    return memeList;
  }

  Future<List<Meme>> appendMemes(List<Meme> existingList) async {
    try {
      var result = await appendMemesUseCase.appendMemes(existingList);
      result.fold((failure) => MemeFetchFailure(), (success) {
        emit(MemeAppendSuccess());
        existingList = success;
      });
    } catch (err) {
      emit(MemeAppendFailure());
    }

    return existingList;
  }

  Future<bool> saveMeme(Meme meme) async {
    bool saveResult = false;
    try {
      var result = await saveMemeUseCase.saveMeme(meme);
      result.fold((failure) => emit(MemeSaveFailure()), (success) {
        saveResult = success;
        emit(MemeSaveSuccess());
      });
    } catch (err) {
      emit(MemeSaveFailure());
    }

    return saveResult;
  }

  Future<void> shareMeme(Meme meme) async {
    try {
      var result = await shareMemeUseCase.shareMeme(meme);
      result.fold((failure) => emit(MemeShareFailure()),
          (success) => emit(MemeShareSuccess()));
    } catch (err) {
      emit(MemeShareFailure());
    }
  }
}
