import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String task;
  const AddTodoEvent(this.task);

  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final int index;
  const RemoveTodoEvent(this.index);

  @override
  List<Object> get props => [index];
}
