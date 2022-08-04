import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (i) => i);

  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "ListViewScreen", body: renderSeparated());
  }

  // 1. render default
  // SingleChildScrollView와 유사하다.
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    );
  }

  // 2. render builder
  // 화면에 보이는 부분과 상하 일부만 렌더링함
  Widget renderBuilder() {
    return ListView.builder(itemBuilder: (context, index) {
      return renderContainer(
          color: rainbowColors[index % rainbowColors.length], index: index);
    });
  }

  // 3. render separated
  // 중간중간 렌더링 해줄 수 있음
  Widget renderSeparated() {
    return ListView.separated(
        itemCount: numbers.length,
        //배너 광고에 유용함, 5번째 item마다 광고 보여주기
        separatorBuilder: (context, index) {
          index += 1;
          if (index % 5 == 0) {
            return renderContainer(color: Colors.black, index: index);
          } else {
            return Container();
          }
        },
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
