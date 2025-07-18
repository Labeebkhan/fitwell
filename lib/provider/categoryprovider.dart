import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<String> baseCategories = ['All', 'Chest', 'Back', 'Arms'];
  Set<String> selectedExercises = {};

  List<String> get categories => [...baseCategories, ...selectedExercises];

  void toggleExercise(String exercise) {
    if (selectedExercises.contains(exercise)) {
      selectedExercises.remove(exercise);
    } else {
      selectedExercises.add(exercise);
    }
    notifyListeners();
  }

  bool isSelected(String exercise) => selectedExercises.contains(exercise);
}
