import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //class ini dari flutter_bloc
          BlocBuilder<Counter, int>(
            bloc: myCounter,
            // bloc ini akan build widget baru jika buildwhen memiliki nilai kembalian true
            buildWhen: (previous, current) {
              //dalam hal ini,
              //jika nilai sekarang adalah nilai genap/nilai yang bisa dibagi 2
              if (current % 2 == 0) {
                // maka dapat build ulang
                return true;
              } else {
                // tidak dapat di build ulang
                return false;
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      "$state",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              );
            },
          ),
          // StreamBuilder(
          //   initialData: myCounter.init,
          //   stream: myCounter.stream,
          //   builder: (context, snapshot){
          //     return Center(
          //       child: Column(
          //         children: [
          //           Text(
          //             "${snapshot.data}",
          //             style: const TextStyle(
          //                 fontSize: 50
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //     // }
          //   },
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
