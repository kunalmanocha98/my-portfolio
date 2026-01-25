import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/theme/event/theme_event.dart';
import 'package:portfolio/modules/theme/state/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(ThemeMode.dark)) {
    on<ThemeChangedEvent>((event, emit) {
      emit(ThemeChanged(event.themeMode));
    });

    on<ThemeToggleEvent>((event, emit) {
      final newMode =
          state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      emit(ThemeChanged(newMode));
    });
  }
}
