import 'package:bloc/bloc.dart';
import 'package:todo_cubit/model/todo.dart';

part 'todo_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final List<Todo> todoList;

  TodosCubit(this.todoList) : super(TodosInitial());

  void addTodo(Todo todo) {
    todoList.add(todo);
    emit(TodosSuccess(todos: todoList));
  }
}
