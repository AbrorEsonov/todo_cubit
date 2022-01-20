import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SvgPicture.asset('assets/svg/empty_note.svg'),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    'No tasks',
                    style: Medium.copyWith(color: Color(0xff554e8f), fontSize: 22),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
