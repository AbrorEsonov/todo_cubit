import 'package:flutter_bloc/flutter_bloc.dart';

class IntCubit extends Cubit<int>{

  IntCubit(int initialState) : super(initialState);

  void changeState(int value){
    emit(value);
  }

}
