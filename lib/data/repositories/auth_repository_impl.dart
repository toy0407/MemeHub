import 'package:dartz/dartz.dart';
import 'package:memehub/core/error/failures.dart';
import 'package:memehub/domain/entities/user.dart';
import 'package:memehub/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signIn(User user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUp(User user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
