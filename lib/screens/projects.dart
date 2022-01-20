import 'package:flutter/material.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 15, left: 18),
                  child: Text("Projects", style: Medium.copyWith(color: Color(0xff8B87B3), fontSize: 13),)),
            )
          ];
        },
        body: GridView.count(
            crossAxisCount: 2,
                mainAxisSpacing: 10.0,
          crossAxisSpacing: 18.0,
          children: [

          ],
        )
    );
  }
}
