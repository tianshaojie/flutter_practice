import 'package:flutter/material.dart';

class SimpleListView extends StatelessWidget {

  final List<String> items = new List<String>.generate(10000, (i) => "Item ${i}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text("${items[index]}"),
            );
          }
      ),
    );
  }
}



//new Container(
//child: new ListView(
//shrinkWrap: true,
//children: <Widget>[
//new Container(
//color: Colors.red,
//height: 40,
//child: const Text('Domestic life was never quite my style'),
//),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),
//const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//const Text('Domestic life was never quite my style'),
//const Text('When you smile, you knock me out, I fall apart'),
//const Text('And I thought I was so smart'),
//],
//),
//)