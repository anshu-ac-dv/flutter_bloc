import 'package:bloc_learning/Utils/image_picker_utils.dart';
import 'package:bloc_learning/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/Counter/counter_bloc.dart';
import 'Bloc/ImagePicker/image_picker_bloc.dart';
import 'Bloc/Switch/switch_bloc.dart';
import 'Bloc/Todo/todo_bloc.dart';
import 'Bloc/User/user_bloc.dart';
import 'Bloc/User/user_event.dart';
import 'Repo/user_repo.dart';

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
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => UserBloc(userRepository: UserRepository())..add(FetchUsers()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
