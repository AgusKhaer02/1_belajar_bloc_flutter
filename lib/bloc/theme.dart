import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
class Theme extends Cubit<bool> {
  Theme({this.init = false}) : super(init);
  bool init;

  // ThemePreferences? _preferences;
  void change () {
    emit(!state);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
