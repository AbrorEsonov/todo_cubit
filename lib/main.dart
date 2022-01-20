import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_observer.dart';
import 'package:todo_cubit/route/app_route.dart';
import 'package:todo_cubit/route/app_route_name.dart';
import 'package:todo_cubit/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TodoObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    return MaterialApp(
      title: 'Todo task',
      theme: ThemeData(
        canvasColor: greyBackColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.ONBOARD,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
