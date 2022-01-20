import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';
import 'package:todo_cubit/model/todo.dart';
import 'package:todo_cubit/utils/colors.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

class CustomModal extends StatefulWidget {
  const CustomModal({Key? key}) : super(key: key);

  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  late double _height;
  late double _width;

  String? _setTime, _setDate;

  late String _hour, _minute, _time;

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ':' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2022, 01, 20, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    print(_timeController.text);
  }

  @override
  void initState() {
    _timeController.text = formatDate(
        DateTime(2022, 01, 20, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context2) {
            return BlocProvider.value(
              value: BlocProvider.of<TodosCubit>(context),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: MediaQuery.of(context).size.height / 8.5,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(175, 30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 11,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                    'assets/images/close_modal.png'),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      purpleLight,
                                      purpleDark,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: purpleShadow,
                                      blurRadius: 10.0,
                                      spreadRadius: 5.0,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  'Add new task',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: TextFormField(
                                    controller: _messageController,
                                    cursorColor: Color(0xff373737),
                                    autofocus: true,
                                    style: Regular.copyWith(
                                        fontSize: 18.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                          ..color = Color(0xff373737)),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: Text(
                                        'Choose date',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _selectTime(context);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            width: 150,
                                            height: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200]),
                                            child: TextFormField(
                                                style: TextStyle(fontSize: 30),
                                                textAlign: TextAlign.center,
                                                onSaved: (String? val) {
                                                  _setTime = val;
                                                },
                                                enabled: false,
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: _timeController,
                                                decoration: InputDecoration(
                                                    disabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    contentPadding:
                                                        EdgeInsets.all(5))))),
                                  ],
                                ),
                                SizedBox(height: 20),
                                RaisedButton(
                                  onPressed: () {
                                    print(_messageController.text);
                                    if (_messageController.text.isNotEmpty) {
                                      BlocProvider.of<TodosCubit>(context)
                                          .addTodo(Todo(
                                              todoMessage:
                                                  _messageController.text,
                                              isCompleted: false,
                                              date: _timeController.text));
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }
                                  },
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          blueLight,
                                          blueDark,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: blueShadow,
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Center(
                                      child: const Text(
                                        'Add task',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      elevation: 5,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/images/add_fab_png.png'),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              purpleLight,
              purpleDark,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
              color: purpleShadow,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
