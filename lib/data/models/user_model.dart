import 'meme_model.dart';
import '../../domain/entities/user.dart';
import 'dart:convert';

class UserModel extends User {
  UserModel(
      {required super.userId,
      super.name,
      super.email,
      super.phoneNo,
      super.createdMemesList,
      super.favoriteMemesList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'createdMemesList': createdMemesList,
      'favoriteMemesList': favoriteMemesList,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['userId'] != null ? json['userId'] as String : null,
        name: json['name'] != null ? json['name'] as String : null,
        email: json['email'] != null ? json['email'] as String : null,
        phoneNo: json['phoneNo'] != null ? json['phoneNo'] as String : null,
        createdMemesList: json['createdMemesList'] != null
            ? json['createdMemesList'] as List<MemeModel>
            : null,
        favoriteMemesList: json['favoriteMemesList'] != null
            ? json['favoriteMemesList'] as List<MemeModel>
            : null);
  }

  String toJson() => json.encode(toMap());
}
