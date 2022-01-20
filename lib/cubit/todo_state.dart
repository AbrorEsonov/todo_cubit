part of 'todo_cubit.dart';

abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosSuccess extends TodosState {
  final List<Todo> todos;

  TodosSuccess({required this.todos});
}
