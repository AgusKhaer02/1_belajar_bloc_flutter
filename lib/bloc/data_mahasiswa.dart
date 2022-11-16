

import 'package:flutter_bloc/flutter_bloc.dart';

class DataMahasiswa extends Cubit<Map<String, dynamic>>{
  DataMahasiswa() : super({"name" : "", "age" : 0});

  void changeName(String newName){
    emit({
      "name" : newName,
      "age" : state['age'],
    });
  }

  void changeAge(int newAge){
    emit({
      "name" : state['name'],
      "age" : newAge,
    });
  }


}