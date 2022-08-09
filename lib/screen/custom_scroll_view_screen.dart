import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/const/colors.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate(
      {required this.child, required this.maxHeight, required this.minHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  //최대 높이
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  // covariant - 상속된 class도 사용 가능
  // oldDelegate - build가 실행이 됐을 때 이전 delegate
  // this - 새로운 delegate
  // shouldRebuild - 새로 build를 해야할지 말지 결정
  // false - build 안함, true - build 함
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(6, (index) => index);

  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      renderSliverAppbar(),
      renderHeader(),
      renderChildSliverList(),
      renderHeader(),
      renderSliverGridBuilder()
    ]));
  }

  //header
  Widget renderHeader() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverFixedHeaderDelegate(
            child: Container(
                color: Colors.black,
                child: Center(
                  child: Text("hi", style: TextStyle(color: Colors.white)),
                )),
            maxHeight: 150,
            minHeight: 75));
  }

  // Appbar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
        //중간에 스크롤 하면 보임
        floating: true,
        // 완전 고정
        // pinned: true,
        //손가락 때면 올라감, floating true일 때만 사용
        snap: true,
        //한계 이상으로 스크롤 시 맵바가 남은 공간 차지
        stretch: true,
        expandedHeight: 200,
        collapsedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("CustomScrollViewScreen"),
            background: Image.asset(
              "assets/img/image1.jpg",
              fit: BoxFit.cover,
            )),
        title: Text("CustomScrollViewScreen"));
  }

  // Gridview.count와 유사함
  SliverGrid renderChildSLiverGrid() {
    return SliverGrid(
        delegate: SliverChildListDelegate(numbers
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList()),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }

  //
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 30,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
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
