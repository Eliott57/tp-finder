import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bachelors_favorites.dart';
import 'bachelors_master.dart';

class BachelorsApp extends StatelessWidget{
  BachelorsApp() : super(key: GlobalKey());

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BachelorsMaster(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => BachelorsFavorites(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
      [
        ChangeNotifierProvider(create:  (context) => BachelorsFavoritesProvider())
      ],
      child:  MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.purple
        ),
        home: BachelorsMaster(),
      )
    );
  }
}