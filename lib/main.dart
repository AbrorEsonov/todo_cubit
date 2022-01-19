import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_observer.dart';
import 'package:todo_cubit/route/app_route.dart';
import 'package:todo_cubit/route/app_route_name.dart';
import 'package:todo_cubit/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    Bloc.observer = TodoObserver();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    return MaterialApp(
      title: 'ToDo task',
      theme: ThemeData(
        canvasColor: GreyBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: Colors.white,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                fixedSize: Size(double.maxFinite, 56))),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.ONBOARD,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
