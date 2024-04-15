import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouiteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouiteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    bool mealIsFavourite = state.contains(meal);
    // state - List<Meal>, это и есть наши данные
    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouiteMealsNotifier, List<Meal>>(
  (ref) {
    return FavouiteMealsNotifier();
  },
);
