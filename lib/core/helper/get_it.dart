import 'package:bookly/core/util/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(HomeRemoteDataSourceImpl(getIt.get<ApiService>())),
  );
}
