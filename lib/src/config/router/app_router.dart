import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/presentation/views/saved_articles_view.dart';

import '../../domain/models/article.dart';
import '../../presentation/views/article_details_view.dart';
import '../../presentation/views/breaking_news_view.dart';

final GoRouter router = GoRouter(
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

        GoRoute(
            path: 'ArticleDetailsView',
            builder:(BuildContext context, GoRouterState state) => ArticleDetailsView(article: state.extra as Article)

        ),
      ],
    ),
  ],
);

