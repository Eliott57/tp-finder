import 'package:flutter/material.dart';

import 'bachelors_master.dart';

class BachelorsApp extends StatelessWidget{
  BachelorsApp() : super(key: GlobalKey());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple
      ),
      home: BachelorsMaster(),
    );
  }
}