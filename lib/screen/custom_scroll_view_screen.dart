import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(title: Text("CustomScrollViewScreen")),
    ]));
  }

  // ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate(numbers
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList()));
  }

  SliverList renderChildBulderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
            index: index, color: rainbowColors[index % rainbowColors.length]);
      }),
    );
  }

  Widget renderContainer({required int index, required Color color}) {
    print(index);
    return Container(
        height: 300,
        color: color,
        child: Center(
            child: Text("$index",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30))));
  }
}
