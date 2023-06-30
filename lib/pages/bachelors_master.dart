import 'package:finder/components/bachelors_filters.dart';
import 'package:finder/pages/bachelors_favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bachelor_preview.dart';
import '../database/seeders/bachelor_seeder.dart';
import '../models/bachelor.dart';
import '../providers/bachelors_provider.dart';

class BachelorsMaster extends StatefulWidget{
  BachelorsMaster() : super(key: GlobalKey());

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    final providerBachelors = Provider.of<BachelorsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your bachelor'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BachelorsFavorites(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              const BachelorsFilters(),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BachelorPreview(providerBachelors.filteredBachelors()[index]);
                },
                itemCount: providerBachelors.filteredBachelors().length,
              )
            ],
          )
      )
    );
  }
}