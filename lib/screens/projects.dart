import 'package:flutter/material.dart';
import 'package:todo_cubit/utils/fonts.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Projects", style: Medium.copyWith(color: Colors.red),),
    );
  }
}
