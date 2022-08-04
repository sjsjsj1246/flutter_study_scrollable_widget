import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (i) => i);
  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "GridViewScreen",
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
          itemBuilder: (context, index) {
            return renderContainer(
                color: rainbowColors[index % rainbowColors.length],
                index: index);
          }),
    );
  }

  // 1. count
  // 한번에 다 렌더링됨
  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: numbers
          .map((i) => renderContainer(
              color: rainbowColors[i % rainbowColors.length], index: i))
          .toList(),
    );
  }

  // 2. bulder, DelegateWithFixedCrossAxisCount
  Widget renderGridCrossAxisCount() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        });
  }

  // 3. bulder, DelegateWithMaxCrossAxisExtent
  // max 크기를 넘지 않는 선에서 알아서 배치해줌
  Widget renderGridCrossAxisMax() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        });
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
