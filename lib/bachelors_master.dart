import 'package:flutter/material.dart';

import 'bachelor_details.dart';
import 'bachelor_details.dart';
import 'database/seeders/bachelor_seeder.dart';
import 'models/bachelor.dart';

class BachelorsMaster extends StatefulWidget{
  BachelorsMaster() : super(key: GlobalKey());

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  final List<Bachelor> _bachelors = BachelorSeeder();

  @override
  Widget build(BuildContext context) {
    Widget BachelorPreview({required Bachelor bachelor}) {
      return Card(
        shape: const RoundedRectangleBorder(),
        margin: EdgeInsets.zero,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage(
                            bachelor.avatar
                        ),
                        height: 50,
                        fit:BoxFit.fill
                    ),
                    Text(
                      '${bachelor.firstname} ${bachelor.lastname}',
                    ),
                  ]
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BachelorDetails(bachelor),
                    ),
                  );
                },
                child: const Text('Details'),
              )
            ]
          )
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your bachelor'),
        backgroundColor: Colors.purple,
      ),
      body:
      ListView.builder(
        itemBuilder: (context, index) {
          return BachelorPreview(bachelor: _bachelors[index]);
        },
        itemCount: _bachelors.length,
      )
    );
  }
}