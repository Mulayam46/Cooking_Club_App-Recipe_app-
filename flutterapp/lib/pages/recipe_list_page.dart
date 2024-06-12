import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../state/app_state.dart';

class RecipeListPage extends StatefulWidget {
  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() {
    setState(() {
      _recipes = getRecipes();
      _filteredRecipes = _recipes;
    });
  }

  void _filterRecipes(String query) {
    setState(() {
      _searchQuery = query;
      _filteredRecipes = _recipes.where((recipe) {
        return recipe.title.contains(query) || recipe.ingredients.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes List/Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: RecipeSearchDelegate(_recipes));
            },
          ),
          IconButton(
            icon: Icon(Icons.colorize),
            onPressed: (){Navigator.pushNamed(context, '/theme');},
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, '/favourites');},
      //   child: SizedBox(
      //     width: 100,
      //     child: Text('Go to Fav list'),)),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){Navigator.pushNamed(context, '/favourites');},
            child: SizedBox(
              width: 100,
              child: Text('Go to Fav list'),
            ),
          ),
          SizedBox(height: 10), // Add some spacing between the buttons
          FloatingActionButton(
            onPressed: (){
              // Handle user info button press
              // Example: Navigate to user info page
              Navigator.pushNamed(context, '/profile');
            },
            child: SizedBox(
              width: 100,
              child: Text('User Info'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = _filteredRecipes[index];
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

class RecipeSearchDelegate extends SearchDelegate {
  final List<Recipe> recipes;

  RecipeSearchDelegate(this.recipes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = recipes.where((recipe) => recipe.title.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final recipe = results[index];
        return ListTile(
          title: Text(recipe.title),
          leading: Image.asset(recipe.photo),
          onTap: () {
            close(context, null);
            Navigator.pushNamed(context, '/recipeDetail', arguments: recipe);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = recipes.where((recipe) => recipe.title.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final recipe = suggestions[index];
        return ListTile(
          title: Text(recipe.title),
          leading: Image.asset(recipe.photo),
          onTap: () {
            query = recipe.title;
            showResults(context);
          },
        );
      },
    );
  }
}
