import 'package:flutter/material.dart';

import 'bloc/bloc_imports.dart';
import 'screen/home_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
