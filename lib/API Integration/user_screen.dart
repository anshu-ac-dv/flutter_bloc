// screens/user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/User/user_bloc.dart';
import '../Bloc/User/user_event.dart';
import '../Bloc/User/user_state.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return const Center(child: Text('Press button to load'));
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${user.id}')),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(FetchUsers());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}