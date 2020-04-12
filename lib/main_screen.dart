import 'package:flutter/material.dart';
import 'package:flutter_practice/main/pages/main_home_screen.dart';
import 'package:flutter_practice/main/pages/main_trade_screen.dart';
import 'package:flutter_practice/main/pages/main_news_screen.dart';
import 'package:flutter_practice/main/pages/main_mine_screen.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      home: MainNavigation(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {

  final List<Widget> _tabPages = [HomeScreen(), TradeScreen(), NewsScreen(), MineScreen()];
  final List<IconData> _tabIcons = [Icons.home, Icons.favorite, Icons.comment, Icons.person];
  final List<String> _tabNames = ['首页', '交易', '资讯', '我的'];

  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _tabPages,
        physics: NeverScrollableScrollPhysics(),
      ),
//      bottomNavigationBar: SizedBox(height: 55, child: BottomNavigationBar()),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          iconSize: 24,
          fixedColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          items: _tabIcons.map((name) {
            return _buildItem(_tabIcons.indexOf(name));
          }).toList()
      ),
    );
  }

  BottomNavigationBarItem _buildItem(int index) {
    return BottomNavigationBarItem(
      icon: _tabIcon(index),
      title: _tabText(index),
    );
  }

  Icon _tabIcon(int index) {
    return new Icon(_tabIcons[index], color: _tabColor(index));
  }

  Text _tabText(int index) {
    return new Text(_tabNames[index], style: TextStyle(fontSize: 10));
  }

  Color _tabColor(int index) {
    return _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
  }
}
