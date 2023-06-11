import 'package:dartz/dartz.dart';

import 'package:memehub/core/error/failures.dart';

import '../../domain/entities/meme.dart';
import '../../domain/repositories/meme_repository.dart';
import '../datasources/meme_remote_datasource.dart';

class MemeRepositoryImpl implements MemeRepository {
  MemeRemoteDataSource memeRemoteDataSource;

  MemeRepositoryImpl({
    required this.memeRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> saveMeme(Meme meme) async {
    try {
      return Right(await memeRemoteDataSource.saveMeme(meme));
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> shareMeme(Meme meme) async {
    try {
      return Right(await memeRemoteDataSource.shareMeme(meme));
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Meme>>> appendMemes(
      List<Meme> existingList) async {
    try {
      return Right(await memeRemoteDataSource.appendMemes(existingList));
    } catch (err) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Meme>>> fetchMemes() async {
    try {
      return Right(await memeRemoteDataSource.fetchMemes());
    } catch (err) {
      return Left(Failure());
    }
  }
}
