import 'package:flutter/material.dart';
import 'package:netflixclone/widget/bottom_bar.dart';
import 'package:netflixclone/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HIDIFlix",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              TabBarItemContainerMaker("search"),
              TabBarItemContainerMaker("save"),
              TabBarItemContainerMaker("more"),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }

  TabBarItemContainerMaker(String tabBarTitle) {
    return Container(
      child: Center(
        child: Text(tabBarTitle),
      ),
    );
  }
}
