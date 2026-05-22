// bloc/user_bloc.dart
import 'package:bloc_learning/Models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Repo/user_repo.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
      FetchUsers event,
      Emitter<UserState> emit,
      ) async {
    emit(UserLoading());
    try {
      final List<User> users = await userRepository.fetchUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Failed to fetch users: ${e.toString()}'));
    }
  }
}