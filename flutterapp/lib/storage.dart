
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Function to save data to SharedPreferences
Future<void> saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// Function to read data from SharedPreferences
Future<String?> readData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Data Storage Example',
      home: LocalDataStorageDemo(),
    );
  }
}

class LocalDataStorageDemo extends StatefulWidget {
  @override
  _LocalDataStorageDemoState createState() => _LocalDataStorageDemoState();
}

class _LocalDataStorageDemoState extends State<LocalDataStorageDemo> {
  late TextEditingController _controller;
  String? _savedValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // Load data from SharedPreferences when the widget initializes
    readData('example_key').then((value) {
      setState(() {
        _savedValue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Data Storage Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Saved value: $_savedValue'),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a value',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save data to SharedPreferences when the button is pressed
                saveData('example_key', _controller.text);
                setState(() {
                  _savedValue = _controller.text;
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
