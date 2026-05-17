import 'package:bloc/bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    List<String> newList = List.from(state.todoList)..add(event.task);
    emit(state.copyWith(todoList: newList));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    List<String> newList = List.from(state.todoList)..removeAt(event.index);
    emit(state.copyWith(todoList: newList));
  }
}
