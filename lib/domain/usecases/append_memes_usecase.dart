import 'package:dartz/dartz.dart';
import 'package:memehub/core/error/failures.dart';

import '../../domain/repositories/meme_repository.dart';
import '../entities/meme.dart';

class AppendMemesUseCase {
  final MemeRepository memeRepository;

  AppendMemesUseCase({required this.memeRepository});

  Future<Either<Failure, List<Meme>>> appendMemes(
      List<Meme> existingList) async {
    return memeRepository.appendMemes(existingList);
  }
}
