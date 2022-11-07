import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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


//datanya nanti bertipe int
class CounterCubit extends Cubit<int>{
  // angka awal dari cubit adalah 0 dengan variabel initialData
  int initialData;

  int? current;
  int? next;

  CounterCubit({this.initialData = 0}) : super(initialData);

  void tambahData(){
    // ini untuk mengambil nilai pada state
    // state +1;

    //  ini untuk set nilai pada State, gunakan emit!
    emit(state + 1);
  }
  void kurangData(){
    emit(state - 1);
  }

//  observer = memantau suatu class yang berhubungan dengan cubit atau bloc
//  - pantau perubahan (onchange)
//  - pantau error (onerror)
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    //setiap perubahan yang terjadi langsung cetak output
    //contoh => currentState : 0, nextState : 1
    // print(change);

    current = change.currentState;
    next = change.nextState;
  }

}

class HomePage extends StatelessWidget {

  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            // supaya berawal dari angka 0, maka gunakan initial data
            // dan untuk initial data di tentukan oleh variabel initial data pada class MyCounter
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot){
              // jika proses status connectionya sedang menunggu, maka muncul pesan loading
              // proses waiting akan terjadi jika tidak ada data pada aliran/flow
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Center(
              //     child: Text(
              //       "Loading...",
              //       style: TextStyle(
              //           fontSize: 50
              //       ),
              //     ),
              //   );
              // }else{
              return Center(
                child: Column(
                  children: [
                    Text(
                      "${snapshot.data}",
                      style: const TextStyle(
                          fontSize: 50
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "current : ${myCounter.current ?? 0}",
                          style: const TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "next : ${myCounter.next ?? 0}",
                          style: const TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              // }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.kurangData();

                },
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  myCounter.tambahData();
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
