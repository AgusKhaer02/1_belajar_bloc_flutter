import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc_selector/bloc_selector.dart';
import 'package:latihan_bloc/data_counter.dart';
import 'package:latihan_bloc/dependency_injection/home_page.dart' as di;
import 'package:latihan_bloc/multi_bloc/multi_bloc.dart';

main() {
  runApp(MBlocSelector());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ini akan menginjeksi class myapp dengan class baru Counter,
    // jadi widget yang ada di bawahnya myapp ini dapat
    // digunakan langsung tanpa harus kirim ke widget sana sini
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        title: "Bloc Provider",
        home: di.HomePage(),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Counter myCounter = Counter();

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
                    myCounter.decrement();
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
              DataCounter(myCounter: myCounter),

              // button +
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    myCounter.increment();
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
    );
  }
}
