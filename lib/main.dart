import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/router/app_router.dart';

import 'src/locator.dart';
import 'src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      //MultiBlocProvider(
      // providers: [
      //   BlocProvider(
      //     create: (context) => LocalArticlesCubit(
      //       locator<DatabaseRepository>(),
      //     )..getAllSavedArticles(),
      //   ),
      //   BlocProvider(
      //     create: (context) => RemoteArticlesCubit(
      //       locator<ApiRepository>(),
      //     )..getBreakingNewsArticles(),
      //   )
      // ],
      OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
         // routerDelegate: appRouter.delegate(),
         // routeInformationParser: appRouter.defaultRouteParser(),
          // title: appTitle,
          // theme: AppTheme.light,
        ),
      );
    // );
  }
}
