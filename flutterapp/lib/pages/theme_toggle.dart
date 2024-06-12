import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart'; // Assuming you're using Provider for state management

class ThemeTogglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the app state using Provider
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Toggle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: appState.isDarkTheme,
              onChanged: (value) {
                // Call toggleTheme function to toggle the theme
                appState.toggleTheme();
              },
            ),
            Text(
              'Dark Theme',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}