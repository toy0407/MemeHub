import 'package:dartz/dartz.dart';
import 'package:memehub/core/error/failures.dart';

import '../../domain/repositories/meme_repository.dart';
import '../entities/meme.dart';

class ShareMemeUseCase {
  final MemeRepository memeRepository;

  ShareMemeUseCase({required this.memeRepository});

  Future<Either<Failure, void>> shareMeme(Meme meme) async {
    return memeRepository.shareMeme(meme);
  }
}
