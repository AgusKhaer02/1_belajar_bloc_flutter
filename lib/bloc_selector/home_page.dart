import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/data_mahasiswa.dart';
import 'package:latihan_bloc/dependency_injection/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DataMahasiswa dataMhs = context.read<DataMahasiswa>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // penggunaan builder dalam class bloc yang sama akan terjadinya perubahan pada satu kelompok data
          // ini kalo misalkan yang diganti adalah umur,  maka ia akan print 2 duanya,
          // BlocBuilder<DataMahasiswa, Map<String, dynamic>>(
          //   bloc: dataMhs,
          //   builder: (context, state) {
          //     print("nama : build");
          //     return Text("Nama : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<DataMahasiswa, Map<String, dynamic>>(
          //   bloc: dataMhs,
          //   builder: (context, state) {
          //     print("Umur : build");
          //     return Text("Umur : ${state['age']}");
          //   },
          // ),

          //SOLUSI
          //gunakan BlocSelector
          BlocSelector<DataMahasiswa, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              print("nama : build");
              return Text("nama : $state");
            },
          ),
          BlocSelector<DataMahasiswa, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              print("umur : build");
              return Text("umur : $state");
            },
          ),

          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              dataMhs.changeName(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  dataMhs.changeAge(dataMhs.state['age'] - 1);
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  dataMhs.changeAge(dataMhs.state['age'] + 1);
                },
                icon: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
