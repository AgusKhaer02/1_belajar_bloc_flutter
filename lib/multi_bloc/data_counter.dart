import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/bloc_class.dart' as blc;

class DataCounter extends StatelessWidget {
  const DataCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: MultiBlocListener(
          listeners: [
            // ini untuk theme bloc
            BlocListener<blc.Theme, bool>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "TEMA GELAP AKTIF",
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              listenWhen: (previous, current) {
                if (current == true) {
                  return true;
                }
                return false;
              },
            ),


            //  ini untuk counter bloc
            BlocListener<blc.Counter, int>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Diatas 10",
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              listenWhen: (previous, current) {
                if (current > 10) {
                  return true;
                }
                return false;
              },
            ),
          ],
          child: BlocBuilder<Counter, int>(
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 50, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
