

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/profile_page.dart';
import 'package:flutterapp/pages/theme_toggle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'localization.dart';
import 'pages/sign_in_page.dart';
import 'pages/recipe_list_page.dart';
import 'pages/recipe_detail_page.dart';
import 'pages/my_favourites_page.dart';
import 'models/recipe.dart';
import 'state/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Cooking Club',
            theme: appState.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'),
              Locale('es', ''),
            ],
            locale: appState.locale,
            initialRoute: '/',
            routes: {
              '/': (context) => SignInPage(),
              '/recipes': (context) => RecipeListPage(),
              '/recipeDetail': (context) => RecipeDetailPage(),
              '/favourites': (context) => MyFavouritesPage(),
              '/theme': (context) => ThemeTogglePage(),
              '/profile': (context) => ProfilePage(),
            },
          );
        },
      ),
    );
  }
}

