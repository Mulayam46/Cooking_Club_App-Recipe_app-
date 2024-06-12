import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../models/recipe.dart';

class MyFavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<AppState>(context).favourites;

    return Scaffold(
      appBar: AppBar(title: Text('My Favourites')),
      body: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final recipe = favourites[index];
          return ListTile(
            title: Text(recipe.title),
            leading: Image.asset(recipe.photo),
            onTap: () {
              Navigator.pushNamed(context, '/recipeDetail', arguments: recipe);
            },
          );
        },
      ),
    );
  }
}
