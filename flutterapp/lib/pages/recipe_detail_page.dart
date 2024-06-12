import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../state/app_state.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(title: Text('Recipe Details Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(recipe.photo),
            SizedBox(height: 10),
            Text(recipe.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Ingredients:', style: TextStyle(fontSize: 18)),
            Text(recipe.ingredients),
            SizedBox(height: 10),
            Text('Instructions:', style: TextStyle(fontSize: 18)),
            Text(recipe.instructions),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<AppState>(context, listen: false).toggleFavourite(recipe);
                Navigator.pushReplacementNamed(context, '/favourites');
              },
              child: Text('Add Favourite'),
            ),
          ],
        ),
      ),
    );
  }
}
