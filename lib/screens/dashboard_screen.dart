import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_cubit/cubit/bool_cubit.dart';
import 'package:todo_cubit/cubit/int_cubit.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';
import 'package:todo_cubit/screens/projects.dart';
import 'package:todo_cubit/screens/widgets/custom_modal.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

import 'all_tasks.dart';

class DashboardScreen extends StatelessWidget {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: BlocBuilder<TodosCubit, TodosState>(
              builder: (context, state) {
                if (state is TodosSuccess) {
                  return Text(
                    "Hello Abror,\nYou have ${state.todos.length} tasks",
                    style: Regular.copyWith(fontSize: 18),
                  );
                }
                return Text(
                  "Hello Abror,\nYou have 0 tasks",
                  style: Regular.copyWith(fontSize: 18),
                );
              },
            ),
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<TodosCubit, TodosState>(builder: (context, state) {
            if (state is TodosSuccess) {
              return _initBody(selectedIndex, state.todos);
            }
            return _initBody(selectedIndex, []);
          }),
          bottomNavigationBar: _initBottomNavigationBar(context, selectedIndex),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomModal(),
        );
      },
    );
  }

  _initBody(selectedIndex, todos) {
    this.selectedIndex = selectedIndex;

    switch (selectedIndex) {
      case 0:
        return AllTasks(todos);
      case 1:
        return Projects();
      default:
        return Container();
    }
  }

  _initBottomNavigationBar(context, selectedIndex) {
    return BottomNavigationBar(
      selectedLabelStyle:
          Medium.copyWith(color: Color(0xff5F87E7), fontSize: 11),
      unselectedLabelStyle:
          Medium.copyWith(color: Color(0xff9f9f9f), fontSize: 11),
      elevation: 40.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/home.svg",
                color:
                    selectedIndex == 0 ? Color(0xff5F87E7) : Color(0xff9f9f9f),
                width: 19,
                height: 20),
            label: "Home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/grid.svg",
                color:
                    selectedIndex == 1 ? Color(0xff5F87E7) : Color(0xff9f9f9f),
                width: 19,
                height: 20),
            label: "Task"),
      ],
      currentIndex: selectedIndex,
      onTap: (int pos) {
        return _onItemTapped(context, pos);
      },
    );
  }

  _onItemTapped(context, int selectedItem) {
    BlocProvider.of<IntCubit>(context).changeState(selectedItem);
  }
}
