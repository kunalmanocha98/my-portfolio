import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/contact/bloc/contact_bloc.dart';
import 'package:portfolio/modules/contact/model/contact_model.dart';
import 'package:portfolio/modules/contact/state/contact_state.dart';
import 'package:portfolio/modules/education/bloc/education_bloc.dart';
import 'package:portfolio/modules/education/model/education_model.dart';
import 'package:portfolio/modules/education/state/education_state.dart';
import 'package:portfolio/modules/experience/bloc/exp_bloc.dart';
import 'package:portfolio/modules/experience/models/experience_model.dart';
import 'package:portfolio/modules/experience/state/exp_state.dart';
import 'package:portfolio/modules/personal/bloc/personal_bloc.dart';
import 'package:portfolio/modules/personal/model/personal_detail_model.dart';
import 'package:portfolio/modules/personal/state/personal_state.dart';
import 'package:portfolio/modules/projects/bloc/project_bloc.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';
import 'package:portfolio/modules/projects/state/project_state.dart';
import 'package:portfolio/modules/techStack/bloc/tech_bloc.dart';
import 'package:portfolio/modules/techStack/model/tech_stack_model.dart';
import 'package:portfolio/modules/techStack/state/tech_state.dart';
import 'package:portfolio/theme/theme_bloc.dart';
import 'package:portfolio/theme/theme_state.dart';
import 'package:portfolio/utils/app_routes.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/home/home_page.dart';
import 'firebase_options.dart';

FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
late SharedPreferences gPrefs;

void main() async {
  gPrefs = await SharedPreferences.getInstance();
  gPrefs.setBool(PrefKeys.isDarkTheme, true);
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
        BlocProvider(
          create: (BuildContext context) {
            return ProjectBloc(InitialProjectState(ProjectsResponse()));
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ExpBloc(InitialExpState(ExperienceResponse()));
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ContactBloc(InitialContactState(ContactResponse()));
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return EducationBloc(InitialEducationState(EducationalResponse()));
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ThemeBloc((gPrefs.getBool(PrefKeys.isDarkTheme)??true)?DarkThemeState():LightThemeState());
          },
        ),
      ],
      child: BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state) {
          if(state is DarkThemeState){
            return _getMaterialApp(state.themeMode, state.themeData);
          }else if(state is LightThemeState){
            return _getMaterialApp(state.themeMode, state.themeData);
          }else{
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }


  Widget _getMaterialApp(ThemeMode mode, ThemeData themeData){
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: mode,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      routes: {
        Routes.initialRoute: (context) => HomePage(),
      },
    );
  }
}
