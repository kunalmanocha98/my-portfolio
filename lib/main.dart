import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/personal/bloc/personal_bloc.dart';
import 'package:portfolio/modules/personal/model/personal_detail_model.dart';
import 'package:portfolio/modules/personal/state/personal_state.dart';
import 'package:portfolio/modules/teckStack/bloc/tech_bloc.dart';
import 'package:portfolio/modules/teckStack/model/tech_stack_model.dart';
import 'package:portfolio/modules/teckStack/state/tech_state.dart';
import 'package:portfolio/utils/app_routes.dart';
import 'package:portfolio/utils/strings.dart';
import 'modules/home/home_page.dart';
import 'firebase_options.dart';

FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

void main() async {
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

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return PersonalBloc(InitialPersonalState(PersonalDetailsResponse()));
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return TechBloc(InitialTechState(TechStackResponse()));
          },
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: _routes(),
        initialRoute: Routes.initialRoute,
        routes: {
          Routes.initialRoute: (context) => const HomePage(),
          // Routes.homeRoute: (context) => const HomePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
          useMaterial3: true,
        ),
      ),
    );
  }
}
