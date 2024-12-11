import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/create_acc.dart';
import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'models/category_model.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/createacc': (context) => CreateAcc(),
        '/search': (context) => SearchPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
