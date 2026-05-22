import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Bloc/User/user_bloc.dart';
import '../Bloc/User/user_event.dart';
import '../Bloc/User/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Vault Registry', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.redAccent));
          } else if (state is UserLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserBloc>().add(FetchUsers());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return _buildUserCard(user);
                },
              ),
            );
          } else if (state is UserError) {
            return _buildErrorState(context, state.message);
          }
          return _buildInitialState(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserBloc>().add(FetchUsers()),
        backgroundColor: Colors.redAccent,
        child: const FaIcon(FontAwesomeIcons.arrowsRotate, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildUserCard(user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.redAccent.withAlpha(20),
            shape: BoxShape.circle,
          ),
          child: Text(
            '${user.id}',
            style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.database, size: 60, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Text('Registry Empty', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => context.read<UserBloc>().add(FetchUsers()),
            child: const Text('Connect to API'),
          )
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.triangleExclamation, size: 50, color: Colors.redAccent),
            const SizedBox(height: 20),
            Text('Sync Failed', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(message, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.read<UserBloc>().add(FetchUsers()),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
              child: const Text('Retry Connection'),
            )
          ],
        ),
      ),
    );
  }
}
