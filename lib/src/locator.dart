import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:news_app/src/data/data_Sources/remote/news_api_service.dart';
import 'package:news_app/src/data/repositories/api_repository_impl.dart';
import 'package:news_app/src/data/repositories/database_repository_impl.dart';
import 'package:news_app/src/utils/constants/strings.dart';

import 'data/data_Sources/local/app_database.dart';
import 'domain/repository/api_repository.dart';
import 'domain/repository/database_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );

 locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<NewsApiService>()),
  );

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );
}