import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //initial val o lista empty
  FavoriteMealsNotifier() : super([]);
  //in super pasam initial data

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    //nu poti modifica ceva in memorie cu .add sau .remove, trebuie creata
    //alta chestie noua in memorie sa-i dam replace
    //state holds the data
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    //update the state in inmutable state
    //without mutating the existing state in memory
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
