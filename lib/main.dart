import 'package:flutter/material.dart';
import 'package:flutter_app_2/firebase_options.dart';
import 'package:flutter_app_2/views/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
