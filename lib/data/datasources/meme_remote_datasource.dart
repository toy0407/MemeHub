import '../../domain/entities/meme.dart';

abstract class MemeRemoteDataSource {
  Future<bool> saveMeme(Meme meme);
  Future<void> shareMeme(Meme meme);
  Future<List<Meme>> fetchMemes();
  Future<List<Meme>> appendMemes(List<Meme> existingList);
}
