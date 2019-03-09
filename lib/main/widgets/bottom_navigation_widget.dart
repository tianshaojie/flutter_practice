import 'package:flutter/material.dart';
import 'package:flutter_practice/main/pages/main_home_screen.dart';
import 'package:flutter_practice/main/pages/main_trade_screen.dart';
import 'package:flutter_practice/main/pages/main_news_screen.dart';
import 'package:flutter_practice/main/pages/main_mine_screen.dart';

class NavigationKeepAlive extends StatefulWidget {
  @override
  _NavigationKeepAliveState createState() => _NavigationKeepAliveState();
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {

  final _bottomNavigationColor = Colors.blue;

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
        children: <Widget>[
          HomeScreen(),
          TradeScreen(),
          NewsScreen(),
          MineScreen()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: _bottomNavigationColor, fontSize: 11),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '交易',
                style: TextStyle(color: _bottomNavigationColor, fontSize: 11),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '资讯',
                style: TextStyle(color: _bottomNavigationColor, fontSize: 11),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor, fontSize: 11),
              )),
        ],
      ),
    );
  }
}
