import 'package:flutter/material.dart';

import '../models/bachelor.dart';

class BachelorsFavoritesProvider extends ChangeNotifier {
  List<Bachelor> _bachelorsLiked = [];

  List<Bachelor> get bachelorsLiked => _bachelorsLiked;

  set bachelorsLiked (List<Bachelor> bachelorsLiked) {
    _bachelorsLiked = bachelorsLiked;
    notifyListeners();
  }

  void add (Bachelor bachelor) {
    _bachelorsLiked.add(bachelor);
    notifyListeners();
  }

  void remove (Bachelor bachelor) {
    _bachelorsLiked.remove(bachelor);
    notifyListeners();
  }

  bool isLiked(Bachelor bachelor){
    return _bachelorsLiked.contains(bachelor);
  }
}