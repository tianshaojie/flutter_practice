import 'package:flutter/material.dart';
import 'package:flutter_practice/main/pages/main_home_screen.dart';
import 'package:flutter_practice/main/pages/main_trade_screen.dart';
import 'package:flutter_practice/main/pages/main_news_screen.dart';
import 'package:flutter_practice/main/pages/main_mine_screen.dart';
import 'package:flutter_practice/constants/constants.dart';

void main() => runApp(MaterialApp(home: SplashPage()));

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> with TickerProviderStateMixin {

  Animation animation;
  AnimationController controller;
  AnimationStatusListener animationStatusListener;

  @override
  void initState() {
    super.initState();

    // 动画管理器
    controller = new AnimationController(
        duration: new Duration(milliseconds: 1500),
        vsync: this
    );

    // 动画
    animation = Tween(begin: 1.0, end: 0.5).animate(controller);

    animationStatusListener = (status) {
      if(status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainPage()),
                (router) => router == null
        );
      }
    };

    // 注册动画观察者
    animation.addStatusListener((status) => animationStatusListener(status));

    // 启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Image.asset(
        splashBackgroundImage,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    controller.removeStatusListener(animationStatusListener);
    controller.dispose();
    super.dispose();
  }

}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      home: MainNavigation(),
      theme: ThemeData(
        primarySwatch: Colors.green,
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          iconSize: 22,
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
    return new Text(_tabNames[index], style: TextStyle(fontSize: 11));
  }

  Color _tabColor(int index) {
    return _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
  }
}

