import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/config/themes/app_themes.dart';
import 'package:news_app/src/presentation/cubits/local_articles/cubit/local_articles_cubit.dart';
import 'package:news_app/src/presentation/cubits/remote_articles/cubit/remote_articles_cubit.dart';
import 'package:news_app/src/presentation/views/breaking_news_view.dart';
import 'package:news_app/src/presentation/views/saved_articles_view.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/router/app_router.dart';

import 'src/domain/repository/api_repository.dart';
import 'src/domain/repository/database_repository.dart';
import 'src/locator.dart';
import 'src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(MyApp());
}


final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BreakingNewsView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'SavedArticlesView',
          builder: (BuildContext context, GoRouterState state) {
            return const SavedArticlesView();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedArticles(),
        ),
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles(),
        )
      ],
    child:  OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
            // routeInformationProvider: _router.routeInformationProvider,
            // routeInformationParser: _router.routeInformationParser,
            // routerDelegate: _router.routerDelegate,
          title: appTitle,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
