import 'package:flutter/material.dart';

import 'bachelor_list.dart';

class BachelorApp extends StatelessWidget{
  BachelorApp() : super(key: GlobalKey());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple
      ),
      home: BachelorList(),
    );
  }
}