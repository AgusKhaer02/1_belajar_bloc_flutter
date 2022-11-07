import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  Stream<int> countStream() async*{
    for(int idx = 1; idx <= 10; idx++){
      // melakukan jeda selama 1 detik
      await Future.delayed(Duration(seconds: 1));
      //kemudian masukan data pada alirannya dengan angka yang ber urutan
      yield idx;
    }
  }
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Apps"),
      ),
      // jadi untuk perintah  print("rebuild") tadi, tidak akan di eksekusikan kembali
      // karna widget yang hanya berubah adalah widget yang dibungkus dengan StreamBuilder
      body: StreamBuilder(
        stream: countStream(),
        builder: (context, snapshot){
          // jika proses status connectionya sedang menunggu, maka muncul pesan loading
          // proses waiting akan terjadi jika tidak ada data pada aliran/flow
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                    fontSize: 50
                ),
              ),
            );
          }else{
            return Center(
              child: Text(
                "${snapshot.data}",
                style: const TextStyle(
                    fontSize: 50
                ),
              ),
            );
          }
          return Center(
            child: Text(
              "0",
              style: TextStyle(
                  fontSize: 50
              ),
            ),
          );
        },
      ),
    );
  }
}

