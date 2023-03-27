import 'package:go_router/go_router.dart';

import '../../../main.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) =>  MyApp(),
    ),
    // GoRoute(
    //   path: "/settings",
    //   builder: (context, state) => const SettingsPage(),
    // )
  ],
);
