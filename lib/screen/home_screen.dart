import 'package:flutter/material.dart';
import 'package:flutter_study_scrollable_widget/layout/main_layout.dart';
import 'package:flutter_study_scrollable_widget/screen/single_child_scroll_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "home",
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SingleChildScrollViewScreen()));
                  },
                  child: Text("SingleChildScrollViewScreen"))
            ],
          ),
        ));
  }
}
