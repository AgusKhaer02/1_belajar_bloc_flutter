import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/bloc_class.dart' as blc;

import 'home_page.dart';

class MultiBloc extends StatelessWidget {
  const MultiBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ini akan menginjeksi class myapp dengan class baru Counter,
    // jadi widget yang ada di bawahnya myapp ini dapat
    // digunakan langsung tanpa harus kirim ke widget sana sini
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => blc.Counter(),),
        BlocProvider(create: (context) => blc.Theme(),),
      ],
      child: BlocBuilder<blc.Theme, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: (state) ? ThemeData.dark() : ThemeData.light(),
            title: "Multi Bloc Latihan",
            home: HomePage(),
          );
        },
      ),
    );
  }
}