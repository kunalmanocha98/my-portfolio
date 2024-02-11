import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_routes.dart';
import 'modules/home/home_page.dart';
import 'modules/test/test_page.dart';

void main() {
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
        Routes.initialRoute: (context)=> HomePage(),
        Routes.testRoute: (context)=> TestPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      switch(settings.name){
        case Routes.initialRoute:{
          return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          );
        }
        case Routes.testRoute:{
          return MaterialPageRoute(
            builder: (BuildContext context) => const TestPage(),
          );
        }
      }
      return null;
    };
  }

}
