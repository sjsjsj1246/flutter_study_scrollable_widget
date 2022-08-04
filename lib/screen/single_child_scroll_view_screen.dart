import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

//하나의 자식을 가지는 스크롤 가능한 위젯
//화면에 보이지 않을 위젯도 모두 랜더링 하기 때문에 퍼포먼스가 좋지 않다.
class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (i) => i);

  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "SingleChildScrollViewScreen",
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
              children: numbers
                  .map((i) => renderContainer(
                      index: i, color: rainbowColors[i % rainbowColors.length]))
                  .toList()),
        ));
  }

  // 1. 기본 방법
  // 화면이 넘어가면 스크롤 됨
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
          children: rainbowColors
              .map((color) => renderContainer(color: color))
              .toList()),
    );
  }

  // 2. physics
  // 화면이 넘어가지 않아도 스크롤 됨
  Widget renderAlwayScroll() {
    return SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics() => 스크롤 안됨,
        // physics: BouncingScrollPhysics() => ios 기본, 윗 화면이 빈 화면으로 보이게 당겨짐,
        // physics: ClampingScrollPhysics() => android 기본, 스크롤 안되지만 파랗게 보임(안드만),
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [renderContainer(color: Colors.black)]));
  }

  // 3. clipBehavior
  // 내용이 어떻게 잘릴지 정의
  Widget renderClip() {
    return SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [renderContainer(color: Colors.black)]));
  }

  // 4. renderPerformance
  Widget renderPerformance() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
          children: numbers
              .map((i) => renderContainer(
                  index: i, color: rainbowColors[i % rainbowColors.length]))
              .toList()),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if (index != null) print(index);
    return Container(
      color: color,
      height: 300,
    );
  }
}
