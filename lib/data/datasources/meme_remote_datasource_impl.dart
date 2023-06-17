import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/app_strings.dart';
import '../../data/datasources/meme_remote_datasource.dart';

import '../../domain/entities/meme.dart';
import '../models/meme_model.dart';

class MemeRemoteDataSourceImpl implements MemeRemoteDataSource {
  @override
  Future<bool> saveMeme(Meme meme) async {
    try {
      final response = await http.get(Uri.parse(meme.url!));
      Directory? imageDir = await getApplicationDocumentsDirectory();
      final imageName = path.basename(meme.url!);
      File image = File(path.join(imageDir.path, imageName));
      await image.writeAsBytes(response.bodyBytes);
      return true;
    } catch (err) {
      throw Exception();
    }
  }

  @override
  Future<void> shareMeme(Meme meme) async {
    try {
      final url = Uri.parse(meme.url!);
      final response = await http.get(url);
      final Directory tempDir = await getTemporaryDirectory();
      final imageName = path.basename(meme.url!);
      File image = File(path.join(tempDir.path, imageName));
      await image.writeAsBytes(response.bodyBytes);
      await Share.shareFiles([path.join(tempDir.path, imageName)]);
    } catch (err) {
      throw Exception();
    }
  }

  @override
  Future<List<Meme>> appendMemes(List<Meme> existingList) async {
    try {
      final response = await http.get(Uri.parse('${AppStrings.apiUrl}/5'));

      if (response.statusCode == 200) {
        final newMemes = parseMemes(response.body);
        existingList.addAll(newMemes);
        return existingList;
      }
      throw Exception('Failed to load more memes');
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<List<Meme>> fetchMemes() async {
    try {
      final response = await http.get(Uri.parse('${AppStrings.apiUrl}/5'));
      if (response.statusCode == 200) {
        return compute(parseMemes, response.body);
      }
      throw Exception('Failed to load meme');
    } catch (err) {
      throw Exception(err);
    }
  }

  static List<Meme> parseMemes(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['memes'].cast<Map<String, dynamic>>();
    return parsed.map<Meme>((json) => MemeModel.fromJson(json)).toList();
  }
}
