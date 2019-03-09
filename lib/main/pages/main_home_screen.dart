import 'package:flutter/material.dart';
import 'package:flutter_practice/main/pages/main_home_screen.dart';
import 'package:flutter_practice/main/pages/main_trade_screen.dart';
import 'package:flutter_practice/main/pages/main_news_screen.dart';
import 'package:flutter_practice/main/pages/main_mine_screen.dart';

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
        length: _allPages.length,
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
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      tooltip: 'Search',
                      onPressed: null)
                ],
                centerTitle: true,
                title: new TabLayout(),
              ),
              preferredSize: Size.fromHeight(48.0)
          ),
          body: new TabBarViewLayout(),
        )
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _allPages.map((_Page page) => new Tab(text: page.labelId)).toList(),
    );
  }
}

class _Page {
  final String labelId;
  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  new _Page('全部'),
  new _Page('港股'),
  new _Page('美股'),
  new _Page('沪深'),
];


class TabBarViewLayout extends StatelessWidget {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
    switch (labelId) {
      case '全部':
        return TradeScreen();
      case '港股':
        return TradeScreen();
      case '美股':
        return NewsScreen();
      case '沪深':
        return MineScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: _allPages.map((_Page page) {
        return buildTabView(context, page);
      }).toList());
  }
}



