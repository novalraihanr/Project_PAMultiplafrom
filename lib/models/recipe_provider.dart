import 'dart:async';

import 'package:app_resep_makanan/models/recipe_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  final _dbRef = FirebaseDatabase.instance.ref();

  static const String RECIPE_PATH = 'recipe';

  late final StreamSubscription<DatabaseEvent> _recipeStream;

  List<Recipe> get recipes => _recipes;

  RecipeProvider() {
    _listenToRecipes();
  }

  void _listenToRecipes() {
    _recipeStream = _dbRef.child(RECIPE_PATH).onValue.listen((event) {
        final Map<String, dynamic> recipes = Map<String, dynamic>.from(event.snapshot.value as Map);
        _recipes = recipes.values.map((asJson) => Recipe.fromRTDB(Map<String, dynamic>.from(asJson))).toList();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _recipeStream.cancel();
    super.dispose();
  }
}
