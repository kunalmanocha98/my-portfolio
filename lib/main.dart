import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_routes.dart';
import 'modules/home/home_page.dart';
import 'modules/test/test_page.dart';
import 'firebase_options.dart';


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kunal Manocha',
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: _routes(),
      initialRoute: Routes.initialRoute,
      routes: {
        Routes.initialRoute: (context)=> const TestPage(),
        Routes.homeRoute: (context)=> const HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
    );
  }

}
