import 'package:flutter/material.dart';

class MushroomFeaturesProvider with ChangeNotifier {
  late Map<String, dynamic> _mushroomFeatures;
  late Map<String, bool> _visitedPages;

  Map<String, dynamic> get mushroomFeatures => _mushroomFeatures;
  Map<String, bool> get visitedPages => _visitedPages;

  void updateFeature(String category, String feature, dynamic value) {
    _mushroomFeatures[category][feature] = value;
    notifyListeners();
  }

  void resetMushroom() {
    _mushroomFeatures =  {
      "cap": {
        "shape": "b",
        "diameter": 10,
        "surface": "s",
        "color": "w",
      },
      "gills": {
        "spacing": "f",
        "color": "w",
      },
      "stem": {
        "surface": "g",
        "color": "w",
        "roots": "s",
      },
      "other": {
        "ring": "c"
      }
    };
    _visitedPages = {
      "cap": false,
      "gills": false,
      "stem": false,
      "other": false,
    };

    notifyListeners();
  }

  // placeholder function until the model is working
  double getPrediction() {
    if (_mushroomFeatures["cap"]["shape"] != 'b'){
      return 1;
    }
    else {
      return 0;
    }
  }

  void updateVisitedPage(String page) {
    _visitedPages[page] = true;
  }

  bool isPageVisited(String page) {
    return _visitedPages[page] ?? false;
  }

  MushroomFeaturesProvider() {
    resetMushroom();
  }
}