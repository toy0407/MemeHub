import 'package:get_it/get_it.dart';
import 'package:memehub/data/datasources/meme_remote_datasource.dart';
import 'package:memehub/data/datasources/meme_remote_datasource_impl.dart';
import 'package:memehub/data/repositories/meme_repository_impl.dart';
import 'package:memehub/domain/repositories/meme_repository.dart';
import 'package:memehub/domain/usecases/append_memes_usecase.dart';
import 'package:memehub/domain/usecases/fetch_memes_usecase.dart';
import 'package:memehub/domain/usecases/save_meme_usecase.dart';
import 'package:memehub/domain/usecases/share_meme_usecase.dart';
import 'package:memehub/presentation/bloc/meme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory<MemeBloc>(() => MemeBloc(
      saveMemeUseCase: sl.call(),
      shareMemeUseCase: sl.call(),
      fetchMemesUseCase: sl.call(),
      appendMemesUseCase: sl.call()));

  //Usecases
  sl.registerLazySingleton<FetchMemesUseCase>(
      () => FetchMemesUseCase(memeRepository: sl.call()));
  sl.registerLazySingleton<AppendMemesUseCase>(
      () => AppendMemesUseCase(memeRepository: sl.call()));
  sl.registerLazySingleton<SaveMemeUseCase>(
      () => SaveMemeUseCase(memeRepository: sl.call()));
  sl.registerLazySingleton<ShareMemeUseCase>(
      () => ShareMemeUseCase(memeRepository: sl.call()));

  //Repository
  sl.registerLazySingleton<MemeRepository>(
      () => MemeRepositoryImpl(memeRemoteDataSource: sl.call()));

  //Data Source
  sl.registerLazySingleton<MemeRemoteDataSource>(
      () => MemeRemoteDataSourceImpl());
}
