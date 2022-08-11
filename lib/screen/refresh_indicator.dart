import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "RefreshIndicatorScreen",
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
        },
        child: ListView(
            children: numbers
                .map((e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length], index: e))
                .toList()),
      ),
    );
  }

  Widget renderContainer({required int index, required Color color}) {
    print(index);
    return Container(
        height: 300,
        color: color,
        key: Key(index.toString()),
        child: Center(
            child: Text("$index",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30))));
  }
}
