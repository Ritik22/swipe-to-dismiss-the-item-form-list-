import 'package:flutter/material.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( title: 'flutter demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
        home :new MyHome()
    );

  }
}
class MyHome extends StatelessWidget {
  final  List<String> items = new List<String>.generate( 30,(i)=>"Items ${i+1}") ;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:new Text ("Swipe to dismiss"),
      ),
      body: new ListView.builder( itemCount: items.length,
          itemBuilder: (context,int index){
        return new Dismissible(key: new Key(items[index]),
            onDismissed:(direction){
          items.removeAt(index);
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(new SnackBar(
            content:new Text("item dismissed"),
            ));
            },
          background: new Container(
            color:Colors.limeAccent,
          ),
          child: new ListTile(title: new Text("${items[index]}"),
          ),
        );
          },

          ),
    );
  }
}
