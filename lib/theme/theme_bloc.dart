import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/personal/bloc/personal_bloc.dart';
import 'package:portfolio/theme/theme_state.dart';

class ThemeBloc extends Cubit<ThemeState>{
  ThemeBloc(super.initialState);

  changeState(BuildContext context,bool isDark){
    isDark?emit(LightThemeState()):emit(DarkThemeState());
    updateOtherWidgets(context);
  }

  updateOtherWidgets(BuildContext context){
    BlocProvider.of<PersonalBloc>(context).emitLoadedData();
  }

}