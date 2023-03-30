import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/presentation/views/saved_articles_view.dart';

import '../../presentation/views/breaking_news_view.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context,state) {
        return const BreakingNewsView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/SavedArticlesView',
          builder: (BuildContext context, GoRouterState state) {
            return const SavedArticlesView();
          },
        ),
      ],
    ),
  ],
);

