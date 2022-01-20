import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/int_cubit.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';
import 'package:todo_cubit/route/app_route.dart';
import 'package:todo_cubit/screens/dashboard_screen.dart';
import 'package:todo_cubit/screens/on_boarding.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.ONBOARD:
        return MaterialPageRoute(builder: (context) => OnBoardScreen());
      case AppRouteName.DASHBOARD:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<IntCubit>(create: (context) => IntCubit(0)),
                  BlocProvider<TodosCubit>(create: (context) => TodosCubit([])),
                ], child: DashboardScreen()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          body: Center(
        child: Text('Error Route'),
      ));
    });
  }
}
