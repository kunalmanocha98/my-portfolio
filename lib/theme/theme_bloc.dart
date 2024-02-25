import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/theme/theme_state.dart';

class ThemeBloc extends Cubit<ThemeState>{
  ThemeBloc(super.initialState);

  changeState(bool isDark){
    isDark?emit(LightThemeState()):emit(DarkThemeState());
  }

}