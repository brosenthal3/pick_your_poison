import 'package:flutter/material.dart';

class MushroomFeaturesProvider with ChangeNotifier {
  final Map<String, dynamic> _mushroomFeatures = {
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

  Map<String, dynamic> get mushroomFeatures => _mushroomFeatures;

  void updateFeature(String category, String feature, dynamic value) {
    _mushroomFeatures[category][feature] = value;
    notifyListeners();
  }
}