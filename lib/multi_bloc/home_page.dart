import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/bloc_class.dart';
import 'data_counter.dart';
import 'second_page.dart';
import 'package:latihan_bloc/bloc/bloc_class.dart' as blc;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    blc.Theme blocTheme = context.read<blc.Theme>();

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
          blocTheme.change();
        },
      ),
    );
  }
}
