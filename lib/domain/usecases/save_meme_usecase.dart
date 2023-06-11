import 'package:dartz/dartz.dart';
import 'package:memehub/core/error/failures.dart';

import '../../domain/repositories/meme_repository.dart';
import '../entities/meme.dart';

class SaveMemeUseCase {
  final MemeRepository memeRepository;

  SaveMemeUseCase({required this.memeRepository});

  Future<Either<Failure, bool>> saveMeme(Meme meme) async {
    return memeRepository.saveMeme(meme);
  }
}
