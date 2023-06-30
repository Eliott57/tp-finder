import 'package:flutter/material.dart';

import '../database/seeders/bachelor_seeder.dart';
import '../models/bachelor.dart';

class BachelorsProvider extends ChangeNotifier {
  final List<Bachelor> _bachelors = BachelorSeeder();
  List<Gender> _gendersFilter = [Gender.woman, Gender.man];
  String _firstnameFilter = '';

  List<Bachelor> get bachelors => _bachelors;
  List<Gender> get gendersFilter => _gendersFilter;
  String get firstnameFilter => _firstnameFilter;

  List<Bachelor> filteredBachelors(){
    List<Bachelor> filteredBachelors = _bachelors;

    filteredBachelors = filteredBachelors.where((bachelor) => _gendersFilter.contains(bachelor.gender)).toList();

    if(firstnameFilter.trim() != ''){
      filteredBachelors = filteredBachelors.where((bachelor) => bachelor.firstname.toLowerCase().contains(firstnameFilter)).toList();
    }

    return filteredBachelors;
  }

  void remove (Bachelor bachelor) {
    _bachelors.remove(bachelor);
    notifyListeners();
  }

  void toggleGenderFilter ({required Gender gender}) {
    if(_gendersFilter.contains(gender)){
      _gendersFilter.remove(gender);
      notifyListeners();
      return;
    }

    _gendersFilter.add(gender);
    notifyListeners();
  }

  void setFirstnameFilter(String firstname){
    _firstnameFilter = firstname;
    notifyListeners();
  }

  void resetFilters(){
    _gendersFilter = [Gender.woman, Gender.man];
    _firstnameFilter = '';
    notifyListeners();
  }
}