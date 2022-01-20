import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_cubit/cubit/bool_cubit.dart';
import 'package:todo_cubit/screens/widgets/empty_task.dart';
import 'package:todo_cubit/utils/colors.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

class AllTasks extends StatefulWidget {
  final List<dynamic> todos;
  AllTasks(this.todos);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return widget.todos.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              return BlocProvider<TaskCompleteCubit>(
                create: (context) =>
                    TaskCompleteCubit(widget.todos[index].isCompleted),
                child: BlocBuilder<TaskCompleteCubit, bool>(
                    builder: (context, val) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Checkbox(
                          fillColor:
                              MaterialStateProperty.all(Color(0xff91dc5a)),
                          checkColor: Colors.white,
                          value: val,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            BlocProvider.of<TaskCompleteCubit>(context)
                                .onChangeState(value!);
                          },
                        ),
                        Text(
                          '${widget.todos[index].date}',
                          style: TextStyle(color: textGrey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // width: 200,
                          child: Text(
                            '${widget.todos[index].todoMessage}',
                            style: Medium.copyWith(
                                color:
                                    val ? Color(0xffd9d9d9) : Color(0xff554E8F),
                                decoration: val
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/task_alert.svg',
                              color: Color(0xff9d9d9d),
                            )),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.015, 0.015],
                        colors: [yellowIcon, Colors.white],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: greyBorder,
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: widget.todos.length)
        : EmptyList();
  }
}
