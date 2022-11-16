import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/dependency_injection/second_page.dart';

import 'data_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // button -
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // counter number
              DataCounter(),

              // button +
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              //tidak boleh melakukan create class Counter lagi dengan bloc provider,
              // karna dia akan membuat state baru pada bloc provider, hasilnya angka jadi 0
              builder: (context) => BlocProvider(
                create: (context) => Counter(),
                child: SecondPage(),
              ),
            ),
          );

          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => SecondPage())
          // );
        },
      ),
    );
  }
}
