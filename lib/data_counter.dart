
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class DataCounter extends StatelessWidget {
  const DataCounter({Key? key, required this.myCounter,}) : super(key: key);

  final Counter myCounter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: BlocBuilder(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
              ),
            );
          },
        ),
      ),
    );
  }
}
