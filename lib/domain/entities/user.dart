import 'meme.dart';

class User {
  String? userId, name, email, phoneNo;
  List<Meme>? createdMemesList, favoriteMemesList;

  User(
      {required this.userId,
      this.name,
      this.email,
      this.phoneNo,
      this.createdMemesList,
      this.favoriteMemesList});
}
