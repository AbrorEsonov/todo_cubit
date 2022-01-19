import 'package:flutter/material.dart';
import 'package:todo_cubit/utils/fonts.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("AllTasks", style: Medium.copyWith(color: Colors.red),),
    );
  }
}
