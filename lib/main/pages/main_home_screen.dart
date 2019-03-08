import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

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
              preferredSize: Size.fromHeight(48.0)
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '1',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        )
    );
  }
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
              preferredSize: Size.fromHeight(48.0)
          ),
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
