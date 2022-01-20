import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCompleteCubit extends Cubit<bool> {
  TaskCompleteCubit(bool initialState) : super(initialState);

  void onChangeState(bool newState) => emit(newState);
}