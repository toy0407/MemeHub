import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/meme.dart';

abstract class MemeRepository {
  // Future<Either<Failure, User>> signIn(User user);
  // Future<Either<Failure, User>> signUp(User user);
  // Future<Either<Failure, void>> signOut();
  // Future<Either<Failure, bool>> isSignedIn();
  // Future<Either<Failure, void>> forgotPassword(String email);
  // Future<Either<Failure, void>> updateUser(User user);
  // Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, bool>> saveMeme(Meme meme);
  Future<Either<Failure, void>> shareMeme(Meme meme);
  Future<Either<Failure, List<Meme>>> fetchMemes();
  Future<Either<Failure, List<Meme>>> appendMemes(List<Meme> existingList);
}
