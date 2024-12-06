import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/create_acc.dart';
import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'models/category_model.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
