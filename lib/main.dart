import 'package:flutter/material.dart';
import 'FirstScreen.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter',
    home: new Main(),
  ));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _allTabss.length,
        child: new Scaffold(
          appBar: PreferredSize(
              child: new AppBar(
                leading: new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    tooltip: 'Navigation Menu',
                    onPressed: null),
                centerTitle: true,
                title: new TabLayout(),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      tooltip: 'Search',
                      onPressed: null)
                ],
              ),
              preferredSize: Size.fromHeight(48.0)),
        ));
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _allTabss.map((String name) => new Tab(text: name)).toList(),
    );
  }
}

final List<String> _allTabss = <String>['全部', '港股', '美股', '沪深'];
