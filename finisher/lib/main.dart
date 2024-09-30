import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart'; // Import HomeScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized before running the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finish It!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(userId: 'your_user_id'), // Replace 'your_user_id' with actual user ID
    );
  }
}
