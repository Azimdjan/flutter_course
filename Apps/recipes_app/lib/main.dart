import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'data/moor/moor_repository.dart';
import 'data/repository.dart';
import 'network/recipe_service.dart';
import 'network/service_interface.dart';

import 'ui/main_screen.dart';

Future<void> main() async {
  _setLogging();
  WidgetsFlutterBinding.ensureInitialized();
  final repository = MoorRepository();
  await repository.init();
  runApp(MyApp(
    repository: repository,
  ));
}

void _setLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name} : ${event.time} : ${event.message} ');
  });
}

class MyApp extends StatelessWidget {
  final Repository repository;

  const MyApp({Key key, this.repository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          lazy: false,
          dispose: (_, Repository repository) => repository.close(),
          create: (ctx) => repository,
        ),
        Provider<ServiceInterface>(
          create: (_) => RecipeService.create(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RefreshConfiguration(
          child: const MainScreen(),
        ),
      ),
    );
  }
}
