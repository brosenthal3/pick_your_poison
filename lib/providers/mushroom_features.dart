import 'package:flutter/material.dart';

class MushroomFeaturesProvider with ChangeNotifier {
  late Map<String, dynamic> _mushroomFeatures;

  Map<String, dynamic> get mushroomFeatures => _mushroomFeatures;

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

  MushroomFeaturesProvider() {
    resetMushroom();
  }
}