import 'package:flutter/material.dart';

import 'database/seeders/bachelor_seeder.dart';
import 'models/bachelor.dart';

class BachelorList extends StatefulWidget{
  BachelorList() : super(key: GlobalKey());

  @override
  State<BachelorList> createState() => _BachelorListState();
}

class _BachelorListState extends State<BachelorList> {
  final List<Bachelor> _bachelors = BachelorSeeder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bachelor App'),
        backgroundColor: Colors.purple,
      ),
      body: _bachelors.isNotEmpty ?
        ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(),
            margin: EdgeInsets.zero,
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child:  Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage(
                            _bachelors[index].avatar
                        ),
                        height: 50,
                        fit:BoxFit.fill
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${_bachelors[index].firstname} ${_bachelors[index].lastname}',
                            ),
                            Text(
                              _bachelors[index].job ?? 'No job found',
                            ),
                          ]
                      )
                    )
                  ]
              ),
            ),
          );
        },
        itemCount: _bachelors.length,
      ) :
          const Center(
            child: Text('Click right bottom button to see bachelors')
          ),
    );
  }
}