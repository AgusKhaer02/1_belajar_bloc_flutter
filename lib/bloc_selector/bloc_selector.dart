import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/bloc_class.dart' as blc;
import 'package:latihan_bloc/bloc/data_mahasiswa.dart';

import 'home_page.dart';

class MBlocSelector extends StatelessWidget {
  const MBlocSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ini akan menginjeksi class myapp dengan class baru Counter,
    // jadi widget yang ada di bawahnya myapp ini dapat
    // digunakan langsung tanpa harus kirim ke widget sana sini
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DataMahasiswa(),),
      ],
      child: MaterialApp(
        title: "Bloc Selector Latihan",
        home: HomePage(),
      ),
    );
  }
}