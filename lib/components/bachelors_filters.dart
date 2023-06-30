import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/bachelor_details.dart';
import '../models/bachelor.dart';
import '../providers/bachelors_favorites_provider.dart';
import '../providers/bachelors_provider.dart';

class BachelorsFilters extends StatefulWidget{
  const BachelorsFilters({super.key});

  @override
  State<BachelorsFilters> createState() => _BachelorsFiltersState();
}

class _BachelorsFiltersState extends State<BachelorsFilters>{
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    final providerBachelors = Provider.of<BachelorsProvider>(context, listen: false);

    super.initState();
    _nameController = TextEditingController(text: providerBachelors.firstnameFilter);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerBachelors = Provider.of<BachelorsProvider>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        providerBachelors.toggleGenderFilter(gender: Gender.woman);
                      },
                      child: Icon(
                        Icons.woman,
                        color: providerBachelors.gendersFilter.contains(Gender.woman) ?
                          Colors.blue :
                          Colors.black,
                        size: 30,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        providerBachelors.toggleGenderFilter(gender: Gender.man);
                      },
                      child: Icon(
                        Icons.man,
                        color: providerBachelors.gendersFilter.contains(Gender.man) ?
                          Colors.blue :
                          Colors.black,
                        size: 30,
                      ),
                    ),
                  ]
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'First name of bachelor',
                  ),
                  onChanged: providerBachelors.setFirstnameFilter,
                ),
              ),
              TextButton(
                onPressed: () {
                  providerBachelors.resetFilters();
                  _nameController.clear();
                },
                child: const Text(
                    'Reset filters',
                    style: TextStyle(
                      decoration: TextDecoration.underline
                    )
                )
              ),
            ]
        )
    );
  }
}