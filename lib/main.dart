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
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            tooltip: 'Navigation Menu',
            onPressed: null
        ),
        title: new Text('Flutter'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: 'Search',
              onPressed: null
          )
        ],
      ),
      body: new Center(
        child: new Text('Hello world'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null
      ),
    );
  }

}
