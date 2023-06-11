import 'package:dartz/dartz.dart';
import 'package:memehub/core/error/failures.dart';

import '../../domain/repositories/meme_repository.dart';
import '../entities/meme.dart';

class FetchMemesUseCase {
  final MemeRepository memeRepository;

  FetchMemesUseCase({required this.memeRepository});

  Future<Either<Failure, List<Meme>>> fetchMemes() async {
    return memeRepository.fetchMemes();
  }
}
