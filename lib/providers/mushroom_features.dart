import 'package:flutter/material.dart';
import 'package:pick_your_poison/api_service.dart';

class MushroomFeaturesProvider with ChangeNotifier {
  late Map<String, dynamic> _mushroomFeatures;
  late Map<String, bool> _visitedPages;
  final apiService = ApiService('https://pypapi-production.up.railway.app');

  Map<String, dynamic> get mushroomFeatures => _mushroomFeatures;
  Map<String, bool> get visitedPages => _visitedPages;

  void updateFeature(String category, String feature, dynamic value) {
    _mushroomFeatures[category][feature] = value;
    notifyListeners();
  }

  void resetMushroom() {
    _mushroomFeatures = {
      "cap": {
        "shape": "b",
        "surface": "s",
        "color": "w",
      },
      "gills": {
        "spacing": "f",
        "color": "w",
      },
      "stem": {
        "surface": "s",
        "color": "w",
        "roots": "s",
      },
      "other": {"ring": "f"}
    };
    _visitedPages = {
      "cap": false,
      "gills": false,
      "stem": false,
      "other": false,
    };

    notifyListeners();
  }

  Future<Map<String, dynamic>> callAPI() async {
    final queryParameters = <String, String>{};

    _mushroomFeatures.forEach((key, value) {
      value.forEach((subKey, subValue) {
        if (subKey == 'ring') {
          queryParameters['ring-type'] = subValue;
        } else if (key == 'gills') {
          queryParameters['gill-$subKey'] = subValue;
        } else if (subKey == 'roots') {
          queryParameters['stem-root'] = subValue;
        } else {
          queryParameters['$key-$subKey'] = subValue;
        }
      });
    });

    final apiService = ApiService('https://pypapi-production.up.railway.app');
    final response = await apiService.fetchMushroomData(queryParameters);
    return response;
  }

  Future<double> getPrediction() async {
    Map<String, dynamic> response = await callAPI();
    return response['toxicity'];
  }

  Future<Map> getSpecies() async {
    Map<String, dynamic> response = await callAPI();
    return response['species'];
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
