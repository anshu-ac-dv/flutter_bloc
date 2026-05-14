import 'package:bloc_learning/ImagePicker/image_picker.dart';
import 'package:bloc_learning/Switch/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/Counter/counter_bloc.dart';
import 'Bloc/Switch/switch_bloc.dart';
import 'Counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        //home: const CounterScreen(),
        //home: SwitchScreen(),
        home: ImagePicker(),
      ),
    );
  }
}
