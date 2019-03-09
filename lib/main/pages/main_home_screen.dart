import 'package:flutter/material.dart';
import 'package:flutter_practice/main/pages/main_trade_screen.dart';
import 'package:flutter_practice/main/pages/main_news_screen.dart';
import 'package:flutter_practice/main/pages/main_mine_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// TabController + TabBar + TabBarView
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _allTabs.length,
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
                title: new TabBar(
                  isScrollable: true,
                  labelPadding: EdgeInsets.all(12.0),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _allTabs.map((name) => new Tab(text: name)).toList(),
                ),
              ),
              preferredSize: Size.fromHeight(48.0)
          ),
          body: new TabBarViewLayout(),
        )
    );
  }
}

final List<String> _allTabs  = ['全部', '港股', '美股', '沪深'];
final List<Widget> _allPages = [TradeScreen(), TradeScreen(), NewsScreen(), MineScreen()];

class TabBarViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBarView(
        children: _allTabs.map((name) {
          return _allPages[_allTabs.indexOf(name)];
        }).toList());
  }
}


