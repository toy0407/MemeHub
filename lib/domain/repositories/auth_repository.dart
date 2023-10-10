import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(User user);
  Future<Either<Failure, User>> signUp(User user);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> isSignedIn();
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> updateUser(User user);
  Future<Either<Failure, User>> getCurrentUser();
}
