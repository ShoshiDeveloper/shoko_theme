import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

final class ThemeCubitState {
  final String activeTheme;
  ThemeCubitState(this.activeTheme);
}

@protected
class ThemeCubit extends Cubit<ThemeCubitState> {
  static String activeTheme = 'light';
  ThemeCubit() : super(ThemeCubitState(activeTheme));

  changeTheme() {
    activeTheme = activeTheme == 'light' ? 'dark' : 'light';
    emit(ThemeCubitState(activeTheme));
  }
}